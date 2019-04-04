<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html lang="ch">
<head>
    <title>活动发布平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,600,700" rel="stylesheet">

    <!-- Stylesheets -->

    <link href="../plugin-frameworks/bootstrap.css" rel="stylesheet">

    <link href="../fonts/ionicons.css" rel="stylesheet">

    <link href="../common/styles.css" rel="stylesheet">

</head>
<body>

<header>
    <div class="top-header">
        <div class="container">
            <div class="oflow-hidden font-9 text-sm-center ptb-sm-5">
                <ul class="float-left float-sm-none list-a-plr-10 list-a-plr-sm-5 list-a-ptb-15 list-a-ptb-sm-10 list-a-ptb-xs-5">
                    <li><a class="pl-0 pl-sm-10" href="#">
                        <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=5" width="106"
                                height="18" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
                    </a></li>
                    <%
                        Date d = new Date();
                        SimpleDateFormat df = new SimpleDateFormat("EEEE");
                        SimpleDateFormat df1 = new SimpleDateFormat("dd");
                        SimpleDateFormat df2 = new SimpleDateFormat("MM");
                        SimpleDateFormat df3 = new SimpleDateFormat("yyyy");
                        String week = df.format(d);
                        String day = df1.format(d);
                        String mounth = df2.format(d);
                        String year = df3.format(d);
                    %>
                    <li><a href="#"><%=year %>年, <%=mounth %>月<%=day %>日, <%=week %>
                    </a></li>
                    <li>
                        <div id="time"><a href="#"><span id="showTime"></span></a></div>
                    </li>
                </ul>

                <ul class="float-right float-sm-none font-20 list-a-plr-10 list-a-plr-sm-5 list-a-ptb-15 list-a-ptb-sm-5 color-ash">
                    <c:if test="${sessionScope.user.username == null }">
                        <li><a class="pl-0 pl-sm-10" href="../login.html">登录
                            <small>Login</small>
                        </a></li>
                    </c:if>
                    <c:if test="${sessionScope.user.username != null }">
                        <span>
							<small>Welcome,</small>
								${sessionScope.user.username}
						</span>
                    </c:if>


                    <%--<li><a href="#"><i class="ion-social-twitter"></i></a></li>
                    <li><a href="#"><i class="ion-social-pinterest"></i></a></li>
                    <li><a href="#"><i class="ion-social-google"></i></a></li>
                    <li><a href="#"><i class="ion-social-rss"></i></a></li>--%>
                </ul>

            </div><!-- top-menu -->
        </div><!-- container -->
    </div><!-- top-header -->

    <%--<div class="banner-area1">--%>


    <%-- <div class="middle-header mtb-20 mt-xs-0">
         <div class="container" >
             <div class="row">

                 <div class="col-sm-4">
                     <img src="images/logo5.png" alt="Logo">
                     <img src="images/logo6.png" alt="Logo">
                 </div>
                 <img src="images/bg2.png" alt="Logo1">--%>

    <%--<div class="col-sm-8">
        <!-- Bannner bg -->
        <div class="banner-area dplay-tbl plr-30 plr-md-10 color-white">
            <div class="ptb-sm-15 dplay-tbl-cell">
                <h5>enrich your university life</h5>
                &lt;%&ndash;<h6>Discover the latest properties of australia</h6>&ndash;%&gt;
            </div><!-- left-area -->

            <div class="dplay-tbl-cell text-right min-w-100x">
                <a class="btn-fill-white btn-b-sm plr-10" href="#">READ MORE</a>
            </div><!-- right-area -->
        </div><!-- banner-area -->
 <%--   </div>&ndash;%&gt;<!-- col-sm-8 -->
