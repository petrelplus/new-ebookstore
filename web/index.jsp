<%@ page import="com.store.model.User" %>
<%@ page import="com.store.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.dao.BookDao" %><%--
  Created by IntelliJ IDEA.
  User: ISSUSER
  Date: 2018/6/7
  Time: 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html xmlns:color="http://www.w3.org/1999/xhtml">
<head>
    <title>ebookstore</title>

    <!-- meta -->
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
    <style type="text/css">
        #nav ul li ul{ position:absolute; display:none;}
        #nav ul li ul li{ float:none; line-height:30px; text-align:left;}
        #nav ul li ul li a{ width:100%;}
        #nav ul li ul li a:hover{ background-color:#06f;}
        #nav ul li:hover ul{ display:block}
    </style>


    <!-- js -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/jquery.actual.min.js"></script>
</head>


<body data-spy="scroll" data-target="#navbar-example">
<%
    String userName = null;
    User user = (User)session.getAttribute("user");
    if(user != null){
        userName = user.getUserName();
    }
%>
<jsp:include page="head.jsp">
    <jsp:param name="user" value="<%=userName%>"/>
</jsp:include>

<div id="bottom" class="bottom text-center">
    <a href="#about"><i class="ion-ios7-arrow-down"></i></a>
</div>

</div>
</div>

<!-- 秒杀榜 -->
<section id="sale">
    <div class="container">
        <div class="row text-center heading">
            <div class="wow animated zoomInDown heading-text">
                <br/>
                <br/>
                <br/>

            </div>


        </div>    <!-- row -->
        <div class="row about-us-text">
            <div class="col-md-12">


                <p class="text-center">

                <p>Ebookstore书店的秒杀活动已经开始啦.
                    今天的秒杀，纷纷以书友们惊人的手速迅速告终。接下来，还有更多让你大展身手的机会在等你
                    从明天起，每天的秒杀活动都在继续，如果想第一时间参加活动，请持续刷新本网站，这段文案后面自行修改。
                </p>
                </p>
            </div>
        </div>    <!-- row -->


        <div class="row main_content">

            <%
                BookDao bookDao = new BookDao();

                List<Book> books = bookDao.getMiaoShaBooks();

                for (Book book : books) {

            %>

            <div class="col-md-4 col-sm-4 wow animated zoomIn " data-wow-delay="0.1s">
                <a href=<%="showDetails.do?id=" + book.getId()%>>
                    <figure>
                        <img class="pro img-responsive center-block " src="<%=book.getImgPath()%>" alt="image" style="box-shadow: 10px 8px 10px #616161;">
                    </figure>
                    <h5 class="text-center"><%=book.getName()%></h5>
                </a>

            </div>    <!-- col-md-4 -->

            <%
                }
            %>

            <div class="container-fluid">
                <div class="col-md-offset-11 col-md-1 col-sm-offset-11 col-sm-1 wow animated zoomIn"
                     data-wow-delay="0.3s"><a href="#"><p style="font-size: 13px">&nbsp;</p></a></div>
                <div class="col-md-offset-11 col-md-1 col-sm-offset-11 col-sm-1 wow animated zoomIn"
                     data-wow-delay="0.3s"><a href="#"><p style="font-size: 13px">更多 》</p></a></div>

            </div><!-- row main_content -->


        </div>    <!-- container -->
    </div>
</section>    <!-- about us -->

