<%@ page import="com.store.service.CartService" %>
<%@ page import="com.store.service.impl.CartServiceImpl" %>
<%@ page import="com.store.model.User" %>
<%@ page import="com.store.model.Book" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
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
    <script src="js/cart.js"></script>
</head>
<body>
<%  CartService cartService = new CartServiceImpl();
    User user = (User)session.getAttribute("user");
    String userName = null;
    if (user != null) {
        userName = user.getUserName();
    }
    HashMap<Book,Integer> books=cartService.getBooksById(user.getId());
%>

<!--导航栏-->
<div style="background: white;">
    <div>
        <section>
            <nav class="navbar navbar-default navbar-fixed-top" style="box-shadow: 0px 0px 20px grey;">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#navbar-example">
                            <span class="sr-only">Toggle navigation</span>
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="#">Ebookstore</a>
                    </div>


                    <div class="collapse navbar-collapse" id="navbar-example">
                        <div id="nav">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#"><p>书店秒杀</p></a></li>
                                <li><a href="#"><p>销售热榜</p></a></li>
                                <li><a href="#"><p>发现好书</p></a></li>
                                <li><a href="#"><p>为你推荐</p></a></li>
                                <li><a href="#"><p>联系我们</p></a></li>
                                <%
                                    if (session.getAttribute("user") != null) {
                                %>
                                <li><a href="#"><p>
                                        <%
                                            out.print(userName);
                                    %>
                                    <ul>
                                        <li><a href="#">&nbsp;个人信息</a></li>
                                        <li><a href="/tempCart.jsp">&nbsp;购&nbsp;&nbsp;物&nbsp;&nbsp;车</a></li>
                                        <li><a href="/logout.do">&nbsp;退出登陆</a></li>
                                    </ul>
                                        <%
                                    }else{
                                %>
                                <li><a href="login.jsp"><p>登陆/注册</p></a></li>
                                <%
                                    }
                                %>
                                </p></a>

                                </li>


                            </ul>
                        </div>

                    </div>
                </div><!-- /.container-fluid -->
            </nav>    <!-- navbar -->

        </section>

        <section id="starting">
            <br><br>
            <div class="title">
                <div class="back_click">
                    <a href="index.jsp">
                        &nbsp;返回主页&nbsp;
                    </a>
                </div>
            </div>

            <div id="cart_outer">
                <div id="cart_inner">
                    <div class="catbox" id="cart_table">

                        <table id="cartTable">
                            <thead>
                            <tr>
                                <th>&nbsp;选择</th>
                                <th>&nbsp;商品</th>
                                <th>&nbsp;单价</th>
                                <th>&nbsp;数量</th>
                                <th>&nbsp;小计</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%  double totalCharge = 0;
                                for(Map.Entry<Book,Integer> book : books.entrySet()){%>
                            <tr>
                                <td><input class="check-one check" type="checkbox"/></td>
                                <td class="goods"><img src="<%= book.getKey().getImgPath()%>" alt=""/><span><%= book.getKey().getName()%></span></td>
                                <td class="price"><%= book.getKey().getPrice()%></td>
                                <td class="count"><%= book.getValue()%></td>

                                <%
                                    double singleTotal = book.getKey().getPrice() * book.getValue();
                                    totalCharge += singleTotal;
                                %>

                                <td class="subtotal"><%= singleTotal%></td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>

                        <div class="foot" id="foot">
                            <label class="fl select-all"><input type="checkbox" class="check-all check"/>&nbsp;全选</label>
                            <div class="fr closing">结 算</div>
                            <div class="fr total">合计：￥<span id="priceTotal"><%=totalCharge%></span></div>
                        </div>

                    </div>
                </div>
            </div>


        </section>

    </div>
</div>

</body>
</html>