</div><!-- row -->
</div><!-- container -->
</div><!-- top-header -->--%>
    <%--</div>--%>
    <div id="banner" class="major ">
        <section>
            <div class="bottom-menu">
                <div class="container">
                    <%--<img style="background-size: 100%" src="images/bg7.png">--%>
                    <ul class="main-menu" for="main-menu">

                        <li><a href="index.jsp">首页</a></li>

                        <li class="drop-down"><a href="#!">计算机学院<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#two1">计算机学生会</a></li>
                                <li><a href="#two2">计算机团委</a></li>
                                <li><a href="#two3">计算机党建办公室</a></li>
                                <li><a href="#two4">计算机记者团</a></li>
                            </ul>
                        </li>
                        <li class="drop-down"><a href="#!">电信学院<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#three1">电子学生会</a></li>
                                <li><a href="#three2">电子团委</a></li>
                            </ul>
                        </li>
                        <li class="drop-down"><a href="#!">机电学院<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#four1">机电学生会</a></li>
                                <li><a href="#four2">机电团委</a></li>
                            </ul>
                        </li>
                        <li class="drop-down"><a href="#!">材食学院<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#five1">材食学生会</a></li>
                                <li><a href="#five2">材食团委</a></li>
                            </ul>
                        </li>
                        <li class="drop-down"><a href="#!">人文学院<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#six1">人文学生会</a></li>
                                <li><a href="#six2">人文团委</a></li>
                            </ul>
                        </li>
                        <li class="drop-down"><a href="#!">管理学院<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#seven1">管理学院学生会</a></li>
                                <li><a href="#seven2">管理学院团委</a></li>
                            </ul>
                        </li>
                        <li class="drop-down"><a href="#!">经贸学院<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#eight1">经贸学生会</a></li>
                                <li><a href="#eight2">经贸团委</a></li>
                            </ul>
                        </li>
                        <li class="drop-down"><a href="#!">外国语学院<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#nine1">外国语学生会</a></li>
                                <li><a href="#nine2">外国语团委</a></li>
                            </ul>
                        </li>
                        <li class="drop-down"><a href="#!">艺术设计学院<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#ten1">艺设学生会</a></li>
                                <li><a href="#ten2">艺设团委</a></li>
                            </ul>
                        </li>
                        <li class="drop-down"><a href="#!">校级组织<i class="ion-chevron-down"></i></a>
                            <ul class="drop-down-menu drop-down-inner">
                                <li><a href="#eleven1">校学生会</a></li>
                                <li><a href="#eleven2">校团委</a></li>
                                <li><a href="#eleven3">社团联合会</a></li>
                            </ul>
                        </li>
                        <li><a href="#twelve">社团</a></li>

                    </ul>
                </div>
            </div>
        </section>
        <ul class="float-right pr-200 pt-160 color-start">
            <li><a class="pl-50 pl-sm-30" href="#one"><font size="6"> GET START </font></a></li>
        </ul>

    </div>
    <%--<div class="bottom-menu">
        <div class="container">

            <a class="menu-nav-icon" data-menu="#main-menu" href="#"><i class="ion-navicon"></i></a>
            <ul class="main-menu" id="main-menu">
                <li class="drop-down"><a href="#!">首页<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
                <li class="drop-down"><a href="#!">BUSINESS<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
                <li class="drop-down"><a href="#!">SPORT<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
                <li class="drop-down"><a href="#!">POLITICS<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
                <li class="drop-down"><a href="#!">TRAVEL<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
                <li class="drop-down"><a href="#!">LIFESTYLE<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
                <li class="drop-down"><a href="#!">CULTURE<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
                <li class="drop-down"><a href="#!">TECH<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
                <li class="drop-down"><a href="#!">VIDEO<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
                <li class="drop-down"><a href="#!">FEATURES<i class="ion-chevron-down"></i></a>
                    <ul class="drop-down-menu drop-down-inner">
                        <li><a href="#">PAGE 1</a></li>
                        <li><a href="#">PAGE 2</a></li>
                    </ul>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div><!-- container -->
    </div><!-- bottom-menu -->--%>
</header>

<!-- START -->
<section id="one" class="pt-0 bg-primary">
    <div class="container ptb-10">
        <h3 style="color: #FFFFCC">最新活动<b>The newest four activities</b></h3>
    </div><!-- container -->

    <div class="plr-50 h-600x h-md-800x h-xs-1000x oflow-hidden">

        <div class="w-60 w-md-100 float-left float-md-none h-100 h-md-40 h-xs-50">

            <div class="w-50 w-xs-100 float-left float-xs-none pos-relative h-100 h-xs-50">
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
                        String url = "jdbc:mysql://localhost:3306/course"; //数据库名
                        String username = "root";  //数据库用户名
                        String password = "1020046988";  //数据库用户密码
                        Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

                        if (conn != null) {
                %>
                <%
                    Map<String, Object> dataMap = new HashMap<String, Object>();
                    Statement st = conn.createStatement();
                    String sql = "select * from course where isFinish=1 and numberSpace>0 order by course.createTime desc limit 1";
                    ResultSet rs = st.executeQuery(sql);
                    while (rs.next()) {
                %>
                <!-- Image as bg-1 -->
                <div class="img-bg bg-1 bg-grad-layer-6"></div>

                <div class="abs-blr color-white p-20">
                    <h3 class="mb-10 mb-sm-5 t-upper">
                        <c:if test="${sessionScope.user.username == null }">
                            <a class="hover-grey" href="javascript:void(0);" onclick="selectCourses()">
                                <b><%=rs.getString("name")%>
                                </b>
                            </a>
                        </c:if>
                        <c:if test="${sessionScope.user.username != null }">
                            <a class="hover-grey" href="courseListByPage.do?pageNum=1&pageSize=5">
                                <b><%=rs.getString("name")%>
                                </b>
                            </a>
                        </c:if>
                    </h3>
                    <ul class="list-li-mr-10 color-grey">
                        <li><i class="mr-5 font-12 ion-clock"></i><%=rs.getString("schooltime")%>
                        </li>
                        <li><i class="mr-5 font-12 ion-android-person"><%=rs.getString("address")%>
                        </i></li>
                        <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                    </ul>
                    <%
                        }
                    %>
                </div><!--abs-blr -->
            </div><!-- w-50 -->

            <div class="w-50 w-xs-100 float-left float-xs-none pos-relative h-100 h-xs-50 pt-xs-10">
                <div class="mlr-10 mr-md-0 ml-xs-0 pos-relative h-100">
                    <%
                        Map<String, Object> dataMap1 = new HashMap<String, Object>();
                        Statement st1 = conn.createStatement();
                        String sql1 = "select * from course where isFinish=1 and numberSpace>0 order by course.createTime desc limit 1,1";
                        ResultSet rs1 = st1.executeQuery(sql1);
                        while (rs1.next()) {
                    %>
                    <!-- Image as bg-2 -->
                    <div class="img-bg bg-2 bg-grad-layer-6"></div>

                    <div class="abs-blr color-white p-20">
                        <h3 class="mb-10 mb-sm-5 t-upper">
                            <a class="hover-grey" href="#"><b><%=rs1.getString("name")%>
                            </b></a>
                        </h3>
                        <ul class="list-li-mr-10 color-grey">
                            <li><i class="mr-5 font-12 ion-clock"></i><%=rs1.getString("schooltime")%>
                            </li>
                            <li><i class="mr-5 font-12 ion-android-person"></i><%=rs1.getString("address")%>
                            </li>
                            <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                        </ul>
                        <%
                            }
                        %>
                    </div><!--abs-blr -->
                </div><!-- w-50 -->
            </div><!-- w-50 -->
        </div><!-- w-60 -->
        <div class="w-40 w-md-100 float-left float-md-none h-100 h-md-60 h-xs-50">

            <div class="h-50 pb-5 pt-md-10">
                <div class="h-100 pos-relative">
                    <%
                        Map<String, Object> dataMap2 = new HashMap<String, Object>();
                        Statement st2 = conn.createStatement();
                        String sql2 = "select * from course where isFinish=1 and numberSpace>0 order by course.createTime desc limit 2,1";
                        ResultSet rs2 = st2.executeQuery(sql2);
                        while (rs2.next()) {
                    %>
                    <!-- Image as bg-3 -->
                    <div class="img-bg bg-3 bg-grad-layer-6"></div>

                    <div class="abs-blr color-white p-20">
                        <h3 class="mb-10 mb-sm-5 t-upper">
                            <a class="hover-grey" href="#"><b><%=rs2.getString("name")%>
                            </b></a>
                        </h3>
                        <ul class="list-li-mr-10 color-ash">
                            <li><i class="mr-5 font-12 ion-clock"></i><%=rs2.getString("schooltime")%>
                            </li>
                            <li><i class="mr-5 font-12 ion-android-person"></i><%=rs2.getString("address")%>
                            </li>
                            <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                        </ul>
                        <%
                            }
                        %>
                    </div><!--abs-blr -->
                </div><!-- h-50 -->
            </div><!-- h-50 -->

            <div class="h-50 pt-5">
                <div class="h-100 pos-relative">
                    <%
                        Map<String, Object> dataMap3 = new HashMap<String, Object>();
                        Statement st3 = conn.createStatement();
                        String sql3 = "select * from course where isFinish=1 and numberSpace>0 order by createTime desc limit 3,1";
                        ResultSet rs3 = st3.executeQuery(sql3);
                        while (rs3.next()) {
                    %>
                    <!-- Image as bg-4 -->
                    <div class="img-bg bg-4 bg-grad-layer-6"></div>

                    <div class="abs-blr color-white p-20">
                        <h3 class="mb-10 mb-sm-5 t-upper">
                            <a class="hover-grey" href="#"><b><%=rs3.getString("name")%>
                            </b></a>
                        </h3>
                        <ul class="list-li-mr-20 color-grey">
                            <li><i class="mr-5 font-12 ion-clock"></i><%=rs3.getString("schooltime")%>
                            </li>
                            <li><i class="mr-5 font-12 ion-android-person"></i><%=rs3.getString("address")%>
                            </li>
                            <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                        </ul>
                        <%
                            }
                        %>
                    </div><!--abs-blr -->
                </div><!-- h-50 -->
            </div><!-- h-50 -->
            <%
                    } else {
                        out.print("连接失败！");
                    }
                } catch (Exception e) {
                    //e.printStackTrace();
                    out.print("数据库连接异常！");
                }
            %>
        </div><!-- w-40 -->
    </div><!-- wrapper -->
