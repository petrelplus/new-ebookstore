<%@ page import="com.store.service.CartService" %>
<%@ page import="com.store.service.impl.CartServiceImpl" %>
<%@ page import="com.store.model.User" %>
<%@ page import="com.store.model.Book" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.store.dao.BookDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: coldilock
  Date: 2018/6/19
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车详情</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="js/nivo-lightbox/nivo-lightbox.css">
    <link rel="stylesheet" href="js/nivo-lightbox/nivo-lightbox-theme.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="css/bookinfoLayout.css">
    <link rel="stylesheet" href="css/button.css">
    <link rel="stylesheet" href="css/cartstyle.css"/>
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <style type="text/css">

        #nav ul li a{ text-decoration:none; display:block; padding:0px 10px; }
        #nav ul li a:hover{ color:#FFF; background-color:#87CEEB; box-shadow: 3px 3px 10px #616161;}
        #nav ul li ul{ position:absolute; display:none;}
        #nav ul li ul li{ float:none; line-height:30px; }
        #nav ul li ul li a{ color:white; width:100%; background-color:#87CEEB;}
        #nav ul li ul li a:hover{ color:#00BFFF; background-color:white; }
        #nav ul li:hover ul{ display:block;}
    </style>

    <!-- js -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/jquery.actual.min.js"></script>

</head>
<body>

<!--导航栏-->
<div style="background: white;">
    <div>
        <!--顶部固定导航 -->
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
                                    id="searchOption" class="pl-2">所有分类</span> <span class="caret"></span></div>
                            <div class="dropdown-menu ">
                                <!--fixed category -->
                                <div class="search-option dropdown-item">传记</div>
                                <div class="search-option dropdown-item">历史</div>
                                <div class="search-option dropdown-item">科幻</div>
                                <div class="search-option dropdown-item">武侠</div>
                                <div class="search-option dropdown-item">推理</div>
                                <div class="search-option dropdown-item">教育</div>
                                <div class="search-option dropdown-item">商业</div>

                                <hr>
                                <div class="search-option dropdown-item">所有分类</div>
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
                                            User user = (User)session.getAttribute("user");
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


        <section id="starting">
            <div id="cart_outer">
                <div id="cart_inner">

                    <div class="col-md-12 content_right">
                        <div class="dreamcrub">
                            <ul class="breadcrumbs">
                                <li class="home">
                                    <a href="index.html" title="返回首页">首页</a>&nbsp;
                                    <span>&gt;</span>
                                </li>
                                <li class="women">
                                    购物车
                                </li>
                            </ul>
                            <ul class="previous">
                                <li><a href="index.html">返回上一页</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="shopping_cart">
                            <%
                                BookDao bookDao = new BookDao();

                                List<Book> books = bookDao.getAllBook();
                            %>
                            <div class="cart_box">
                                <div class="message1">
                                    <div class="alert-close"></div>
                                    <div class="list_img"><img src="<%=books.get(0).getImgPath()%>" class="img-responsive" alt=""/></div>
                                    <div class="list_desc"><h4><a href="<%="showDetails.do?id="+books.get(0).getId()%>"><%=books.get(0).getName()%></a></h4>1 x<span class="actual">
		                             <%=books.get(0).getPrice()%></span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="cart_box">
                                <div class="message1">
                                    <div class="alert-close1"></div>
                                    <div class="list_img"><img src="<%=books.get(5).getImgPath()%>" class="img-responsive" alt=""/></div>
                                    <div class="list_desc"><h4><a href="<%="showDetails.do?id="+books.get(5).getId()%>"><%=books.get(5).getName()%></a></h4>1 x<span class="actual">
		                             <%=books.get(5).getPrice()%></span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="cart_box1">
                                <div class="message1">
                                    <div class="alert-close2"></div>
                                    <div class="list_img"><img src="<%=books.get(9).getImgPath()%>" class="img-responsive" alt=""/></div>
                                    <div class="list_desc"><h4><a href="<%="showDetails.do?id="+books.get(9).getId()%>"><%=books.get(9).getName()%></a></h4>1 x<span class="actual">
		                             <%=books.get(9).getPrice()%></span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="total">
                            <div class="total_left">共计 : <%=books.get(0).getPrice()+books.get(5).getPrice()+books.get(9).getPrice()%></div>
                            <div class="total_right">
                               <a href="order.html">确认</a>

                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div>

                </div>
            </div>


        </section>

    </div>
</div>

</body>
</html>
