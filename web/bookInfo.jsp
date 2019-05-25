<%--
  Created by IntelliJ IDEA.
  User: coldilock
  Date: 2019-05-25
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.store.model.User" %>
<%@ page import="com.store.model.Book" %>
<%@ page import="com.store.dao.BookDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--
* Author : Ech0
* Email  : ech0.extreme@foxmail.com
* Time   : 04/25/2018 09:02 PM
*-->
    <meta charset="UTF-8">
    <meta http-equiv="Cache-control" content="no-cache">
    <title>详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%--    <script src="../js/constant.js"></script>--%>
<%--    <script src="../js/common.js"></script>--%>
<%--    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"--%>
<%--          integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">--%>
<%--    <script src="../js/cart.js"></script>--%>
<%--    <script src="../js/favorite.js"></script>--%>

    <script src="js/jquery.js"></script>
    <script src="css/bootstrap/popper.js"></script>
    <script src="css/bootstrap/bootstrap.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.bootcss.com/store.js/1.3.20/store.js"></script>
    <script src="https://cdn.bootcss.com/axios/0.18.0/axios.js"></script>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    String userName = null;
    if (user != null) {
        userName = user.getUserName();
    }

    Book book = (Book) request.getAttribute("book");

%>
<br>
<br><br>
<div class="container border border-info rounded">
    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary ">
        <div class="container">
            <a href="/index.jsp" class="navbar-brand">Ebookstore</a>
            <!--菜单按钮-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="" navbarResponsive aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!--菜单-->
            <div class="collapse navbar-collapse text-center" id="navbarResponsive">
                <ul class="navbar-nav mr-auto">
                    <!--分类下拉框-->
                    <li class="nav-item dropdown ">
                        <div class="nav-link dropdown-toggle btn btn-primary" data-toggle="dropdown"><span
                                id="searchOption" class="pl-2">全部分类</span> <span class="caret"></span></div>
                        <div class="dropdown-menu ">
                            <div class="search-option dropdown-item">传记</div>
                            <div class="search-option dropdown-item">历史</div>
                            <div class="search-option dropdown-item">科幻</div>
                            <div class="search-option dropdown-item">武侠</div>
                            <div class="search-option dropdown-item">推理</div>
                            <div class="search-option dropdown-item">教育</div>
                            <div class="search-option dropdown-item">商业</div>
                        </div>
                    </li>
                    <li class="nav-item ml-3 text-center">
                        <!--搜索框-->
                        <form class="form-inline mt-2 mt-md-0 ">
                            <input id="search-keyword" class="form-control mr-sm-2" type="text" placeholder="">
                        </form>
                    </li>
                    <li class="nav-item ml-3 text-center">
                        <div id="search-btn" class="btn btn-secondary  my-2 my-sm-0">搜索</div>
                    </li>
                </ul>
                <%
                    if (session.getAttribute("user") != null) {
                %>

                <!--已经登录-->
                <div id="login-links" class="text-center">
                    <div class="nav navbar-nav mr-auto ">
                        <div class="nav-item mr-3">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-primary">
                                    <%
                                        out.print(user.getUserName());
                                    %>
                                </button>
                                <div class="btn-group" role="group">
                                    <button id="btnGroupDrop2" type="button" class="btn btn-success dropdown-toggle"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                    <div class="dropdown-menu" aria-labelledby="btnGroupDrop2">
                                        <a class="dropdown-item" href="#"><i class="far fa-user"></i>个人信息</a>
                                        <a  class="dropdown-item" href="/cart.jsp"><i class="far fa-file-alt"></i>购物车</a>
                                        <a  class="dropdown-item" href="#"><i class="far fa-file-alt"></i>我的订单</a>
                                        <a  class="dropdown-item" href="/logout.do"><i class="far fa-file-alt"></i>退出登录</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                }else{
                %>

                <div id="login-links" class="text-center">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp" target="_top">登录/注册</a>
                        </li>
                    </ul>
                </div>

                <%
                    }
                %>

            </div>
        </div>
    </div>
    <div class="row mt-3 text-left">
        <div class="h5 pl-4 text-info font-weight-bold pb-0">书籍详情</div>
    </div>
<%--    <hr class="mt-2" >--%>
    <hr style=" border:1px #F5F5F5 solid; "/>
    <div class="row  mt-4 text-left">
        <!--cover img-->
        <div class="col-sm-12 col-md-4 border-left border-right mb-3">
            <img id="detail-cover-img" src="<%=book.getImgPath()%>"
                 class="img-thumbnail big-cover-img" alt="">
        </div>
        <!--simple info-->
        <div class="col-sm-12 col-md-5">
            <div>
                <h5 id="detail-bookName" class="text-danger font-weight-bold d-inline-block"><%=book.getName() %></h5>
            </div>
            <hr style=" border:1px #F5F5F5 solid; "/>
            <div>
                <span class="text-muted">作者：</span>
                <span id="detail-authorName" class="text-secondary"><%=book.getAuthor() %></span>
            </div>
            <div class="mt-1  ">
                <span> 售价 ：</span><span id="detail-currentPrice" class="h1 text-danger font-weight-bold">¥<%=book.getPrice() %></span>
            </div>
            <br>
            <hr style=" border:1px #F5F5F5 solid; "/>
            <div>
                <br>
                <%
                    if(session.getAttribute("user") != null){
                %>
                <div class="btn-group w-100" role="group" aria-label="Basic example">
                    <button class="btn btn-secondary w-50" onclick="addCart('<%=((User) session.getAttribute("user")).getId()%>','<%=book.getId()%>')">加入购物车</button>
                </div>
                <%
                }else{
                %>
                <div class="btn-group w-100" role="group" aria-label="Basic example">
                    <button class="btn btn-secondary w-50" onclick="alert('请先登录')">加入购物车</button>
                </div>
                <%
                    }
                %>




                <br><br>
                <div class="btn-group w-100" role="group" aria-label="Basic example">
                    <button class="btn btn-success w-50">立即购买</button>

                </div>
            </div>
        </div>

    </div>
    <!--book detail-->
    <hr style=" border:1px #F5F5F5 solid; "/>
    <div class="font-weight-bold h5 "><i class="fas fa-book "></i>书籍简介</div>
    <div class="row">
        <div id="detail-briefIntro" class="pl-5 pr-5 mt-2">
            <%=book.getDescription()%>
        </div>
    </div>
    <br>
</div>
</body>
<script>


    function addCart(userId, bookId) {
        // var bookNumber = $("#input-num").val();
        var bookNumber = 1;

        $.ajax({
            type: "POST",
            url: "/addCart",
            data: {
                userId: userId,
                bookId: bookId,
                bookNumber: bookNumber
            },
            success: function (data) {
                alert(data);
            }
        });
    }
</script>
</html>
