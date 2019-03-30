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
                <c:if test="${sessionScope.user.identity == 0 }">
                    <a href="courseListByPage.do?pageSize=5&pageNum=1">活动管理</a>
                </c:if>

                <c:if test="${sessionScope.user.identity == 1 }">
                    <a href="courseListByTeacher.do?pageSize=5&pageNum=1&teacherId=${sessionScope.user.id}">活动管理</a>
                </c:if>
            </li>
            <li class="active">添加活动</li>
        </ul><!-- .breadcrumb -->


    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <form class="js_form form-horizontal" role="form" action="addCourse.do">

                    <!-- 所有 -->
                    <div class="form-group">
                        <label class="js_labelName col-sm-3 control-label no-padding-right">活动编号
                        </label>

                        <div class="col-sm-9">
                            <input type="text" name="coursenumber"
                                   class="js_coursenumber col-xs-10 col-sm-5" readonly="readonly" value=""/>
                        </div>
                    </div>
                    <div class="space-4"></div>

                    <c:if test="${sessionScope.user.identity == 0 }">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">所属组织
                            </label>

                            <div class="col-sm-9">
                                <select name="specialtyid" class="js_select_role col-xs-10 col-sm-5" id="form-field-1">
                                    <c:forEach items="${majors }" var="major">
                                        <option value="${major.id }">${major.name }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="space-4"></div>
                    </c:if>
                    <c:if test="${sessionScope.user.identity == 1 }">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">所属组织
                            </label>

                            <div class="col-sm-9">
                                <select name="specialtyid" class="js_select_role col-xs-10 col-sm-5" for="form-field-1">
                                    <c:forEach items="${majors }" var="major">
                                        <c:if test="${sessionScope.user.majorid == major.id}">
                                            <option value="${major.id }">${major.name }</option>
                                        </c:if>
                                    </c:forEach>
                                        <%--<c:forEach items="${majors }" var="major">
                                            <option value="${major.id }">${major.name }</option>
                                        </c:forEach>--%>
                                </select>
                            </div>
                        </div>
                        <div class="space-4"></div>
                    </c:if>


                    <c:if test="${sessionScope.user.identity == 0 }">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">申请人
                            </label>

                            <div class="col-sm-9">
                                <select name="teacherid" class="js_select_role col-xs-10 col-sm-5" for="form-field-1">
                                    <c:forEach items="${teachers }" var="teacher">
                                        <option value="${teacher.id }">${teacher.username }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="space-4"></div>
                    </c:if>


                    <c:if test="${sessionScope.user.identity == 1 }">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">申请人
                            </label>

                            <div class="col-sm-9">
                                <select name="teacherid" class="js_select_role col-xs-10 col-sm-5" for="form-field-1">
                                    <c:forEach items="${teachers }" var="teacher">
                                        <c:if test="${sessionScope.user.id==teacher.id}">
                                            <option value="${teacher.id }">${teacher.username }</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="space-4"></div>
                    </c:if>


                    <div class="form-group">
                        <label class="js_labelName col-sm-3 control-label no-padding-right">活动名称
                        </label>

                        <div class="col-sm-9">
                            <input type="text" name="name" class="js_coursename col-xs-10 col-sm-5"/>
                        </div>
                    </div>
                    <div class="space-4"></div>


                    <div class="form-group">
                        <label class="js_labelName col-sm-3 control-label no-padding-right">活动素拓分
                        </label>
                        <div class="col-sm-9">
                            <input type="text" name="credit" class="js_credit col-xs-10 col-sm-5"/>
                        </div>
                    </div>
                    <div class="space-4"></div>


                    <div class="form-group">
                        <label class="js_labelName col-sm-3 control-label no-padding-right">活动开始日期和时间
                        </label>
                        <div class="col-sm-9">
                            <input type="text" name="schooltime" readonly
                                   class="js_schooltime col-xs-10 col-sm-5" />
                        </div>
                    </div>


                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="js_labelName col-sm-3 control-label no-padding-right">活动地址
                        </label>
                        <div class="col-sm-9">
                            <input type="text" name="address" class="js_address col-xs-10 col-sm-5"/>
                        </div>
                    </div>


                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="js_labelName col-sm-3 control-label no-padding-right">活动可容纳人数
                        </label>
                        <div class="col-sm-9">
                            <input type="text" name="numberlimit"
                                   class="js_numberlimit col-xs-10 col-sm-5"/>
                        </div>
                    </div>


                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="js_labelName col-sm-3 control-label no-padding-right">活动详情:
                        </label>
                        <div class="col-sm-9">
                            <div>
                                <textarea id="form-field-11" name="detail"
                                          class="js_content col-xs-10 col-sm-5"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="space-4"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> 添加日期 </label>
                        <div class="col-sm-9">
                            <input id="form-field-3" type="text" readonly
                                   class="js_createTime col-xs-10 col-sm-5" value=""/>

                        </div>
                    </div>
                    <div class="space-4"></div>


                </form>
                <!---------------------------------提交按钮开始 ------------------------------->

                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <button class="btn btn-info" type="button" onclick="addCourse()">
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

    //绑定元素，使其点击能够使用laydate
//    laydate.render({
//        elem: '.js_createTime', //指定元素
//        format: 'yyyy-MM-dd',
//        value: new Date()
//    });

     laydate.render({
         elem: '.js_schooltime', //指定元素
         type: 'datetime',      //时间类型
         format: 'yyyy-MM-dd HH:MM',    //自定义时间
         trigger: 'click'   //只读
         ,min:0             //今天以后
     });
    /**
     添加活动
     */
    function addCourse() {
        var name = $.trim($(".js_coursename").val());
        if (name == "" || name == null) {
            layer.alert('请输入活动名!', {icon: 5});
            return;
        }

        var credit = $.trim($(".js_credit").val());
        if (credit == "" || credit == null) {
            layer.alert('请输入该活动素拓分!', {icon: 5});
            return;
        }

        var schooltime = $.trim($(".js_schooltime").val());
        if (schooltime == "" || schooltime == null) {
            layer.alert('请输入该活动时间!', {icon: 5});
            return;
        }


        var address = $.trim($(".js_address").val());
        if (address == null || address == "") {
            layer.alert('请输入活动地点!', {icon: 5});
            return;
        }
        var numberLimit = $.trim($(".js_numberlimit").val());
        if (numberLimit == null || numberLimit == "") {
            layer.alert('请选择该活动最大容量人数!', {icon: 5});
            return;
        }

        var createTime = $.trim($(".js_createTime").val());
        if (createTime == null || createTime == "") {
            layer.alert('请选择日期!', {icon: 5});
            return;
        }

        var course = $(".js_form").serialize();
        $.post($(".js_form").attr("action") + "?createTime=" + $(".js_createTime").val(), course, function (data) {
            if (data == true) {
                layer.alert('添加成功!', {icon: 6, time: 2000}, function () {
                    window.location.reload();
                });
            } else {
                layer.alert('添加失败!', {icon: 5});
            }
        });
    }

    window.onload = reload();
    function reload() {
        var date = new Date();
        $(".js_coursenumber").val(date.valueOf());
        $(".js_createTime").val(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
    }


</script>
</body>
</html>