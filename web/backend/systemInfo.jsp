<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="page-wrapper">
    <!-- 顶部基本信息 -->
    <div class="header">
        <h1 class="page-header">
            E-Book 后台管理系统
            <small>欢迎来到 E-Book 后台管理系统</small>
        </h1>
    </div>

    <!-- 页面基础信息 -->
    <div id="page-inner">

        <h3>信息统计：</h3><br><br>
        <div class="row">
            <div class="col-md-6">
                <div class="board">
                    <div class="panel panel-primary">
                        <div class="number">
                            <h3>${bookNum}</h3>
                                <small>图书总数</small>
                            </h3>
                        </div>
                        <div class="icon">
                            <i class="fa fa-book fa-5x red"></i>
                        </div>
                    </div>
                </div>
            </div>



            <div class="col-md-6">
                <div class="board">
                    <div class="panel panel-primary">
                        <div class="number">
                            <h3>
                                <h3>${userNum}</h3>
                                <small>用户总数</small>
                            </h3>
                        </div>
                        <div class="icon">
                            <i class="fa fa-user fa-5x yellow"></i>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <hr style="height:1px;border:none;border-top:1px dashed #0066CC;">

        <br>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        基本信息
                    </div>
                    <div class="panel-body">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#home" data-toggle="tab">系统简介</a>
                            </li>
                            <li class=""><a href="#profile" data-toggle="tab">成员简介</a>
                            </li>
                            <li class=""><a href="#messages" data-toggle="tab">联系我们</a>
                            </li>
                            <li class=""><a href="#settings" data-toggle="tab">系统功能</a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="home">
                                <br>
                                <h3>系统简介</h3>
                                <p>BMS图书管理系统，是一个由人、计算机等组成的能进行管理信息的收集、传递、加工、保存、维护和使用的系统。</p>
                                <p>利用本系统能够方便地对系统有关的图书、用户以及借阅记录进行处理，提高中小型图书馆的工作效率。</p>
                            </div>
                            <div class="tab-pane fade" id="profile">
                                <br>
                                <h3>成员简介</h3>
                                <br>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>序号</th>
                                                    <th>学号</th>
                                                    <th>姓名</th>
                                                    <th>班级</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="success">
                                                    <td>1</td>
                                                    <td>2015302580046</td>
                                                    <td>韩晓峰</td>
                                                    <td>2015级软工一班</td>
                                                </tr>
                                                <tr class="info">
                                                    <td>2</td>
                                                    <td>2015302580057</td>
                                                    <td>安志成</td>
                                                    <td>2015级软工一班</td>
                                                </tr>
                                                <tr class="warning">
                                                    <td>3</td>
                                                    <td>2015302580066</td>
                                                    <td>郑森泽</td>
                                                    <td>2015级软工二班</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="messages">
                                <br>
                                <h3>联系我们</h3>
                                <br>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tbody>
                                            <tr class="success">
                                                <td>QQ：</td>
                                                <td>123456789</td>
                                            </tr>
                                            <tr class="info">
                                                <td>Email：</td>
                                                <td>iss123456789@whu.edu.cn</td>
                                            </tr>
                                            <tr class="warning">
                                                <td>Tel：</td>
                                                <td>15555555555</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="settings">
                                <br>
                                <h3>系统功能</h3>
                                <p>1. 准备和提供统一格式的信息，使各种统计工作简化，使信息成本最低；</p>
                                <p>2. 及时全面地提供不同要求的、不同细度的信息，以期分析解释现象最快，及时产生正确的控制。</p>
                                <p>3. 全面系统的保存大量的信息，并能很快的查询和综合，为组织的决策提出信息支持。</p>
                                <p>4. 利用数学方法和各种模型处理信息，以期预测未来和科学地进行决策。</p>
                            </div>
                        </div>
                    </div>
                </div>
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