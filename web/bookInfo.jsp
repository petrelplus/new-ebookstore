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
    <!-- <link rel="stylesheet" href="css/ionicons.min.css"> -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="js/nivo-lightbox/nivo-lightbox.css">
    <link rel="stylesheet" href="js/nivo-lightbox/nivo-lightbox-theme.css">
    <link rel="stylesheet" href="css/custom.css">

    <!-- js -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/jquery.actual.min.js"></script>

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
<%--<jsp:include page="head.jsp">--%>
    <%--<jsp:param name="user" value="<%=userName%>"/>--%>
<%--</jsp:include>--%>

<div id="content">
    <div id="content-left">
        <div id="detailsdetails">
            <div class="title">
                <a href="index.jsp">主页</a> >> 所有书籍
            </div>
            <div class="item">
                <div class="item-left">
                    <img src=<%=book.getImgPath()%>>
                </div>
                <div class="item-right">
                    <div class="box_top"></div>
                    <div class="box_center">
                        <div class="orange">简介:</div>
                        <p class="details">
                            <%=book.getDescription()%>
                        </p>
                    </div>
                    <%--<div class="box_bottom"></div>--%>
                </div>
            </div>
            <fieldset>
                <legend>详细介绍</legend>
                <div class="ttt">
                    <span>名称:</span>
                    <%=book.getName() %>
                    <br> <span>价格:￥<%=book.getPrice() %></span>
                </div>
                <hr>
                <p><%=book.getDescription() %>
                </p>
            </fieldset>
            <%--<a href="CartServlet?id=<%=book.getId()%>" class="addtocart">--%>
                <%--<img src="img/apple.png">--%>
            <%--</a>--%>
        </div>
    </div>
</div>
</body>
</html>