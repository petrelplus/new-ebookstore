<%--
  Created by IntelliJ IDEA.
  User: coldilock
  Date: 2019-05-24
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.store.model.User" %>
<%@ page import="com.store.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.dao.BookDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>图书列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    List<Book> books = (List<Book>) request.getAttribute("bookList");

%>
<div class="container">
    <br>
    <br>
    <br>
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
                            <div class="search-option dropdown-item"><a href="/bookList.do">所有类别</a></div>
                            <div class="search-option dropdown-item"><a href="/bookCategory.do?categoryId=1">科幻/奇幻</a></div>
                            <div class="search-option dropdown-item"><a href="/bookCategory.do?categoryId=2">文学</a></div>
                            <div class="search-option dropdown-item"><a href="/bookCategory.do?categoryId=3">传记</a></div>
                            <div class="search-option dropdown-item"><a href="/bookCategory.do?categoryId=4">推理</a></div>
                            <div class="search-option dropdown-item"><a href="/bookCategory.do?categoryId=5">教育</a></div>
                        </div>
                    </li>
                    <li class="nav-item ml-3 text-center">
                        <!--搜索框-->
                        <form class="form-inline mt-2 mt-md-0 " id="searchBookName">
                            <input id="search-keyword" class="form-control mr-sm-2" type="text" placeholder="请输入要搜索的关键字">
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
    <div class="row">
        <div class="col-12">
            <div class="tabbable tabs-left">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active show" data-toggle="tab" href="#commodity">全部图书</a>
                    </li>
                </ul>

                <div id="myTabContent" class="tab-content">
                    <% if(books.size()==0){%>
                        <br>
                        <div class="row">无搜索结果</div>
                        <br>
                    <%}%>
                    <div class="tab-pane fade active show" id="commodity">
                        <div class="row">
                            <%
                                for (Book book : books) {
                            %>
<%--                            <a href=<%="showDetails.do?id=" + book.getId()%>>--%>
                            <div class="col-6 col-lg-3 m-auto product " data-product-id="<%=book.getId()%>" onclick="showDetails('<%=book.getId()%>')">

                                <div class="card mb-3 box-shadow border border-info rounded bg-light">
                                    <div class="card-header mb-2 font-weight-bold text-dark"><%=book.getName()%></div>
                                    <a href="#">
                                        <img class="card-img-top img-thumbnail rounded m-auto small-cover-img" src="<%=book.getImgPath()%>" alt=" image ">
                                    </a>
                                    <div class="card-body ">
                                        <h7 class="text-info"><%=book.getAuthor()%></h7>
                                        <h5 class="card-title pricing-card-title font-weight-bold pt-2 text-secondary">￥<%=book.getPrice()%>
                                            <del class="text-muted d-inline ">
                                                <small>¥<%=(book.getPrice() + 10)%></small>
                                            </del>
                                        </h5>
                                    </div>
                                </div>
                            </div>
<%--                            </a>--%>

                            <%}%>
                            <%if(books.size()%4==3){%>
                                <div class="col-6 col-lg-3 m-auto product " data-product-id=""></div>
                            <%} else if (books.size()%4==2) {%>
                                <div class="col-6 col-lg-3 m-auto product " data-product-id=""></div>
                                <div class="col-6 col-lg-3 m-auto product " data-product-id=""></div>
                            <%} else if (books.size()%4==1) {%>
                                <div class="col-6 col-lg-3 m-auto product " data-product-id=""></div>
                                <div class="col-6 col-lg-3 m-auto product " data-product-id=""></div>
                                <div class="col-6 col-lg-3 m-auto product " data-product-id=""></div>
                            <%}%>

                            <div class="row">
                                <div class="col-12  ">
                                    <ul id="pagination-container" class="pagination float-right ">
                                        <li class="page-item"><a class="page-link" href="#">«</a></li>
                                        <%for(int i = 0; i <= books.size() / 8; i++) {%>
                                            <li class="page-item"><a class="page-link" href="#"><%out.print(i+1);%></a></li>
                                        <%}%>
                                        <li class="page-item"><a class="page-link" href="#">»</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var searchButton = document.getElementById("search-btn");
    searchButton.onclick = function(){

        var bookName = document.getElementById("search-keyword").value;
        if(typeof bookName == "undefined" || bookName == null || bookName == ""){
            alert("请输入搜索内容")
        }else{
            window.location.href = "/bookSearch.do?bookName=" + bookName;
        }

    }

    function showDetails(bookId) {
        window.location.href = "showDetails.do?id=" + bookId;
    }
</script>
</body>
</html>