</section>
<!-- END OF MAIN SLIDER -->


<section class="">
    <div class="container">
        <div class="row">

            <div class="col-md-12 col-lg-8">
                <div class="mb-30 p-30 ptb-sm-25 plr-sm-15 card-view">
                    <h4 class="p-title"><b>正在报名的活动</b></h4>
                    <img src="../images/news-1-700x400.jpg" alt="">
                    <h3 class="mt-30"><a href="#">WPP is investigating an allegation of personal misconduct against
                        its chief executive Sir Martin Sorrell.</a></h3>
                    <ul class="mtb-10 list-li-mr-20 color-lite-black">
                        <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                        <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                        <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                        <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                    </ul>

                </div><!-- bg-white -->


                <div class="mb-30 sided-250x card-view">
                    <div class="s-left">
                        <img src="../images/news-2-250x250.jpg" alt="">
                    </div><!-- left-area -->
                    <div class="s-right ptb-50 p-sm-20 pb-sm-5 plr-30 plr-xs-0">
                        <h4><a href="#">Bahrain Grand Prix: Will Sebastian Vettel reign in the heat of the desert?</a>
                        </h4>
                        <ul class="mtb-10 list-li-mr-20 color-lite-black">
                            <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                            <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                            <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                            <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                        </ul>
                    </div><!-- right-area -->
                </div><!-- sided-250x -->

                <div class="mb-30 sided-250x card-view">
                    <div class="s-left">
                        <img src="../images/news-3-250x250.jpg" alt="">
                    </div><!-- left-area -->
                    <div class="s-right ptb-50 plr-sm-20 pt-sm-20 pb-sm-5 plr-30 plr-xs-0">
                        <h4><a href="#">New Zealand v England: Visitors have good chance of Test win - Jonny
                            Bairstow</a></h4>
                        <ul class="mtb-10 list-li-mr-20 color-lite-black">
                            <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                            <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                            <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                            <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                        </ul>
                    </div><!-- right-area -->
                </div><!-- sided-250x -->

                <div class="mb-30 sided-250x card-view">
                    <div class="s-left">
                        <img src="../images/news-4-250x250.jpg" alt="">
                    </div><!-- left-area -->
                    <div class="s-right ptb-50 plr-sm-20 pt-sm-20 pb-sm-5 plr-30 plr-xs-0">
                        <h4><a href="#">Relations between Russia and the West are at a new low. But how should we
                            describe the current situation?</a></h4>
                        <ul class="mtb-10 list-li-mr-20 color-lite-black">
                            <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                            <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                            <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                            <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                        </ul>
                    </div><!-- right-area -->
                </div><!-- sided-250x -->

                <div class="mb-30 sided-250x card-view">
                    <div class="s-left">
                        <img src="../images/news-5-250x250.jpg" alt="">
                    </div><!-- left-area -->
                    <div class="s-right ptb-50 plr-sm-20 pt-sm-20 pb-sm-5 plr-30 plr-xs-0">
                        <h4><a href="#">California investigators have said a car that plunged off a roadside cliff,
                            killing a family of eight.</a></h4>
                        <ul class="mtb-10 list-li-mr-20 color-lite-black">
                            <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                            <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                            <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                            <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                        </ul>
                    </div><!-- right-area -->
                </div><!-- sided-250x -->

                <div class="mb-30 sided-250x card-view">
                    <div class="s-left">
                        <img src="../images/news-6-250x250.jpg" alt="">
                    </div><!-- left-area -->
                    <div class="s-right ptb-50 plr-sm-20 pt-sm-20 pb-sm-5 plr-30 plr-xs-0">
                        <h4><a href="#">Facebook's chief executive has defended his leadership following criticism from
                            his
                            counterpart at Apple.</a></h4>
                        <ul class="mtb-10 list-li-mr-20 color-lite-black">
                            <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                            <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                            <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                            <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                        </ul>
                    </div><!-- right-area -->
                </div><!-- sided-250x -->

                <div class="sided-250x card-view">
                    <div class="s-left">
                        <img src="../images/news-7-250x250.jpg" alt="">
                    </div><!-- left-area -->
                    <div class="s-right ptb-50 plr-sm-20 pt-sm-20 pb-sm-5 plr-30 plr-xs-0">
                        <h4><a href="#">Tesla has been admonished by the US investigating a recent fatal crash
                            involving one of its cars.</a></h4>
                        <ul class="mtb-10 list-li-mr-20 color-lite-black">
                            <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                            <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                            <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                            <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                        </ul>
                    </div><!-- right-area -->
                </div><!-- sided-250x -->

            </div><!-- col-sm-8 -->

            <div class="col-md-12 col-lg-4">

                <div class="mb-30 mt-md-30 p-30 card-view">
                    <h4 class="p-title"><b>报名已截至的活动</b></h4>
                    <ul class="font-12 text-center color-white list-block list-a-block list-a-ptb-10 list-li-mb-10 list-a-br-5 list-a-hvr-primary">
                        <li><a class="bg-fb" href="#"><i class="mr-10 sqr-fb-20 ion-social-facebook"></i><b>2135</b>
                            followers</a>
                        <li>
                        <li><a class="bg-twtr" href="#"><i class="mr-10 sqr-twtr-20 ion-social-twitter"></i><b>5176</b>
                            followers</a>
                        <li>
                        <li><a class="bg-gogl" href="#"><i
                                class="mr-10 sqr-gogl-20 ion-social-googleplus"></i><b>2244</b> followers</a>
                        <li>
                        <li><a class="bg-rss" href="#"><i class="mr-10 sqr-rss-20 ion-social-rss"></i><b>2111</b>
                            followers</a>
                        <li>
                    </ul>
                </div><!-- card-view -->

                <div class="mb-30 p-30 card-view">
                    <h4 class="p-title"><b>STAY CONNECT</b></h4>
                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-news-1-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>Murdoch proposes Sky News sale to Disney</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-news-2-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>Why Masteechef 'crispy' rendang caused upreor</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-news-3-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>'Nothing but holiday resort?' Revisiting 1939 cornwell</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-news-4-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>UK Passport : Firm appears move to make the France</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-news-5-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>EX-health secretary being treated for bowl cancer</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-news-6-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>Pale and hungry pupils 'fill pockets with school foods'</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-news-7-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>Pendleton summmber bike:' that fill of power is addictive</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-news-8-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>Dan carter rolls back years while pro dominance leaves Englands</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->
                </div><!-- card-view -->

                <div class="mb-30 p-30 card-view">
                    <img src="../images/sidebar-review-400x300.jpg" alt="">
                    <h4 class="mt-15"><a href="#">
                        <b>Berney Sander: Israel 'overreacted' during Gaza protest</b></a></h4>
                    <ul class="mtb-10 list-li-mr-5 color-lite-black">
                        <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                        <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                        <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                        <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                    </ul>
                    <a class="color-blue" href="#"><b>Judge Overseeing: 9.2/10</b></a>
                </div><!-- card-view -->

            </div><!-- col-sm-4 -->
        </div><!-- row -->
    </div><!-- container -->
