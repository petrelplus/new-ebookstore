<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/backend/include/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>E-Book 后台管理系统</title>
    <!-- CSS -->
    <link href="/assets/css/bootstrap.css" rel="stylesheet"/>
    <link href="/assets/css/font-awesome.css" rel="stylesheet"/>
    <link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <link href="/assets/css/custom-styles.css" rel="stylesheet"/>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="/assets/js/Lightweight-Chart/cssCharts.css">
</head>
<body>

<div id="wrapper">
    <!-- 顶部导航条 -->
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><strong>
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>E-Book后台管理</strong></a>
        </div>

        <ul class="nav navbar-top-links navbar-right">

            <li>
                <strong>Welcome</strong>
            </li>

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> 用户信息</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <!-- 侧边导航 主要部分 -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <!-- 首页 -->
                <li>
                    <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> 首页</a>
                </li>

                <!-- 图书管理 -->
                <li>
                    <a href=""><i class="fa fa-desktop"></i> 图书管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/backend/book/index">图书列表</a>
                        </li>

                        <li>
                            <a href="/backend/book/add.jsp">添加图书</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!-- 页面主体信息 -->
    <c:import url="/backend/systemInfo.jsp"/>

</div>

<script src="/assets/js/jquery-1.10.2.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/jquery.metisMenu.js"></script>
<script src="/assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="/assets/js/morris/morris.js"></script>
<script src="/assets/js/easypiechart.js"></script>
<script src="/assets/js/easypiechart-data.js"></script>
<script src="/assets/js/Lightweight-Chart/jquery.chart.js"></script>
<script src="/assets/js/custom-scripts.js"></script>

<script type="text/javascript" src="/assets/js/chart.min.js"></script>
<script type="text/javascript" src="/assets/js/chartjs.js"></script>

</body>

</html>
