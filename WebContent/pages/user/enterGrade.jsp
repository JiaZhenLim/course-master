<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
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
                <a href="pages/personalCenter/myself.jsp">首页</a>
            </li>

            <li>
                <a href="javascript:void(0);" onclick="selectStudent(${pageNum})">用户管理
                </a>
            </li>
            <li class="active">用户列表</li>
        </ul><!-- .breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div class="form-group" style="float:right;padding:0px 20px 0px 0px">
                    <input type="hidden" value="${sessionScope.user.id}" class="js_userid"/>
                    <!-- 组织或社团管理员显示的下拉框开始 -->
                    <c:if test="${sessionScope.user.identity == 1}">
                        <label class="control-label no-padding-right" for="form-field-1">请选择:</label>
                        <select name="courseid" value="${courseId }" class="js_select_course" id="form-field-1">
                            <option value="-1" selected>所有</option>
                            <c:forEach items="${courses }" var="course">
                                <option value="${course.id }"
                                        <c:if test="${course.id == courseId}">selected</c:if>>${course.name }</option>
                            </c:forEach>
                        </select>

                    </c:if>
                    <!-- 组织或社团管理员显示的下拉框开结束-->

                    <!-- 组织或社团管理员显示的搜索栏开始 -->
                    <c:if test="${sessionScope.user.identity == 1}">
											<span class="input-icon">
												<input type="text" value="${search }" placeholder="活动名或编号或者姓名 ..."
                                                       class="js_search nav-search-input" id="nav-search-input"
                                                       autocomplete="off"/>
												<button class="btn btn-info" type="button" onclick="selectStudent(1)">
                                                    <i class="icon-search bigger-110"></i>
                                                    搜索
                                                </button>
											</span>

                    </c:if>

                    <!-- 组织或社团管理员显示的搜索栏结束 -->
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="table-responsive">
                            <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center">
                                        <label>
                                            <input type="checkbox" class="ace" onclick="allOrNotAll(checked)"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </th>
                                    <th>学号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>学院</th>
                                    <th>已选择的活动名</th>
                                    <th>邮箱地址</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${users}" var="user">
                                <tr>
                                    <td class="center">
                                        <input type="checkbox" class="ace" name="check" id="{user.userNumber}"/>
                                        <span class="lbl"></span>
                                    </td>
                                    <td>${user.userNumber }</td>
                                    <td name="name_td">${user.username }</td>
                                    <c:if test="${user.sex == 1}">
                                    <th class="js_th">男</th>
                                    </c:if>
                                    <c:if test="${user.sex == 2}">
                                    <th class="js_th">女</th>
                                    </c:if>
                                    <td>${user.collname }</td>
                                    <td name="courseName_td">${user.courseName}</td>
                                    <!-- 发送邮件 -->
                                    <td name="email_td">${user.email}</td>

                                        <%--<th>
                                                    <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                        <div class="form-group">
                                                            <div class="col-sm-9">
                                                                <c:if test="${user.grade != null }">
                                                                    <label><b>${user.grade}</b></label>
                                                                </c:if>
                                                                <c:if test="${user.grade == null }">
                                                                    <input id="form-field-3" type="text" userId="${user.id }"
                                                                           courseId="${user.courseId}"
                                                                           class="js_input col-xs-10 col-sm-5"/>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </th>--%>

                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer no-margin-top">

                        <!-- 左侧开始 -->
                        <label class="pull-left" data-dismiss="modal">
                            第<b>${pageNum}</b>页，总共<b>${count}</b>条数据
                        </label>
                        <!-- 左侧结束 -->
                        <%-- <!---------------------------------提交按钮开始 ------------------------------->
                         <div style="text-align:center;">
                             <button class="btn btn-info" type="button" onclick="">
                                 <i class="icon-ok bigger-110"></i>
                                 通知
                             </button>

                             &nbsp; &nbsp; &nbsp;
                             <button class="btn" type="reset" onclick="reset()">
                                 <i class="icon-undo bigger-110"></i>
                                 重置
                             </button>
                         </div>
                         <!---------------------------------提交按钮结束      ------------------------------->--%>
                        <!-- 分页开始 -->
                        <ul class="pagination pull-right no-margin">

                            <li class="prev">
                                <c:if test="${pageNum-1 <= 0}">

                                </c:if>
                                <c:if test='${pageNum > 1}'>
                                    <a href="javascript:void(0);" onclick="selectStudent(${pageNum - 1})">
                                        <i class="icon-double-angle-left"></i>
                                    </a>
                                </c:if>
                            </li>

                            <!-- forEach标签开始 -->

                            <c:if test="${pageNum+4 <= totalPage}">
                                <c:forEach var="page" begin="${pageNum}" end="${pageNum +4 }">
                                    <li>
                                        <a href="javascript:void(0);" onclick="selectStudent(${page})"
                                           value="${page }">${page }</a>
                                    </li>
                                </c:forEach>
                            </c:if>

                            <c:if test="${pageNum+4> totalPage}">
                                <c:forEach var="page" begin="${pageNum}" end="${totalPage }">
                                    <li>
                                        <a href="javascript:void(0);" onclick="selectStudent(${page})">${page }</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <!-- forEach标签结束 -->

                            <c:if test="${pageNum < totalPage}">
                                <li class="next">
                                    <a href="javascript:void(0);" onclick="selectStudent(${pageNum + 1})">
                                        <i class="icon-double-angle-right"></i>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageNum >= totalPage}">

                            </c:if>
                        </ul>
                        <!-- 分页结束-->
                    </div>
                </div>
                <!-- PAGE CONTENT ENDS -->

            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
    <%--
    发送邮件按钮，点击向选中的学生发送邮件
    获取被选中的学生学号，
    数据库通过学生学号找到对应的邮箱地址
    --%>
    <div>
        <button onclick="sendMail()">
            发送邮件
        </button>
    </div>
