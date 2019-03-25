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
                <a href="pages/personalCenter/myself.jsp">首页</a>
            </li>

            <li>
                <a href="userListByPage.do?pageSize=10&pageNum=1&identity=2">用户管理</a>
                <!--<a href="userListByPage.do">用户管理</a>-->
            </li>
            <li class="active">添加用户</li>
        </ul><!-- .breadcrumb -->

        <!-- <div class="nav-search" id="nav-search">
            <form class="form-search">
                <span class="input-icon">
                    <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                    <i class="icon-search nav-search-icon"></i>
                </span>
            </form>
        </div> --><!-- #nav-search -->
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form class="js_form form-horizontal" role="form" action="addUser.do">
                    <!-- 所有 -->
                    <div class="form-group">
                        <div class="space-4"></div>
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户角色
                        </label>

                        <div class="col-sm-9">
                            <select name="identity" class="js_select_role col-xs-10 col-sm-5" for="form-field-1">
                                <option selected>-------请选择-------</option>
                                <option value="2">学生</option>
                                <option value="1">组织或社团管理员</option>
                                <option value="0">系统管理员</option>
                            </select>
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="js_labelName col-sm-3 control-label no-padding-right" for="form-field-1">学号
                        </label>

                        <div class="col-sm-9">
                            <input type="text" name="usernumber" for="form-field-1"
                                   class="js_usernumber col-xs-10 col-sm-5"/>
                        </div>
                    </div>
                    <div class="space-4"></div>


                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">姓名
                        </label>

                        <div class="col-sm-9">
                            <input type="text" name="username" for="form-field-1"
                                   class="js_username col-xs-10 col-sm-5"/>
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class=" col-sm-3 control-label no-padding-right" for="form-field-1">初始密码
                        </label>

                        <div class="col-sm-9">
                            <input type="password" name="password" for="form-field-1"
                                   class="js_password col-xs-10 col-sm-5"/>
                        </div>
                    </div>
                    <div class="space-4"></div>


                    <!-- 所有 -->


                    <!-- 学生开始 -->
                    <div class="js_form_student">

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">学院
                            </label>
                            <%--<label class="col-sm-3 control-label no-padding-right" for="form-field-1">班级
                            </label>--%>

                            <div class="col-sm-9">
                                <select name="collegeid" class="js_select col-xs-10 col-sm-5" id="form-field-1">
                                    <c:forEach items="${college}" var="colleges">
                                        <option value="${colleges.id}">${colleges.name }</option>
                                    </c:forEach>
                                    <%--<c:forEach items="${classes}" var="clazz">
                                        <option value="${clazz.id}">${clazz.name }</option>
                                    </c:forEach>--%>
                                </select>
                            </div>
                        </div>
                        <div class="space-4"></div>
                    </div>
                    <!-- 学生结束 -->


                    <!-- 组织社团管理员或管理员开始 -->
                    <div class="js_form_user">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">所属组织
                            </label>

                            <div class="col-sm-9">
                                <select name="majorid" class="js_select col-xs-10 col-sm-5" for="form-field-1">
                                    <c:forEach items="${major}" var="majors">
                                        <option value="${majors.id}">${majors.name }</option>
                                    </c:forEach>
                                    <%--<c:forEach items="${classes}" var="clazz">
                                        <option value="${clazz.id}">${clazz.name }</option>
                                    </c:forEach>--%>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">所属社团
                            </label>

                            <div class="col-sm-9">
                                <select name="majorid" class="js_select col-xs-10 col-sm-5" for="form-field-1">
                                    <option>无社团</option>
                                    <c:forEach items="${classes}" var="clazz">
                                        <option value="${clazz.id}">${clazz.name }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- 组织社团管理员或管理员结束 -->


                    <!-- 所有 -->
                    <div class="form-group">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" id="form-field-2"> 性别:</label>
                            <div class="col-sm-9">
                                <label>
                                    <input name="sex" type="radio" checked value="1" class="ace js_radio"/>
                                    <span class="lbl">男</span>
                                </label>
                                <label>
                                    <input name="sex" type="radio" value="2" class="ace js_radio"/>
                                    <span class="lbl">女</span>
                                </label>
                                <label>
                                    <input name="sex" type="radio" value="0" class="ace js_radio"/>
                                    <span class="lbl">不设置</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 注册日期 </label>

                        <div class="col-sm-9">
                            <input id="form-field-3" type="text" onclick="laydate()"
                                   class="js_createTime col-xs-10 col-sm-5"/>
                        </div>
                    </div>

                    <div class="space-20"></div>


                    <!-- 所有 -->
                </form>
                <!---------------------------------提交按钮开始 ------------------------------->

                <div class="clearfix form-actions text-center">
                    <div class="col-md-12">
                        <button class="btn btn-info" type="button" onclick="addUser()">
                            <i class="icon-ok bigger-110"></i>
                            提交
                        </button>

                        &nbsp; &nbsp; &nbsp;
                        <button class="btn" type="reset" onclick="reset()">
                            <i class="icon-undo bigger-110"></i>
                            重置
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
     * 改变显示的内容
     */
    $(function () {
        $(".js_select_role").change(function () {
            if ($(".js_select_role").val() != 2) {
                if ($(".js_select_role").val() == 0) {
                    $(".js_form_user").hide();
                    $(".js_form_student").hide();
                    $(".js_labelName").text("帐号");
                }else {
                    $(".js_form_user").show();
                    $(".js_form_student").hide();
                    $(".js_labelName").text("帐号");
                }
            } else {
                $(".js_form_user").hide();
                $(".js_form_student").show();
                $(".js_labelName").text("学号");
            }
            /*if ($(".js_select_role").val() != 1) {
                $(".js_form_user").hide();
            }*/
        });

    });


    /**
     添加用户
     */
    function addUser() {
// 			$(".js_form").submit();

        var usernumber = $.trim($(".js_usernumber").val());
        if (usernumber == "" || usernumber == null) {
            layer.alert('请输入账号!', {icon: 5});
            return;
        }

        var name = $.trim($(".js_username").val());
        if (name == "" || name == null) {
            layer.alert('请输入用户名!', {icon: 5});
            return;
        }

        var password = $.trim($(".js_password").val());
        if (password == "" || password == null) {
            layer.alert('请输入密码!', {icon: 5});
            return;
        }

        var createTime = $.trim($(".js_createTime").val());
        if (createTime == null || createTime == "") {
            layer.alert('请选择日期!', {icon: 5});
            return;
        }

        var user = $(".js_form").serialize();
        $.post($(".js_form").attr("action") + "?createTime=" + $(".js_createTime").val(), user, function (data) {
            if (data == true) {
                layer.alert('添加成功!', {icon: 6, time: 2000}, function () {
                    window.location.reload();
                });
            } else {
                layer.alert('添加失败!', {icon: 5});
            }
        });
    }


    /*设置日历颜色*/
    laydate.skin('molv');
</script>
</body>
</html>