<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String userName = request.getParameter("user");%>
<div id="preloader"></div>

<!--导航栏-->
<div id="wrapper">
    <div id="overlay-1">
        <section id="navigation-scroll">
            <nav class="navbar navbar-default navbar-fixed-top">
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
                                <li><a href="/bookList.do"><p>全部图书</p></a></li>
                                <li><a href="#sale"><p>书店秒杀</p></a></li>
                                <li><a href="#list"><p>销售热榜</p></a></li>
                                <li><a href="#ScreenShot"><p>发现好书</p></a></li>
                                <li><a href="#recommend"><p>为你推荐</p></a></li>
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

            <div class="text-center starting-text wow animated zoomInDown">
                <h2></h2>
                <h2 style="font-size: 90px  " color: #FFFFFF;>Welcome to Ebookstore</h2>
                <br>
                <h2 style="font-size: 38px  " color: #FFFFFF class="small">Take &nbsp; a &nbsp; look&nbsp; at </h2>


                <a href="#sale" class="bttn apple-store btn btn-lg">
                    <img src="img/apple.png" alt="apple">
                    <br>
                    <h6>书店秒杀榜</h6>
                </a>

                <a href="#list" class="bttn google-play btn btn-lg">
                    <img src="img/play.png" alt="play">
                    <br>
                    <h6>本周销售榜</h6>
                </a>


            </div>
        </section>

    </div>
</div>