</section>

<!-- START OF VIDEO -->
<section class="bg-primary color-white pb-20">
    <div class="container">
        <h4 class="p-title in"><b>FEATIRED VIDEO</b></h4>

        <div class="row">
            <div class="col-sm-6 col-md-3">
                <a class="hover-grey dplay-block" href="#">
                    <div class="pos-relative"><img src="../images/video-1-300x300.jpg" alt="">
                        <div class="hover-video"><span class="icon"><i class="ion-play"></i></span></div>
                    </div>

                    <h5 class="mt-15"><b>Dan carter rolls back years while pro dominance leaves England</b></h5></a>
                <ul class="mt-5 mb-30 list-li-mr-20 color-lite-black">
                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                </ul>
            </div><!-- col-md-3 -->

            <div class="col-sm-6 col-md-3">
                <a class="hover-grey dplay-block" href="#">
                    <div class="pos-relative"><img src="../images/video-2-300x300.jpg" alt="">
                        <div class="hover-video"><span class="icon"><i class="ion-play"></i></span></div>
                    </div>

                    <h5 class="mt-15"><b>Josua VS Parker: Worldcup winners and a mascat</b></h5></a>
                <ul class="mt-5 mb-30 list-li-mr-20 color-lite-black">
                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                </ul>
            </div><!-- col-md-3 -->

            <div class="col-sm-6 col-md-3">
                <a class="hover-grey dplay-block" href="#">
                    <div class="pos-relative"><img src="../images/video-3-300x300.jpg" alt="">
                        <div class="hover-video"><span class="icon"><i class="ion-play"></i></span></div>
                    </div>

                    <h5 class="mt-15"><b>Aviation summit to be hosted April 16 & 17 at the hilton
                        American-Houston</b></h5></a>
                <ul class="mt-5 mb-30 list-li-mr-20 color-lite-black">
                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                </ul>
            </div><!-- col-md-3 -->

            <div class="col-sm-6 col-md-3">
                <a class="hover-grey dplay-block" href="#">
                    <div class="pos-relative"><img src="../images/video-4-300x300.jpg" alt="">
                        <div class="hover-video"><span class="icon"><i class="ion-play"></i></span></div>
                    </div>

                    <h5 class="mt-15"><b>Srilanka has a secret lake local aren't tell you absout</b></h5></a>
                <ul class="mt-5 mb-30 list-li-mr-20 color-lite-black">
                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                </ul>
            </div><!-- col-md-3 -->
        </div><!-- row -->
    </div><!-- container -->
