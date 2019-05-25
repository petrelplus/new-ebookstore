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
                            <!--fixed category -->
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
    <div class="row">
        <div class="col-12">
            <div class="tabbable tabs-left">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active show" data-toggle="tab" href="#commodity">全部图书</a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#store">店铺收藏</a>
                    </li> -->
                </ul>

                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active show" id="commodity">
                        <div class="row">
                            <%
                                BookDao bookDao = new BookDao();

                                List<Book> books = bookDao.getAllBook();

                                for (Book book : books) {

                            %>
                            <a href=<%="showDetails.do?id=" + book.getId()%>>
                            <div class="col-6 col-lg-3 m-auto product " data-product-id="<%=book.getId()%>">

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
                            </a>

                            <%
                                }
                            %>

                            <div class="row">
                                <div class="col-12  ">
                                    <ul id="pagination-container" class="pagination float-right ">
                                        <li class="page-item"><a class="page-link" href="#">«</a></li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                                        <li class="page-item disabled"><a class="page-link" href="#">»</a></li>
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
    function fixPaginagtion() {

        $("#pagination-container").children().each(function (index, ele) {
            $(ele).children("a").attr("href", "#");
        })
        $(".page-link").on("click", function () {

            var category;
            $(".category-option").each(function (index, ele) {
                if ($(ele).hasClass("active")) {
                    category = $(ele).text();
                }
            });
            initBooksContainer(category, $(this).text());
        })

    }
</script>
</body>
</html>
