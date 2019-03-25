function login() {

    // 获取选择的身份，登陆账号和密码
    var value = $('.button-group input[name="identity"]:checked').val();
    var userNumber = $("#userNumber").val().trim();
    var password = $("#userpwd").val();

    // 账号验证
    if ($.trim(userNumber) == "" || userNumber == undefined || userNumber == null) {
        layer.alert('账号不能为空，请输入!', {icon: 5});
        return;
    }
    var re = /^[0-9]{3,13}$/;
    if (!re.test(userNumber)) {
        $("#userNumber").val("");
        layer.alert('账号格式错误，账号为3-15位纯数字组成，请重新输入', {icon: 5});
        return;
    }

    // 密码验证
    if (password == "" || password == undefined || password == null) {
        layer.alert('密码不能为空，请输入!', {icon: 5});
        return;
    }
    if (password.length < 2 || password.length > 20) {
        $("#userpwd").val("");
        layer.alert('密码格式错误，密码的长度在2-20位之间，请重新输入!', {icon: 5});
        return;
    }

    var user = {};
    user.usernumber = userNumber;
    user.password = password;
    user.identity = value;

    // 账号密码验证
    $.post("login.do", user, function (result) {

        if (result == "passwordError") {
            $("#userpwd").val("");
            layer.alert('密码错误!', {icon: 5});
            return;
        } else if (result == "roleError") {
            layer.alert('您的账号和身份不符合!', {icon: 5});
            return;
        } else if (result == "success") {
            layer.msg('恭喜你，登录成功!', {
                icon: 6,
                time: 1000,
                title: '提示'//2秒关闭（如果不配置，默认是3秒）
            }, function () {
                if(user.identity != 2){
                    window.location.href = "myselfPage.do";
                }else{
                    window.location.href = "indexPage.do";
                }
            });
        } else {
            $("#userNumber").val("");
            $("#userpwd").val("");
            layer.alert("账号不存在!", {icon: 5});
        }
    });
}