</div><!-- /.main-content -->
<script type="text/javascript">

    /*------------组织或社团管理员模块开始---------------*/

    /*function addGrade() {
     var studentCourses = [];
     $(".js_input").each(function () {
     var grade = $.trim($(this).val());
     var studentId = $(this).attr("userId");
     var courseId = $(this).attr("courseId");
     var studentCourse = {};

     if (grade != null && grade != "") {
     studentCourse.grade = grade;
     studentCourse.studentid = studentId;
     studentCourse.courseid = courseId;
     studentCourses.push(studentCourse);
     }
     });
     $.post("addGrades.do", {"studentCourses": JSON.stringify(studentCourses)}, function (data) {//批量添加成绩
     if (data == true) {
     layer.msg('批量录入成绩成功!', {icon: 6, time: 1000}, function () {
     history.go(0);
     });
     } else {
     layer.msg('批量录入成绩失败!', {icon: 5, time: 1000}, function () {
     history.go(0);
     });
     }
     });
     }*/


    function deleteStudent(id) {
        layer.confirm('确认要删除该学生吗?', {icon: 3, title: '提示'}, function () {
            $.post("deleteStudentCourse.do", {"id": id}, function (data) {
                if (data == true) {
                    layer.msg('删除成功!', {icon: 6, time: 1000}, function () {
                        history.go(0);
                    });
                } else {
                    layer.msg("删除失败!", {icon: 5});
                }
            });
        });
    }


    layer.config({
        extend: 'extend/layer.ext.js'
    });
    function addStudent(id) {
        layer.prompt({
            formType: 0,
            title: '请输入学号'
        }, function (value, index, elem) {
            $.post("teacherAddStudentCourse.do", {"courseId": id, "userNumber": value}, function (data) {
                layer.close(index);
                if (data == "notExist") {
                    layer.msg("学号不存在!", {icon: 5});
                } else if (data == "exist") {
                    layer.msg("该学生已选过!", {icon: 5});
                } else if (data == "success") {
                    layer.msg('添加成功!', {icon: 6, time: 1000}, function () {
                        history.go(0);
                    });
                } else {
                    layer.msg("添加失败!", {icon: 5});
                }
            });
        });

    }
    /*------------组织或社团管理员模块结束---------------*/

    /**
     * 改变显示的内容
     */
    $(function () {
        $(".js_select_course").change(function () {
            selectStudent(1);
        });
    });

    function selectStudent(pageNum) {
        var search = $(".js_search").val();
        var courseId = $(".js_select_course").val();
        var teacherId = $(".js_userid").val();
        window.location.href = "studentListBySearchGradePage.do?pageNum=" + pageNum + "&pageSize=5&search=" + search + "&courseId=" + courseId + "&teacherId=" + teacherId;
    }


    /***
     * 发送邮件
     */
    function sendMail() {
        var emails = new Array();
        var names = new Array();
        var courseNames = new Array();
        var i = 0;
        $("input[name='check']:checked").each(
            function () {
                //获取所在的行
                var row = $(this).parent("td").parent("tr");
                var email = row.find("[name='email_td']").text();
                var courseName = row.find("[name='courseName_td']").text();
                var name = row.find("[name='name_td']").text();

                console.log(email);
                console.log(courseName);
                emails[i] = email;
                courseNames[i] = courseName;
                names[i++] = name;


            }
        );

        console.log("String", emails);
        $.ajax(
            {
                // 使用post方法只能用这个发送，并且data不需要用JSON.stringify({name:value})方法传输
                //发送的数据内容类型，默认为此
                contextType: "application/x-www-form-urlencoded",
                data: {
                    receivers: emails,
                    names: names,
                    courseNames: courseNames
                },//发送的数据
                type: 'POST',
                url: "sendMail.do",//没错
                async: true,
                dataType: "text",//预期响应的文本数据类型
                success: function (str) {
                    if (str !== "sending success") {
                        layer.alert('发送失败', {icon: 5});
                    }
                    else {
                        layer.alert('发送成功', {icon: 6});
                    }
                    console.log(str);
                },
                error: function () {
                    layer.alert('发送失败', {icon: 5});
                }
            }
        );
        console.log("异步发送已经加载完");
//        window.location.href = "?receivers=" + str;

    }


</script>
</body>
</html>