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

        <!-- 用户信息列表 -->
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
                    <a href="/backend/index"><i class="fa fa-dashboard"></i> 首页</a>
                </li>

                <!-- 图书管理 -->
                <li>
                    <a href="" class="active-menu"><i class="fa fa-desktop"></i> 图书管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#" class="active">图书列表</a>
                        </li>
                        <li>
                            <a href="/backend/book/add">添加图书</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!-- 页面主体信息 -->
    <div id="page-wrapper">
        <!-- 顶部基本信息 -->
        <div class="header">
            <h1 class="page-header">
                图书列表
                <small>所有图书</small>
            </h1>
        </div>

        <!-- 页面基础信息 -->
        <div id="page-inner">
            <div class="row">
                <c:import url="/backend/book/queryForm.jsp"/>
                <br>
                <div class="am-margin-bottom-sm" id="bookListDiv">
                    <c:import url="/backend/book/itemList.jsp"/>
                </div>
            </div>
        </div>

        <footer>
            <div align="center">
                <p>Copyright &copy; 2017.WHUISS Web All rights reserved.
                    <a target="_top" href="#wrapper">回到顶部</a>
                </p>
            </div>
        </footer>
    </div>
    <br>
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

<script type="text/javascript">
    // 查询书籍
    $("#queryBookBtn").click(function () {
        var bookName = $("#queryBookName").val();
        console.log(bookName);
        $("#bookListDiv").load(
            $("#queryBookForm").attr('action'), $("#queryBookForm").serialize(), function () {
                console.log("查询成功");
            });
    });

    // 删除书籍
    $(".bookDeleteBtn").click(function () {
        var bookId = $(this).data('id');
        $.ajax({
            type: "post",
            url: "/backend/book/delete",
            data: {
                bookId: bookId
            },
            success: function () {
                document.location.reload(true);
            }
        })
    })
</script>

</body>

</html>
