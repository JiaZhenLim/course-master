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
                <c:if test="${sessionScope.user.identity == 0 }">
                    <a href="courseListByPage.do?pageSize=5&pageNum=1">活动管理</a>
                </c:if>

                <c:if test="${sessionScope.user.identity == 1 }">
                    <a href="courseListByTeacher.do?pageSize=5&pageNum=1&teacherId=${sessionScope.user.id}">活动管理</a>
                </c:if>

                <c:if test="${sessionScope.user.identity == 2 }">
                    <a href="courseListByStudent.do?pageNum=1&pageSize=5&isFinish=1&studentId=${sessionScope.user.id }">活动管理</a>
                </c:if>
            </li>
            <li class="active">活动列表</li>
        </ul><!-- .breadcrumb -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <!--  -->
                <!-- 搜索栏只有管理员能见 -->
                <c:if test="${sessionScope.user.identity == 0 }">
                    <div class="form-group" style="float:right;padding:0px 20px 0px 0px">
                        <label class="control-label no-padding-right" for="form-field-1">请选择
                        </label>
                        <select name="teacherid" class="js_select_teacher" for="form-field-1">
                            <option value="-1">所有</option>
                            <c:forEach items="${teachers }" var="teacher">
                                <option value="${teacher.id}"
                                        <c:if test="${teacher.id == teacherId}">selected</c:if>>${teacher.username }</option>
                            </c:forEach>
                        </select>

                        <select name="specialtyId" class="js_select_major" id="form-field-1">
                            <option value="-1">所有</option>
                            <c:forEach items="${majors }" var="major">
                                <option value="${major.id }"
                                        <c:if test="${major.id == specialtyId}">selected</c:if>>${major.name }</option>
                            </c:forEach>
                        </select>
                        <span class="input-icon">
							<input type="text" value="${search }" placeholder="活动名或者编号或组织或社团 ..."
                                   class="js_search nav-search-input" id="nav-search-input" autocomplete="off"/>
							<button class="btn btn-info" type="button" onclick="selectCourse(1)">
                                                    <i class="icon-search bigger-110"></i>搜索

                             </button>
                        </span>
                    </div>
                </c:if>

                <!-- 搜索栏结束 -->


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
                                    <th>活动编号</th>
                                    <th>活动名称</th>
                                    <%--<th>活动素拓分</th>--%>
                                    <c:if test="${sessionScope.user.identity != 2 }">
                                        <th>申请人</th>
                                    </c:if>
                                    <th>活动时间</th>
                                    <th>活动地址</th>
                                    <th>所属组织</th>
                                    <th>最大容量</th>
                                    <th>是否可选</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${courses}" var="course">
                                    <tr>
                                        <th class="center">
                                            <label>
                                                <input type="checkbox" class="ace" id="{user.userNumber}"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </th>
                                        <th>${course.courseNumber }</th>
                                        <th>${course.name }</th>
                                            <%--<th>${course.credit }</th>--%>
                                        <c:if test="${sessionScope.user.identity != 2 }">
                                            <th>${course.teachername }</th>
                                        </c:if>
                                        <th>${course.schooltime}</th>
                                        <th>${course.address }</th>
                                        <th>${course.mname }</th>
                                        <th>${course.numberLimit }</th>
                                        <c:if test="${sessionScope.user.identity == 0}">
                                            <c:if test="${course.isFinish == 1}">
                                                <th class="js_th${course.id }">可选</th>
                                            </c:if>
                                            <c:if test="${course.isFinish == 0}">
                                                <th class="js_th${course.id }">不可选</th>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${sessionScope.user.identity != 0}">
                                            <c:if test="${course.numberSpace > 0}">
                                                <th class="js_th${course.id }">可选|<font size="1"
                                                                                        face="微软雅黑">剩余容量(${course.numberSpace})</font>
                                                </th>
                                            </c:if>
                                            <c:if test="${course.numberSpace <= 0}">
                                                <th class="js_th${course.id }">不可选|<font color="#FF0000" size="1"
                                                                                         face="微软雅黑">人数已满</font></th>
                                            </c:if>
                                        </c:if>
                                        <th>${course.time }</th>
                                        <th>
                                            <!------------------ 管理员模块开始 ----------------------->
                                            <c:if test="${sessionScope.user.identity == 0 }">
                                                <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">

                                                    <a class="blue" href="addCoursePage.do">
                                                        <i class="icon-plus-sign bigger-130"></i>
                                                    </a>


                                                    <a class="green" href="editCoursePage.do?id=${course.id }">
                                                        <i class="icon-pencil bigger-130"></i>
                                                    </a>

                                                    <a class="red" href="javascript:void(0);"
                                                       onclick="deleteCourse(${course.id })">
                                                        <i class="icon-trash bigger-130"></i>
                                                    </a>

                                                    <label class="js_label${course.id }">
                                                        <input name="switch-field-1"
                                                               onChange="changeStatus(${course.id},${course.isFinish})"
                                                               <c:if test="${course.isFinish == 1}">checked</c:if>
                                                               class="js_isFinish${course.id } ace ace-switch ace-switch-4"
                                                               type="checkbox"/>
                                                        <span class="lbl"></span>
                                                    </label>
                                                </div>
                                            </c:if>
                                            <!------------------ 管理员模块结束 ----------------------->

                                            <!------------------ 组织或社团管理员模块开始 ----------------------->
                                            <c:if test="${sessionScope.user.identity == 1 }">
                                                <c:if test="${course.isAgree == 0 }">

                                                    <button class="btn  btn-sm btn-primary ">申请中</button>

                                                    <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close pull-right">
                                                    </ul>
                                                </c:if>
                                                <c:if test="${course.isAgree == null}">

                                                    <div class="inline dropdown-hover">
                                                        <button class="btn  btn-sm btn-danger "
                                                                onclick="applyEditCourse(${course.id })">申请活动
                                                        </button>

                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close pull-right">
                                                            <li>
                                                                <a href="javascript:void(0);"
                                                                   onclick="applyEditCourse(${course.id })"
                                                                   class="tooltip-success" data-rel="tooltip"
                                                                   title="Mark&nbsp;as&nbsp;done">
																					<span class="orange">申请
																					</span>
                                                                </a>
                                                            </li>
                                                        </ul>

                                                    </div>

                                                </c:if>

                                                <!--管理员同意 -->
                                                <c:if test="${course.isAgree == 1  && course.isChange == 1}">

                                                    <div class="inline dropdown-hover">
                                                        <button class="btn  btn-sm btn-success "
                                                                onclick="javascript:location='editCoursePage.do?id=${course.id }'">
                                                            申请成功
                                                        </button>

                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close pull-right">
                                                            <li>
                                                                <a href="editCoursePage.do?id=${course.id }"
                                                                   class="tooltip-success" data-rel="tooltip"
                                                                   title="Mark&nbsp;as&nbsp;done">
																					<span class="green">修改活动
																					</span>
                                                                </a>
                                                            </li>
                                                        </ul>

                                                    </div>
                                                </c:if>


                                                <c:if test="${course.isAgree == 1  && course.isChange == 2}">

                                                    <div class="inline dropdown-hover">
                                                        <button class="btn  btn-sm btn-success ">已修改</button>
                                                    </div>
                                                </c:if>

                                                <c:if test="${course.isAgree == 2 }"><!-- 管理员拒绝申请 -->

                                                    <div class="inline dropdown-hover">
                                                        <button class="btn  btn-sm btn-purple ">申请失败</button>

                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close pull-right">
                                                            <li>
                                                                <a href="javascript:void(0);"
                                                                   onclick="applyEditCourse(${course.id })"
                                                                   class="tooltip-success" data-rel="tooltip"
                                                                   title="Mark&nbsp;as&nbsp;done">
																					<span class="green">再次申请
																					</span>
                                                                </a>
                                                            </li>
                                                        </ul>

                                                    </div>
                                                </c:if>
                                            </c:if>
                                            <!------------------ 组织或社团管理员模块结束 ----------------------->


                                            <!------------------ 学生模块开始 ----------------------->
                                            <c:if test="${sessionScope.user.identity == 2 }">
                                                <c:if test="${course.studentCourseId != null && course.studentCourseId != ''}">
                                                    <button class="btn  btn-sm btn-danger "
                                                            onclick="deleteStudentCourse(${course.studentCourseId},${course.id })">
                                                        退选
                                                    </button>
                                                </c:if>

                                                <c:if test="${course.studentCourseId == null || course.studentCourseId == ''}">
                                                    <button class="btn  btn-sm btn-purple "
                                                            <c:if test="${course.numberSpace <= 0}">disabled</c:if>
                                                            onclick="addStudentCourse(${course.id},${sessionScope.user.id })">
                                                        选择活动
                                                    </button>
                                                </c:if>
                                            </c:if>
                                            <!------------------ 学生模块结束 ----------------------->


                                            <div class="visible-xs visible-sm hidden-md hidden-lg">
                                                <div class="inline position-relative">
                                                    <button class="btn btn-minier btn-yellow dropdown-toggle"
                                                            data-toggle="dropdown">
                                                        <i class="icon-caret-down icon-only bigger-120"></i>
                                                    </button>

                                                    <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                                                        <li>
                                                            <a href="#" class="tooltip-info" data-rel="tooltip"
                                                               title="View">
																<span class="blue">
																		<i class="icon-zoom-in bigger-120"></i>
																</span>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a href="#" class="tooltip-success" data-rel="tooltip"
                                                               title="Edit">
																<span class="green">
																	<i class="icon-edit bigger-120"></i>
																</span>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a href="#" class="tooltip-error" data-rel="tooltip"
                                                               title="Delete">
																<span class="red">
																	<i class="icon-trash bigger-120"></i>
																</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </th>
                                    </tr>

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

                        <!-- 分页开始 -->
                        <ul class="pagination pull-right no-margin">
                            <li class="prev">
                                <c:if test="${pageNum-1 <= 0}">

                                </c:if>
                                <c:if test='${pageNum > 1}'>

                                    <c:if test="${sessionScope.user.identity == 0 }">
                                        <a href="javascript:void(0);" onclick="selectCourse(${pageNum - 1})">
                                            <i class="icon-double-angle-left"></i>
                                        </a>
                                    </c:if>

                                    <c:if test="${sessionScope.user.identity == 1 }">
                                        <a href="courseListByTeacher.do?pageSize=5&pageNum=${pageNum-1}&teacherId=${sessionScope.user.id}">
                                            <i class="icon-double-angle-left"></i>
                                        </a>
                                    </c:if>

                                    <c:if test="${sessionScope.user.identity == 2 }">
                                        <a href="courseListByStudent.do?pageSize=5&isFinish=1&studentId=${sessionScope.user.id }&pageNum=${pageNum-1}">
                                            <i class="icon-double-angle-left"></i>
                                        </a>
                                    </c:if>

                                </c:if>
                            </li>

                            <!-- forEach标签开始 -->

                            <c:if test="${pageNum+4 <= totalPage}">
                                <c:forEach var="page" begin="${pageNum}" end="${pageNum +4 }">
                                    <li>
                                        <c:if test="${sessionScope.user.identity == 0 }">
                                            <a href="javascript:void(0);" onclick="selectCourse(${page})"
                                               value="${page }">${page }</a>
                                        </c:if>

                                        <c:if test="${sessionScope.user.identity == 1 }">
                                            <a href="courseListByTeacher.do?pageSize=5&teacherId=${sessionScope.user.id}&pageNum=${page}">${page }</a>
                                        </c:if>

                                        <c:if test="${sessionScope.user.identity == 2 }">
                                            <a href="courseListByStudent.do?pageSize=5&isFinish=1&studentId=${sessionScope.user.id }&pageNum=${page}">${page}</a>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </c:if>

                            <c:if test="${pageNum+4> totalPage}">
                                <c:forEach var="page" begin="${pageNum}" end="${totalPage }">
                                    <li>
                                        <c:if test="${sessionScope.user.identity == 0 }">
                                            <a href="javascript:void(0);" onclick="selectCourse(${page})">${page }</a>
                                        </c:if>

                                        <c:if test="${sessionScope.user.identity == 1 }">
                                            <a href="courseListByTeacher.do?pageSize=5&teacherId=${sessionScope.user.id}&pageNum=${page}">${page }</a>
                                        </c:if>

                                        <c:if test="${sessionScope.user.identity == 2 }">
                                            <a href="courseListByStudent.do?pageSize=5&isFinish=1&studentId=${sessionScope.user.id }&pageNum=${page}">${page}</a>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <!-- forEach标签结束 -->

                            <c:if test="${pageNum < totalPage}">
                                <li class="next">
                                    <c:if test="${sessionScope.user.identity == 0 }">
                                        <a href="javascript:void(0);" onclick="selectCourse(${pageNum + 1})">
                                            <i class="icon-double-angle-right"></i>
                                        </a>
                                    </c:if>

                                    <c:if test="${sessionScope.user.identity == 1 }">
                                        <a href="courseListByTeacher.do?pageSize=5&pageNum=${pageNum+1}&teacherId=${sessionScope.user.id}">
                                            <i class="icon-double-angle-right"></i>
                                        </a>
                                    </c:if>

                                    <c:if test="${sessionScope.user.identity == 2 }">
                                        <a href="courseListByStudent.do?pageSize=5&isFinish=1&studentId=${sessionScope.user.id }&pageNum=${pageNum+1}">
                                            <i class="icon-double-angle-right"></i>
                                        </a>
                                    </c:if>
                                </li>
                            </c:if>
                            <c:if test="${pageNum >= totalPage}">

                            </c:if>
                        </ul>
                        <!-- 分页结束-->
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->
<script type="text/javascript">

    /*---------------------------组织或社团管理员开始-----------------------------*/


    /**
     *跳转申请修改的页面
     */
    function applyEditCourse(id) {
        window.location.href = "addTeacherCoursePage.do?id=" + id;
    }

    /*---------------------------组织或社团管理员结束-----------------------------*/


    /*---------------------------管理员-----------------------------*/


    $(function () {
        /**
         * 改变显示的内容
         */
        $(".js_select_teacher").change(function () {
            selectCourse(1);
        });
        $(".js_select_major").change(function () {
            selectCourse(1);
        });
    });

    function selectCourse(pageNum) {
        var search = $(".js_search").val();
        var teacherId = $(".js_select_teacher").val();
        var specialtyId = $(".js_select_major").val();
        window.location.href = "courseListBySearch.do?pageNum=" + pageNum + "&pageSize=5&search=" + search + "&specialtyId=" + specialtyId + "&teacherId=" + teacherId;
    }


    function changeStatus(id, isFinish) {
        var finish = 0;
        var clazz = ".js_isFinish" + id;
        if (isFinish == 0) {//原来为没有选中，点击按钮后，让它选中
            $(clazz).attr("checked", true);
            finish = 1;
        } else {//原来选中，点击按钮后，让它不选中
            $(clazz).attr("checked", false);
        }
        var user = {};
        user.id = id;
        user.isfinish = finish;

        $.post("editStatus.do", user, function (data) {
            var label = ".js_label" + id;
            if (data == true) {
                if (finish == 1) {
                    var html = "<input name='switch-field-1' onChange='changeStatus(" + id + "," + finish + ")' checked class='js_isFinish" + id + " ace ace-switch ace-switch-4' type='checkbox' />";
                    $(".js_th" + id).text("可选");
                    layer.alert('该门活动可以选择了!', {icon: 6, time: 2000});
                } else {
                    var html = "<input name='switch-field-1' onChange='changeStatus(" + id + "," + finish + ")' class='js_isFinish" + id + " ace ace-switch ace-switch-4' type='checkbox' />";
                    $(".js_th" + id).text("不可选");
                    layer.alert('该门活动选择时间结束了!', {icon: 5});
                }
                $(clazz).replaceWith(html);
            } else {
                layer.alert('系统错误!', {icon: 5});
            }
        });

    }


    /*
     *删除活动
     */
    function deleteCourse(id) {
        layer.confirm('确认要删除吗?', {icon: 3, title: '提示'}, function () {
            $.post("deleteCourse.do", {"id": id}, function (data) {
                if (data == true) {
                    layer.msg('删除成功!', {icon: 6, time: 2000}, function () {
                        history.go(0);
                    });
                } else {
                    layer.msg("删除失败!", {icon: 5});
                }
            });
        });
        //e
    }

    /*---------------------------管理员结束-----------------------------*/


    /*---------------------------学生开始-----------------------------*/
    function deleteStudentCourse(id, courseId) {
        layer.confirm('确认要退选吗?', {icon: 3, title: '提示'}, function () {
            $.post("deleteStudentCourse.do", {"id": id, "courseId": courseId}, function (data) {
                if (data == true) {
                    layer.msg('退选成功!', {icon: 6, time: 1000}, function () {
                        history.go(0);
                    });
                } else {
                    layer.msg("退选失败!", {icon: 5});
                }
            });
        });
    }


    function addStudentCourse(courseId, studentId) {
        var studentCourse = {};
        studentCourse.courseid = courseId;
        studentCourse.studentid = studentId;
        layer.confirm('确认要选该门活动吗?', {icon: 3, title: '提示'}, function () {
            $.post("addStudentCourse.do", studentCourse, function (data) {
                if (data == "exist") {
                    layer.msg('您已经选过该活动!', {icon: 5, time: 1000});
                } else if (data == "success") {
                    layer.msg('选择成功!', {icon: 6, time: 1000}, function () {
                        history.go(0);
                    });
                } else {
                    layer.msg("选择失败!", {icon: 5});
                }
                history.go(0);
            });
        });
    }

    /*---------------------------学生结束-----------------------------*/

</script>
</body>
</html>