</section>
<!-- END OF VIDEO -->

<section class="pb-20">
    <div class="container">
        <div class="row">

            <div class="col-md-12 col-lg-8">
                <!-- END OF POLITICS -->
                <div class="p-30 card-view">
                    <h4 class="p-title"><b>POLITICS</b></h4>
                    <div class="row">
                        <div class="col-sm-6">
                            <img src="../images/sport-1-400x300.jpg" alt="">
                        </div><!-- col-sm-6 -->

                        <div class="col-sm-6">
                            <h4 class="mt-30"><a href="#">
                                <b>Look beyond the revived Tiger Smitchel for a Homegrown Master champion</b></a></h4>
                            <ul class="mtb-10 list-li-mr-5 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                                <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur placerat tincidunt
                                mauris semper lorem, in dignissim ex metus a lacus. Sed venenatis dolor vitae vehicula
                                varius. Aliquam vitae donis lobortis diamet...</p>
                        </div><!-- col-sm-6 -->
                    </div><!-- row -->
                    <div class="mtb-30 brdr-grey-1"></div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="brdr-l-grey-2 pl-20 mb-30">
                                <h5><a href="#"><b>Josua VS Parker: Worldcup winners and a mascat</b></a></h5>
                                <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                                </ul>
                            </div><!-- brdr-left-1 -->
                        </div><!-- col-sm-6 -->
                        <div class="col-sm-6">
                            <div class="brdr-l-grey-2 pl-20 mb-30">
                                <h5><a href="#"><b>Josua VS Parker: Worldcup winners and a mascat</b></a></h5>
                                <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                                </ul>
                            </div><!-- brdr-left-1 -->
                        </div><!-- col-sm-6 -->
                        <div class="col-sm-6">
                            <div class="brdr-l-grey-2 pl-20 mb-sm-30">
                                <h5><a href="#"><b>Josua VS Parker: Worldcup winners and a mascat</b></a></h5>
                                <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                                </ul>
                            </div><!-- brdr-left-1 -->
                        </div><!-- col-sm-6 -->
                        <div class="col-sm-6">
                            <div class="brdr-l-grey-2 pl-20">
                                <h5><a href="#"><b>Josua VS Parker: Worldcup winners and a mascat</b></a></h5>
                                <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                                </ul>
                            </div><!-- brdr-left-1 -->
                        </div><!-- col-sm-6 -->

                    </div><!-- row -->
                </div><!-- p-30 card-view -->
                <!-- END OF POLITICS -->

                <!-- START OF SPORT -->
                <div class="p-30 card-view mtb-30">
                    <h4 class="p-title"><b>SPORT</b></h4>
                    <div class="row">
                        <div class="col-sm-6">
                            <img src="../images/sport-1-400x300.jpg" alt="">
                        </div><!-- col-sm-6 -->

                        <div class="col-sm-6">
                            <h4 class="mt-30"><a href="#">
                                <b>Look beyond the revived Tiger Smitchel for a Homegrown Master champion</b></a></h4>
                            <ul class="mtb-10 list-li-mr-5 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                                <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur placerat tincidunt
                                mauris semper lorem, in dignissim ex metus a lacus. Sed venenatis dolor vitae vehicula
                                varius. Aliquam vitae donis lobortis diamet...</p>
                        </div><!-- col-sm-6 -->
                    </div><!-- row -->
                    <div class="mtb-30 brdr-grey-1"></div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="brdr-l-grey-2 pl-20 mb-30">
                                <h5><a href="#"><b>Josua VS Parker: Worldcup winners and a mascat</b></a></h5>
                                <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                                </ul>
                            </div><!-- brdr-left-1 -->
                        </div><!-- col-sm-6 -->
                        <div class="col-sm-6">
                            <div class="brdr-l-grey-2 pl-20 mb-30">
                                <h5><a href="#"><b>Josua VS Parker: Worldcup winners and a mascat</b></a></h5>
                                <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                                </ul>
                            </div><!-- brdr-left-1 -->
                        </div><!-- col-sm-6 -->
                        <div class="col-sm-6">
                            <div class="brdr-l-grey-2 pl-20 mb-sm-30">
                                <h5><a href="#"><b>Josua VS Parker: Worldcup winners and a mascat</b></a></h5>
                                <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                                </ul>
                            </div><!-- brdr-left-1 -->
                        </div><!-- col-sm-6 -->
                        <div class="col-sm-6">
                            <div class="brdr-l-grey-2 pl-20">
                                <h5><a href="#"><b>Josua VS Parker: Worldcup winners and a mascat</b></a></h5>
                                <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                    <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                    <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                                </ul>
                            </div><!-- brdr-left-1 -->
                        </div><!-- col-sm-6 -->

                    </div><!-- row -->
                </div><!-- p-30 card-view -->
                <!-- END OF SPORT -->

                <div class="row">
                    <!-- START OF LIFESTYLE -->
                    <div class="col-sm-12 col-md-6">
                        <div class="p-30 card-view mb-30">
                            <h4 class="p-title"><b>LIFESTYLE</b></h4>
                            <img src="../images/lifestyle-1-400x300.jpg" alt="">

                            <h4 class="mt-30"><a href="#">
                                <b>The best spring outfits for an art gallery trip - in pictures</b></a></h4>
                            <ul class="mtb-10 list-li-mr-5 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                                <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                            <div class="mtb-15 brdr-grey-1"></div>
                            <p class="mb-10">Lorem ipsum like dolor sit amet, consec adipiscing elit. Curabitur placerat
                                tincidunt.</p>
                            <p class="mb-10">Lorem new ipsum dolor sit amet, tetur adipiscing elit. Curabitur placerat
                                tincidunt.</p>
                            <p>Lorem ipsum dolor as sit amet, ectetur ing elit. Curabitur placerat tincidunt.</p>

                        </div><!-- p-30 card-view -->
                    </div><!-- col-sm-6 -->
                    <!-- END OF LIFESTYLE -->

                    <!-- START OF BUSINESS -->
                    <div class="col-sm-12 col-md-6">
                        <div class="p-30 card-view mb-30">
                            <h4 class="p-title"><b>BUSINESS</b></h4>
                            <img src="../images/business-1-400x300.jpg" alt="">

                            <h4 class="mt-30"><a href="#">
                                <b>The thriving entrepreneurs who escaped the rat race</b></a></h4>
                            <ul class="mtb-10 list-li-mr-5 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                                <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                            <div class="mtb-15 brdr-grey-1"></div>
                            <p class="mb-10">Lorem ipsum like dolor sit amet, consec adipiscing elit. Curabitur placerat
                                tincidunt.</p>
                            <p class="mb-10">Lorem new ipsum dolor sit amet, tetur adipiscing elit. Curabitur placerat
                                tincidunt.</p>
                            <p>Lorem ipsum dolor as sit amet, ectetur ing elit. Curabitur placerat tincidunt.</p>

                        </div><!-- p-30 card-view -->
                    </div><!-- col-sm-6 -->
                    <!-- END OF BUSINESS -->

                    <!-- START OF CULTURE -->
                    <div class="col-sm-12 col-md-6">
                        <div class="p-30 card-view mb-30">
                            <h4 class="p-title"><b>CULTURE</b></h4>
                            <img src="../images/culture-1-400x300.jpg" alt="">

                            <h4 class="mt-30"><a href="#">
                                <b>Church's Collaboration Could be a sign we are over 'It' trainer</b></a></h4>
                            <ul class="mtb-10 list-li-mr-5 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                                <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                            <div class="mtb-15 brdr-grey-1"></div>
                            <p class="mb-10">Lorem ipsum like dolor sit amet, consec adipiscing elit. Curabitur placerat
                                tincidunt.</p>
                            <p class="mb-10">Lorem new ipsum dolor sit amet, tetur adipiscing elit. Curabitur placerat
                                tincidunt.</p>
                            <p>Lorem ipsum dolor as sit amet, ectetur ing elit. Curabitur placerat tincidunt.</p>

                        </div><!-- p-30 card-view -->
                    </div><!-- col-sm-6 -->
                    <!-- END OF CULTURE -->

                    <!-- START OF TECH -->
                    <div class="col-sm-12 col-md-6">
                        <div class="p-30 card-view mb-30">
                            <h4 class="p-title"><b>TECH</b></h4>
                            <img src="../images/tech-1-400x300.jpg" alt="">

                            <h4 class="mt-30"><a href="#">
                                <b>EX-health secretary being treated for bowl cancer</b></a></h4>
                            <ul class="mtb-10 list-li-mr-5 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-android-person"></i>John Dowson</li>
                                <li><i class="mr-5 font-12 ion-ios-chatbubble-outline"></i>15</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                            <div class="mtb-15 brdr-grey-1"></div>
                            <p class="mb-10">Lorem ipsum like dolor sit amet, consec adipiscing elit. Curabitur placerat
                                tincidunt.</p>
                            <p class="mb-10">Lorem new ipsum dolor sit amet, tetur adipiscing elit. Curabitur placerat
                                tincidunt.</p>
                            <p>Lorem ipsum dolor as sit amet, ectetur ing elit. Curabitur placerat tincidunt.</p>

                        </div><!-- p-30 card-view -->
                    </div><!-- col-sm-6 -->
                    <!-- END OF TECH -->
                </div><!-- row -->

            </div><!-- col-sm-8 -->

            <div class="col-md-12 col-lg-4">
                <!-- START OF SIDEBAR MOST READ -->
                <div class="mb-30 p-30 card-view">
                    <h4 class="p-title"><b>MOST READ</b></h4>

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-most-read-1-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>'Nothing but holiday resort?' Revisiting 1939 cornwell</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-most-read-2-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>UK Passport : Firm appears move to make the France</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-most-read-3-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>EX-health secretary being treated for bowl cancer</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-most-read-4-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>Pale and hungry pupils 'fill pockets with school foods'</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-most-read-5-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>Pendleton summmber bike:' that fill of power is addictive</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-20">
                        <div class="s-left">
                            <img src="../images/sidebar-most-read-6-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h5><a href="#">
                                <b>Aviation summit to be hosted April 16 & 17 at the hilton American-Houston</b></a>
                            </h5>
                            <ul class="mtb-5 list-li-mr-20 color-lite-black">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->
                </div><!-- card-view -->
                <!-- END OF SIDEBAR MOST READ -->

                <!-- START OF SIDEBAR ARTICLES BY AUTHOR -->
                <div class="mb-30 p-30 card-view">
                    <h4 class="p-title"><b>ARTICLES BY AUTHOR</b></h4>

                    <div class="sided-90x mb-20">
                        <div class="s-left br-3 oflow-hidden">
                            <img src="../images/sidebar-profile-1-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h4 class="pt-20"><b>Chris Smalling</b></h4>
                            <h6 class="color-ash">Reporter</h6>
                        </div><!-- s-left -->
                    </div><!-- sided-90x -->

                    <div class="sided-90x mb-20">
                        <div class="s-left br-3 oflow-hidden">
                            <img src="../images/sidebar-profile-2-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h4 class="pt-20"><b>Johny Dowson</b></h4>
                            <h6 class="color-ash">Reporter</h6>
                        </div><!-- s-left -->
                    </div><!-- sided-90x -->

                    <div class="sided-90x mb-20">
                        <div class="s-left br-3 oflow-hidden">
                            <img src="../images/sidebar-profile-3-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h4 class="pt-20"><b>Emily Carter</b></h4>
                            <h6 class="color-ash">Reporter</h6>
                        </div><!-- s-left -->
                    </div><!-- sided-90x -->

                    <div class="sided-90x">
                        <div class="s-left br-3 oflow-hidden">
                            <img src="../images/sidebar-profile-4-100x100.jpg" alt="">
                        </div><!-- s-left -->

                        <div class="s-right">
                            <h4 class="pt-20"><b>Julia Ann</b></h4>
                            <h6 class="color-ash">Reporter</h6>
                        </div><!-- s-left -->
                    </div><!-- sided-90x -->

                </div><!-- card-view -->
                <!-- END OF SIDEBAR ARTICLES BY AUTHOR -->

                <!-- START OF SIDEBAR BANNER-->
                <div class="plr-30 ptb-50 color-white pos-relative text-center bg-7">
                    <div class="bg-layer-8">
                        <h3><b>REAL ESTATE</b></h3>
                        <p class="mb-15 mt-5 color-white">A perfect place to find your home residential real estate may
                            contain either a single family</p>
                        <h6><a class="btn-fill-white btn-b-sm plr-10" href="#"><b>READ MORE</b></a></h6>
                    </div><!-- banner-area -->
                </div><!-- banner-area -->
                <!-- END OF SIDEBAR BANNER-->

                <!-- START OF SIDEBAR NEWSLETTER -->
                <div class="mt-30 p-30 plr-40 card-view text-center">
                    <h4><b>NEWSLETTER</b></h4>
                    <p>The best selling Magic-Magazine</p>
                    <img class="mtb-20 max-w-100x mlr-auto" src="../images/sidebar-profile-5-100x150.jpg" alt="">

                    <form class="form-sm max-w-400x mlr-auto">
                        <input type="email" placeholder="Yor Email">
                        <h6>
                            <button class="mt-15 plr-20 btn-b-sm btn-fill-primary dplay-block" type="submit"><b>SUBSCRIBE
                                NOW</b></button>
                        </h6>
                    </form>
                </div><!-- card-view -->
                <!-- END OF SIDEBAR NEWSLETTER -->

            </div><!-- col-sm-4 -->
        </div><!-- row -->
    </div><!-- container -->
