<%@ page import="com.store.model.User" %>
<%@ page import="com.store.model.Book" %><%--
  Created by IntelliJ IDEA.
  User: coldilock
  Date: 2018/5/9
  Time: 00:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <script>
        function bigImg(x){
            x.style.boxShadow = "grey 5px 10px 20px";
        }

        function normalImg(x){
            x.style.boxShadow = "grey 5px 10px 50px";
        }
    </script>

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
                                        <li><a href="/cart.jsp">&nbsp;购&nbsp;&nbsp;物&nbsp;&nbsp;车</a></li>
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
            <div id="outer">
                <div id="inner_book">
                    <div id="book_image">
                        <a href="#"><img id="book_image_file" onmousemove="bigImg(this)" onmouseout="normalImg(this)" src=<%=book.getImgPath()%> /></a>
                    </div>
                    <div id="book_sale">
                        <div id="book_label">
                            <div id="book_name">
                                <%=book.getName() %>
                            </div>
                            <div id="book_star">评分：<span style="font-size: 20px;text-shadow: grey 2px 2px 8px;">⭐️⭐⭐⭐⭐</span></div>
                            <div id="book_price">
                                价格：<span style="font-size: 20px;color:#DC143C;">￥<%=book.getPrice() %></span>
                            </div>
                        </div>
                        <div id="book_order">
                            <div id="book_address">收货地址</div>
                            <div id="book_number" class="number">
                                <ul class="btn-numbox">
                                    <li><span class="number">数量：</span></li>
                                    <li>
                                        <ul class="count">
                                            <li><span id="num-jian" class="num-jian">-</span></li>
                                            <li><input type="text" class="input-num" id="input-num" value="0" /></li>
                                            <li><span id="num-jia" class="num-jia">+</span></li>
                                        </ul>
                                    </li>
                                    <li><span class="kucun">（库存:100）</span></li>
                                </ul>
                            </div>
                            <div id="book_buy">
                                <%
                                    if(session.getAttribute("user") != null){
                                %>
                                <div class="newpage_click">
                                    <a href="#" class="buy_button" onclick="addCart('<%=((User) session.getAttribute("user")).getId()%>','<%=book.getId()%>')">
                                        加入购物车
                                    </a>
                                </div>
                                <%
                                }else{
                                %>
                                <div class="newpage_click">
                                    <a href="#" class="buy_button" onclick="alert('请先登录')">
                                        加入购物车
                                    </a>
                                </div>
                                <%
                                    }
                                %>
                                <div class="delete_click">
                                    <a href="#" class="buy_button">
                                        &nbsp;直接购买&nbsp;
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div id="inner_info" style="background-image:url('img/z.png')">
                    <div id="info_title"><%=book.getName() %></div>
                    <div id="info_author">作者：xxx</div>
                    <div id="info_publisher">出版社：xxx</div>
                    <div id="info_year">出版年份：2018.6</div>
                    <div id="info_description" style="text-shadow: darkgrey 0px 0px 3px;"><%=book.getDescription()%></div>
                </div>

            </div>

            <script>

                var num_jia = document.getElementById("num-jia");
                var num_jian = document.getElementById("num-jian");
                var input_num = document.getElementById("input-num");

                num_jia.onclick = function() {

                    input_num.value = parseInt(input_num.value) + 1;
                }

                num_jian.onclick = function() {

                    if(input_num.value <= 0) {
                        input_num.value = 0;
                    } else {

                        input_num.value = parseInt(input_num.value) - 1;
                    }

                }

                /* 如果在和后台做数据交互时，出现点击加减按钮的值无法传到后台的情况，可以用下面这种方式
                $("body").on("click", ".num-jian", function(m) {
                    var obj = $(this).closest("ul").find(".input-num");
                    if(obj.val() <= 0) {
                         obj.val(0);
                    } else {
                         obj.val(parseInt(obj.val()) - 1);
                    }
                    obj.change();
                 });

                $("body").on("click", ".num-jia", function(m) {
                    var obj = $(this).closest("ul").find(".input-num");
                    obj.val(parseInt(obj.val()) + 1);
                    obj.change();
                });*/
                function addCart(userId, bookId) {
                    var bookNumber = $("#input-num").val();

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

        </section>

    </div>
</div>


</body>
</html>