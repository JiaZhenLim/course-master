<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            <li class="active">个人信息</li>
        </ul>
    </div>

    <%--显示个人信息--%>
    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <form class="form-horizontal" role="form">

                    <%--显示头像--%>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">我的头像:</label>
                        <div class="col-sm-9">
                            <label class="col-sm-5 col-xs-10">
                                <img src="${ctx }/${sessionScope.user.imageurl}" class="js_imgUrl img-circle"
                                     width="140" height="140">
                            </label>
                        </div>
                    </div>

                    <%--显示学号或者工号--%>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">
                            <c:if test="${sessionScope.user.identity  ==2}">学号:</c:if>
                            <c:if test="${sessionScope.user.identity  != 2}">工号:</c:if>
                        </label>
                        <div class="col-sm-9">
                            <label class="col-sm-5 col-xs-10">
                                ${sessionScope.user.usernumber}</label>
                        </div>
                    </div>

                    <%--显示姓名--%>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">姓名:</label>
                        <div class="col-sm-9">
                            <label class="col-sm-5 col-xs-10">
                                ${sessionScope.user.username}</label>
                        </div>
                    </div>

                    <%--显示性别--%>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> 性别:</label>
                        <div class="col-sm-9">
                            <c:if test="${sessionScope.user.sex == 1}"><label
                                    class="col-sm-5 col-xs-10">男</label></c:if>
                            <c:if test="${sessionScope.user.sex == 2}"><label
                                    class="col-sm-5 col-xs-10">女</label></c:if>
                            <c:if test="${sessionScope.user.sex == 0}"><label
                                    class="col-sm-5 col-xs-10">未知</label></c:if>
                        </div>
                    </div>


                    <%--显示创建日期--%>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> 新建日期 :</label>
                        <div class="col-sm-9">
                            <label class="col-sm-5 col-xs-10">
                                <fmt:formatDate value='${sessionScope.user.createtime}' type="date"
                                                pattern='yyyy-MM-dd'/></label>
                        </div>
                    </div>

                    <div class="space-4"></div>
                </form>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->

<%--如果头像修改，则提示修改成功或者失败--%>
<script type="text/javascript">
    if ("${sessionScope.error}") {
        layer.msg('${sessionScope.error}', {
            offset: 0,
            shift: 6
        });
        sessionStorage.removeItem('error');
    }

    if ("${sessionScope.message}") {
        layer.msg('${sessionScope.message}', {
            offset: 0
        });
        ${sessionScope.remove('message')};
    }
</script>
</body>
</html>