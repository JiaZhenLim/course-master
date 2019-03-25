<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ch">
<%@ include file="../common/common.jsp" %>
<div class="main-content">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
        </script>

        <ul class="breadcrumb">
            <li>
                <i class="icon-home home-icon"></i>
                <a href="#">首页</a>
            </li>

            <li>
                <a href="myselfPage.do">个人中心</a>
            </li>
            <li class="active">修改密码</li>
        </ul><!-- .breadcrumb -->
    </div>
    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">旧密码
                        </label>

                        <div class="col-sm-9">
                            <input type="password" for="form-field-1" class="js_oldPwd col-xs-10 col-sm-5"/>
                        </div>
                    </div>

                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">新密码
                        </label>

                        <div class="col-sm-9">
                            <input type="password" for="form-field-1" class="js_newPwd col-xs-10 col-sm-5"/>
                        </div>
                    </div>

                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">确认密码
                        </label>

                        <div class="col-sm-9">
                            <input type="password" id="form-field-1" class="js_confirmPwd col-xs-10 col-sm-5"/>
                        </div>
                    </div>

                    <div class="space-4"></div>

                </form>

                <!---------------------------------提交按钮开始 ------------------------------->
                <div >
                    <div class="col-md-offset-3 col-md-9">
                        <%--修改密码提交--%>
                        <button class="btn btn-info" type="button" onclick="updatePwd()">
                            <i class="icon-ok bigger-110"></i>提交
                        </button>

                        <%--重置文本框--%>
                        &nbsp; &nbsp; &nbsp;
                        <button class="btn" type="reset" onclick="reset()">
                            <i class="icon-undo bigger-110"></i>重置
                        </button>
                    </div>
                </div>
                <!---------------------------------提交按钮结束      ------------------------------->
                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->

<script type="text/javascript">
    /**
     * 修改密码
     */
    function updatePwd() {
        var oldPwd = $(".js_oldPwd").val();
        if (oldPwd == "" || oldPwd == null) {
            layer.alert('请输入原密码!', {icon: 5});
            return;
        }

        var newPwd = $(".js_newPwd").val();
        if (newPwd == null || newPwd == "") {
            layer.alert('请输入新密码!', {icon: 5});
            return;
        }

        var confirmPwd = $(".js_confirmPwd").val();
        if (confirmPwd == null || confirmPwd == "") {
            layer.alert('请输入确认密码!', {icon: 5});
            return;
        }
        if (confirmPwd != newPwd) {
            layer.alert('密码不一致，请重新输入!', {icon: 5});
            $(".js_confirmPwd").val("");
            $(".js_newPwd").val("");
            return;
        }

        var mapVo = {};
        mapVo.oldPwd = oldPwd;
        mapVo.newPwd = newPwd;

        $.post("updatePwd.do", {'mapVo': mapVo}, function (data) {
            if (data.status == "success") {
                layer.msg(data.message, {icon: 6, time: 2000}, function () {
                    window.location.href = "myselfPage.do";
                });
            } else {
                layer.msg(data.message, {icon: 5}, function () {
                    window.location.reload();
                });
            }
        });
    }

    function reset(){
        $(".js_newPwd").val("");
        $(".js_oldPwd").val("");
        $(".js_confirmPwd").val("");
    }

</script>
</body>
</html>