</section>


<footer class="bg-191 pos-relative color-ccc bg-primary pt-50">
    <div class="abs-tblr pt-50 z--1 text-center">
        <div class="h-80 pos-relative">
            <div class="bg-map abs-tblr opacty-1"></div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-4">
                <h5 class="f-title"><b>QUICK LINKS</b></h5>
                <ul class="mb-30 list-hover list-block list-a-ptb-5">
                    <li><a href="#">Home Delivery</a></li>
                    <li><a href="#">User Permissions</a></li>
                    <li><a href="#">Download Apps</a></li>
                    <li><a href="#">Newsletters</a></li>
                    <li><a href="#">Subscriptions</a></li>
                    <li><a href="#">Online Store</a></li>
                </ul>
            </div><!-- col-sm-2 -->

            <div class="col-lg-4 col-md-8 col-sm-8">
                <div class="pl-10 pl-sm-0">
                    <h5 class="f-title"><b>FEATURED VIDEO</b></h5>

                    <div class="sided-80x mb-30">
                        <a class="s-left" href="#">
                            <img src="../images/video-1-300x300.jpg" alt="">
                            <div class="hover-video sm"><span class="icon"><i class="ion-play"></i></span></div>
                        </a><!-- s-left -->

                        <div class="s-right pl-10 mb-30 ">
                            <h5><a href="#"><b>Dan carter rolls back years while pro dominance leaves Englands</b></a>
                            </h5>
                            <ul class="mtb-5 list-li-mr-20 color-ash">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-30">
                        <a class="s-left" href="#">
                            <img src="../images/video-2-300x300.jpg" alt="">
                            <div class="hover-video sm"><span class="icon"><i class="ion-play"></i></span></div>
                        </a><!-- s-left -->

                        <div class="s-right pl-10 mb-30 ">
                            <h5><a href="#"><b>Dan carter rolls back years while pro dominance...</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-ash">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->
                </div><!-- pl-10 -->
            </div><!-- col-sm-4 -->

            <div class="col-lg-2 col-md-4 col-sm-4">
                <h5 class="f-title"><b>OUR WORK</b></h5>
                <ul class="mb-30 list-hover list-block list-a-ptb-5">
                    <li><a href="#">In the Community</a></li>
                    <li><a href="#">Today's Link</a></li>
                    <li><a href="#">Our History</a></li>
                    <li><a href="#">Our Events</a></li>
                    <li><a href="#">Our Studio</a></li>
                    <li><a href="#">Career</a></li>
                </ul>
            </div><!-- col-sm-2 -->

            <div class="col-lg-4 col-md-8 col-sm-8">
                <div class="pr-10 pr-sm-0">
                    <h5 class="f-title"><b>RECENT POST</b></h5>

                    <div class="sided-80x mb-30">
                        <a class="s-left" href="#">
                            <img src="../images/sidebar-news-1-100x100.jpg" alt="">
                            <div class="hover-video sm"><span class="icon"><i class="ion-play"></i></span></div>
                        </a><!-- s-left -->

                        <div class="s-right pl-10">
                            <h5><a href="#"><b>Dan carter rolls back years while pro dominance...</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-ash">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->

                    <div class="sided-80x mb-30">
                        <a class="s-left" href="#">
                            <img src="../images/sidebar-news-2-100x100.jpg" alt="">
                            <div class="hover-video sm"><span class="icon"><i class="ion-play"></i></span></div>
                        </a><!-- s-left -->

                        <div class="s-right pl-10">
                            <h5><a href="#"><b>Josua VS Parker: Worldcup winners and a mascat</b></a></h5>
                            <ul class="mtb-5 list-li-mr-20 color-ash">
                                <li><i class="mr-5 font-12 ion-clock"></i>Jan 25, 2018</li>
                                <li><i class="mr-5 font-12 ion-eye"></i>105</li>
                            </ul>
                        </div><!-- s-left -->
                    </div><!-- sided-80x -->
                </div><!--pr-10 -->
            </div><!-- col-sm-4 -->

        </div><!-- row -->

        <div class="mt-20 brdr-ash-1 opacty-4"></div>

        <div class="text-center ptb-30">
            <div class="row">
                <div class="col-sm-3">
                    <a class="mtb-10" href="#"><img src="../images/logo-white.png" alt=""></a>
                </div><!-- col-sm-3 -->

                <div class="col-sm-5">
                    <p class="mtb-10">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur placerat
                        tincidunt mauris semper lorem</p>
                </div><!-- col-sm-3 -->

                <%-- <div class="col-sm-4">
                     <ul class="mtb-10 font-12 list-radial-35 list-li-mlr-3">
                         <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                         <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                         <li><a href="#"><i class="ion-social-pinterest"></i></a></li>
                         <li><a href="#"><i class="ion-social-google"></i></a></li>
                         <li><a href="#"><i class="ion-social-rss"></i></a></li>
                     </ul>
                 </div><!-- col-sm-4 -->--%>
            </div><!-- row -->
        </div><!-- text-center -->
    </div><!-- container -->

    <div class="bg-dark-primary ptb-15 text-left">
        <div class="container">
            <div class="row">

                <div class="col-sm-12 col-md-6">
                    <p class="text-md-center font-9 pt-5 mtb-5">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                        All rights reserved | This template is made with <i class="ion-heart" aria-hidden="true"></i> by
                        <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div><!-- col-sm-3 -->

                <div class="col-sm-12 col-md-6">
                    <ul class="mtb-5 font-11 text-md-center text-right list-a-p-5">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Business</a></li>
                        <li><a href="#">Sport</a></li>
                        <li><a href="#">Politics</a></li>
                        <li><a href="#">Travel</a></li>
                        <li><a href="#">Lifestyle</a></li>
                        <li><a href="#">Culture</a></li>
                        <li><a href="#">Tech</a></li>
                        <li><a href="#">Video</a></li>
                    </ul>
                </div><!-- col-sm-3 -->
            </div><!-- row -->

        </div><!-- container -->
    </div><!-- container -->
</footer>


<!-- SCIPTS -->

<script src="../plugin-frameworks/jquery-3.2.1.min.js"></script>

<script src="../plugin-frameworks/tether.min.js"></script>

<script src="../plugin-frameworks/bootstrap.js"></script>

<script src="../common/scripts.js"></script>

<script>
    function selectCourses() {
        alert('尊敬的游客，由于您未登录，所以无法使用该平台，请先登录！');
        location.href('login.jsp');
    }

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i
        }
        return i
    }
    function getCurrentTime() {
        var now = new Date();
        var time = document.getElementById("showTime").value;
        time = " &nbsp;&nbsp;" + checkTime(now.getHours()) + " : " + checkTime(now.getMinutes()) + " : " + checkTime(now.getSeconds());
        document.getElementById("showTime").innerHTML = time;
    }
    window.setInterval("getCurrentTime()", 1000);
</script>

</body>
</html>
