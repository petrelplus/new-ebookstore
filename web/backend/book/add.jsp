<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/backend/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>图书管理系统</title>
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
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 图书管理</strong></a>
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
                    <a class="" href="#"><i class="fa fa-dashboard"></i> 首页</a>
                </li>

                <!-- 图书管理 -->
                <li>
                    <a href="" class="active-menu"><i class="fa fa-desktop"></i> 图书管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/backend/book/index">图书列表</a>
                        </li>
                        <li>
                            <a href="#" class="active">添加图书</a>
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
                添加图书
            </h1>
        </div>

        <!-- 页面基础信息 -->
        <div id="page-inner">
            <div class="row">
                <div class="am-margin-bottom-sm">
                    <form class="form-horizontal" id="addItemForm" method="post" action="/backend/bookAdd">

                        <div class="form-group">
                            <label for="addItemNo" class=" col-sm-2 am-padding-horizontal-0 control-label">书籍名称</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="addItemNo" name="itemNo" maxlength="25"
                                       required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="addItemName" class="col-sm-2 am-padding-horizontal-0 control-label">书籍价格</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="addItemName" name="itemName" maxlength="25"
                                       required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="addItemType" class="col-sm-2 am-padding-horizontal-0 control-label">书籍类别</label>
                            <div class="col-sm-6">
                                <select class="form-control" id="addItemType" name="itemType" required>
                                    <option value="-1" selected>请选择</option>
                                    <option value="0">未知</option>
                                    <option value="1">经典名著</option>
                                    <option value="2">秒杀书籍</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="addItemAuthor" class=" col-sm-2 am-padding-horizontal-0 control-label">书籍图片</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="addItemAuthor" name="itemAuthor" maxlength="32"
                                       required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-8">
                                <button class="btn btn-primary">添 加</button>
                            </div>
                        </div>

                    </form>
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

    // 新增
    $('#addItemBtn').click(function () {
        $.ajax({
            type: 'POST',
            url: "<spring:url value="/item/add"/>",
            data: $('#addItemForm').serialize(),
            success: function (data) {
                if(data != "\"success\""){
                    alert(data);
                } else {
                    $('#addItemModal').modal("hide");
                    document.location.reload(true);
                }
            }
        })
    });

    // 异步查询 load
    $('#queryItemBtn').click(function () {
        var form = $('#queryItemForm');
        $('#itemCtn').load(form.attr('action'), form.serialize(), function () {
        });
    });

    // 详情 info
    $('.infoItemBtn').click(function () {
        var id = $(this).data('id');
        var url = $(this).data('url');
        $('#infoItemForm').attr('action',url);
        $.ajax({
            type: 'POST',
            url: "<spring:url value="/item/info"/>",
            data: {
                "itemId": id
            },
            success: function (data) {
                $("#infoItemForm input[name='itemDesc']").val(data.replace(/\"/g,""));
            }
        });
    });

    // 删除 delete
    $('.deleteItemBtn').click(function () {
        var id = $(this).data('id');
        $.ajax({
            type: 'POST',
            url: "<spring:url value="/item/delete"/>",
            data: {
                "itemId": id
            },
            success: function (data) {
                if(data != "\"success\""){
                    alert(data);
                } else {
                    document.location.reload(true);
                }
            }
        })
    })

    // 修改 update
    $('#updateItemBtn').click(function () {
        var url = $('#infoItemForm').attr('action');
        var itemDesc = $("#infoItemForm input[name='itemDesc']").val();
        $.ajax({
            type: 'POST',
            url: url,
            data: {
                "itemDesc": itemDesc
            },
            success: function (data) {
                if(data != "\"success\""){
                    alert(data);
                } else {
                    $('#infoItemModal').modal("hide");
                    document.location.reload(true);
                }
            }
        })
    });

    // 注册 register
    $('.registerItemBtn').click(function () {
        var id = $(this).data('id');
        var url = $(this).data('url');
        $('#registerItemForm').attr('action',url);
    });

    // 借阅 register
    $('#addRecordBtn').click(function () {
        var url = $('#registerItemForm').attr('action');
        $.ajax({
            type: 'POST',
            url: url,
            data: $('#registerItemForm').serialize(),
            success: function (data) {
                if(data != "\"success\""){
                    alert(data);
                } else {
                    $('#registerItemModal').modal("hide");
                    document.location.reload(true);
                }
            }
        })
    });

</script>

</body>

</html>