<!-- 销售热榜 -->
<section id="list">
    <div class="container">
        <div class="row text-center heading">
            <br>
            <br>
        </div>

        <div class="main_content">
            <div class="services">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="service">
                            <img src="img/jiusannian.jpg" alt="service1">
                            <div class="text-center">
                                <h4>九三年</h4>
                                <p>
                                    大作家雨果的最后一部长篇小说。不论是革命者还是被革命者，都是伟大的人。
                                </p>
                            </div>
                        </div>
                    </div> <!-- .col-md-3 -->


                    <div class="col-md-3 col-sm-6">
                        <div class="service">
                            <img src="img/renjiancihua.jpg" alt="service1">
                            <div class="text-center">
                                <h4>人间词话</h4>
                                <p>
                                    叶嘉莹说，只有如他这般伟大的作家，才能在作品中创造出王氏之“人生三境界”般作品中的世界。
                                </p>
                            </div>
                        </div>
                    </div> <!-- .col-md-3 -->


                    <div class="col-md-3 col-sm-6">
                        <div class="service">
                            <div class="service">
                                <img src="img/siyuetian.jpg" alt="service1">
                                <div class="text-center">
                                    <h4>你是人间四月天</h4>
                                    <p>
                                        “我说，你是人间的四月天； 笑响点亮了四面风；轻灵在春的光艳中交舞着变。”，其文如其人。
                                    </p>
                                </div>
                            </div>
                        </div> <!-- .service -->
                    </div> <!-- .col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service">
                            <div class="service">
                                <img src="img/tm2.png" alt="service1">
                                <div class="text-center">
                                    <h4>三人同舟</h4>
                                    <p>
                                        这是一个荡气回肠的小说故事。说了什么我也不知道，你可以自己去看看。听说还不错哦。
                                    </p>
                                </div>
                            </div>
                        </div> <!-- .service -->
                    </div> <!-- .col-md-3 -->

                </div>    <!-- row -->
            </div>    <!-- services -->
        </div>    <!-- main_content -->

        <div class="wow animated zoomInDown heading-text text-center">
            <br>
            <h3>销售热榜</h3>
            <br/>
            <h4 style="color: aliceblue">精选本周销售量前列的图书，倾城为你推荐</h4>
        </div>
    </div>    <!-- container -->
</section>


<!--发现好书-->
<section id="ScreenShot">
    <div class="container">
        <div class="row text-center heading">
            <div class="wow animated zoomIn heading-text">
                <br>
                <br>
                <h3>这里发现书籍的芳香</h3>

            </div> <!-- #heading-text -->
        </div>
        <div class="main_content">
            <div class="container">

                <div class="col-xs-12">
                    <div id="screenshots-wrap" class="owl-carousel owl-theme">
                        <a href="img/comp.jpg" class="item" data-lightbox-gallery="screenshots">
                            <img src="img/comp.jpg" class="img_res wow animated zoomIn" alt="">
                        </a>

                        <a href="img/java.jpg" class="item" data-lightbox-gallery="screenshots">
                            <img src="img/java.jpg" class="img_res wow animated zoomIn" alt="">
                        </a>
                        <a href="img/maogai2.jpg" class="item" data-lightbox-gallery="screenshots">
                            <img src="img/maogai2.jpg" class="img_res wow animated zoomIn" alt="">
                        </a>

                        <a href="img/gangyao.jpg" class="item" data-lightbox-gallery="screenshots">
                            <img src="img/gangyao.jpg" class="img_res wow animated zoomIn" alt="">
                        </a>
                        <a href="img/Compiler.jpg" class="item" data-lightbox-gallery="screenshots">
                            <img src="img/Compiler.jpg" class="img_res wow animated zoomIn" alt="">
                        </a>

                        <a href="img/miaosha/yecheng2.jpg" class="item" data-lightbox-gallery="screenshots">
                            <img src="img/miaosha/yecheng2.jpg" class="img_res wow animated zoomIn" alt="">
                        </a>
                        <a href="img/sixiu.jpg" class="item" data-lightbox-gallery="screenshots">
                            <img src="img/sixiu.jpg" class="img_res wow animated zoomIn" alt="">
                        </a>

                        <a href="img/mayuan.jpg" class="item" data-lightbox-gallery="screenshots">
                            <img src="img/mayuan.jpg" class="img_res wow animated zoomIn" alt="">
                        </a>

                    </div>
                </div>

            </div>    <!-- row -->
        </div>    <!-- .container -->
    </div>    <!-- main_content -->
    <!--</div>	 container -->
</section>    <!-- #ScreenShot -->


