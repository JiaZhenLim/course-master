<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="icon-leaf"></i>
                    <c:if test="${sessionScope.user.identity == 2 }">
                        学生活动管理
                    </c:if>
                    <c:if test="${sessionScope.user.identity != 2 }">
                        后台管理系统
                    </c:if>
                </small>
            </a>
        </div>

        <%--右侧登陆状态--%>
        <div class="navbar-header pull-right " role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="${ctx }/${sessionScope.user.imageurl}" alt="your Photo"/>
                        <span class="user-info">
                            <small>Welcome,</small>
                            <small>${sessionScope.user.username}</small>
                        </span>
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="myselfPage.do">
                                <i class="icon-cog"></i>个人中心
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="exit.do">
                                <i class="icon-off"></i>退出登陆
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>