<!--为你推荐-->
<section id="recommend">
    <div class="container">
        <div class="row text-center heading">
            <div class="bg-image col-md-12">
                <div class="wow animated zoomIn heading-text">
                    <br>
                    <h3>这些你值得品味</h3>
                    <br/>
                </div>
            </div>
        </div>
        <div class="row main_content">
            <div class="col-md-10 col-md-offset-1">
                <div id="client-speech" class="owl-carousel owl-theme">
                    <div class="item">
                        <img class=" img-responsive center-block" src="img/luxun2.png" alt="text">
                        <br>
                        <br>
                        <br>
                        <p class="client-comment text-center">
                            这是一本好书，这真的是一本好书；这是一本我从来没有见过的好书；这本书真的太好了，你快点读吧。<br>
                            这是一本好书；这是一本我从来没有见过的好书；这本书真的太好了，你快点读吧。
                        </p>
                        <br>
                        <div class="row text-center">
                            <p class="client-name text-center"> ----- 孙文祥轻轻为你说的</p>
                        </div>
                    </div>
                    <div class="item">
                        <img class=" img-responsive center-block" src="img/shanhe.jpg" alt="text">
                        <br>
                        <br>
                        <br>
                        <p class="client-comment text-center">
                            一处建筑，一处文化，一段历史，山河是历久弥新的历史，山河中有千秋，有百代。这既是余秋雨先生的游记，却又是一本山河之书，一段山河之情<br>
                            这里除了残砖破瓦，什么都没有，这里没有历史，这里就是历史。
                        </p>
                        <br>
                        <div class="row text-center">
                            <p class="client-name text-center"> ----- 匿名轻轻为你说的</p>
                        </div>
                    </div>
                    <div class="item">
                        <img class=" img-responsive center-block" src="img/wenhua.jpg" alt="text">
                        <br>
                        <br>
                        <br>
                        <p class="client-comment text-center">
                            文化苦旅，堪称余秋雨先生的代表作，也是他的第一部文化散文集。读其散文，可见其思想深刻，抒情而蕴育哲理，发人深思，又不觉玄妙。<br>
                            获奖无数，经典之作。
                        </p>
                        <br>
                        <div class="row text-center">
                            <p class="client-name text-center"> ----- 匿名轻轻为你说的</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>    <!-- clients -->


<!-- 联系我们 -->
<section id="contact">
    <div class="container text-center">
        <div class="row text-center">
            <div class="bg-image">
                <div class="col-md-6 col-md-offset-3 text-center share-text wow animated zoomInDown heading-text">
                    <p class="heading">
                        如果你有任何问题，可以给我们书店留言哦；以上所有文案欢迎各位自行修改。
                    </p>
                </div>
            </div>
        </div>
        <div class="row text-center main_content">
            <form method="post" action="#" class="">
                <div class="col-md-4 col-md-offset-2 text-center">
                    <div class="form">
                        <div class="input-group margin-bottom-sm">
	  								<span class="input-group-addon">
	  									<i class="fa fa-user fa-fw"></i>
	  								</span>
                            <input class="form-control" type="text" placeholder="姓名" required>
                        </div>
                        <div class="input-group margin-bottom-sm">
	  								<span class="input-group-addon">
	  									<i class="fa fa-envelope-o fa-fw"></i>
	  								</span>
                            <input class="form-control" name="email" type="email" placeholder="邮箱地址" required>
                        </div>
                        <div class="input-group margin-bottom-sm">
	  								<span class="input-group-addon">
	  									<i class="fa fa-tags fa-fw"></i>
	  								</span>
                            <input class="form-control" type="text" placeholder="书籍名称">
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="form">
                        <div class="input-group margin-bottom-sm">
									<span class="input-group-addon">
										<i class="fa fa-comment-o fa-fw"></i>
									</span>
                            <input type="text" name="text" class="form-control message" placeholder="留言信息">
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <input class="btn btn-sub" type="submit" value="提交信息">
    </div>
</section>


<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/jquery.knob.js"></script>
<script src="js/daterangepicker.js"></script>
<script src="js/bootstrap3-wysihtml5.all.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/nivo-lightbox/nivo-lightbox.min.js"></script>
<script src="js/script.js"></script>

</body>
</html>
