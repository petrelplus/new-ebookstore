<%--
  Created by IntelliJ IDEA.
  User: coldilock
  Date: 2018/5/9
  Time: 00:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>
<head>
    <title>登录页面</title>
</head>
<body>
    <form action="login.do" method="post">
        <label>用户名：</label>
        <input type="text" name="username">
        <label>密码：</label>
        <input type="password" name="password">
        <input type="submit" value="登录">
    </form>
    <button name="registerBtn" onclick="window.location.href='register.jsp'">注册</button>
</body>
</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <title>Login</title>
    <link href="layui/layuiCIJ/css/default.css" rel="stylesheet" type="text/css" />
    <!--必要样式-->
    <link href="layui/layuiCIJ/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="layui/layuiCIJ/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="layui/layuiCIJ/css/loaders.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class='login'>
    <div class='login_title'>
        <span>eBookStore账户登陆</span>
    </div>

    <form action="LoginOrRegister" method="post">
        <div class='login_fields'>
            <div class='login_fields__user'>
                <div class='icon'>
                    <img alt="" src='img/user_icon_copy.png'>
                </div>
                <input name="login" placeholder='用户名' maxlength="16" type='text' autocomplete="off" />
                <div class='validation'>
                    <img alt="" src='img/tick.png'>
                </div>
            </div>
            <div class='login_fields__password'>
                <div class='icon'>
                    <img alt="" src='img/lock_icon_copy.png'>
                </div>
                <input name="pwd" placeholder='密码' maxlength="16" type='text' autocomplete="off">
                <div class='validation'>
                    <img alt="" src='img/tick.png'>
                </div>
            </div>
            <div class='login_fields__password'>
                <div class='icon'>
                    <img alt="" src='img/key.png'>
                </div>
                <input name="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off">
                <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
                    <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
                </div>
            </div>
            <center>
                <div class='login_fields__submit'>
                    <input type='button' value='注册' name="type1">
                    <div>
                        &nbsp;
                    </div>
                    <input type='button' value='登陆' name="type2">
                </div>
            </center>

        </div>



    </form>

    <div class='success'>
    </div>
</div>
<div class='authent'>
    <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <p>Wait For a moment...</p>
</div>
<div class="OverWindows">

    <form action="LoginOrRegister"method="post">
        <input type="text" name="username" value="nul" id="username">
        <input type="text" name="password" value="nul" id="password">
        <input type="text" name="type" id="type" value="Log   In">
        <input type="submit" id="aiyou" value="tijiao">
    </form>

</div>



<link href="layui/css/layui.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="layui/layuiCIJ/js/jquery.min.js"></script>
<script type="text/javascript" src="layui/layuiCIJ/js/jquery-ui.min.js"></script>
<script type="text/javascript" src='layui/layuiCIJ/js/stopExecutionOnTimeout.js?t=1'></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="layui/layuiCIJ/js/Particleground.js"></script>
<script type="text/javascript" src="layui/layuiCIJ/js/Treatment.js"></script>
<script type="text/javascript" src="layui/layuiCIJ/js/jquery.mockjax.js"></script>
<script type="text/javascript">
    var canGetCookie = 1;//是否支持存储Cookie 0 不支持 1 支持
    var CodeVal = 0;
    Code();
    function Code() {
        if(canGetCookie == 1){
            createCode("AdminCode");
            var AdminCode = getCookieValue("AdminCode");
            showCheck(AdminCode);
        }else{
            showCheck(createCode(""));
        }
    }
    function showCheck(a) {
        CodeVal = a;
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        ctx.clearRect(0, 0, 1000, 1000);
        ctx.font = "80px 'Hiragino Sans GB'";
        ctx.fillStyle = "#E8DFE8";
        ctx.fillText(a, 0, 100);
    }
    $(document).keypress(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $('input[name="type2"]').click();
        }
    });

    //粒子背景特效
    $('body').particleground({
        dotColor: '#E8DFE8',
        lineColor: '#133b88'
    });
    $('input[name="pwd"]').focus(function () {
        $(this).attr('type', 'password');
    });
    $('input[type="text"]').focus(function () {
        $(this).prev().animate({ 'opacity': '1' }, 200);
    });
    $('input[type="text"],input[type="password"]').blur(function () {
        $(this).prev().animate({ 'opacity': '.5' }, 200);
    });
    $('input[name="login"],input[name="pwd"]').keyup(function () {
        var Len = $(this).val().length;
        if (!$(this).val() == '' && Len >= 5) {
            $(this).next().animate({
                'opacity': '1',
                'right': '30'
            }, 200);
        } else {
            $(this).next().animate({
                'opacity': '0',
                'right': '20'
            }, 200);
        }
    });
    var open = 0;
    layui.use('layer', function () {
        //登陆触发事件
        $('input[name="type1"]').click(function () {
            var login = $('input[name="login"]').val();
            var pwd = $('input[name="pwd"]').val();
            var code = $('input[name="code"]').val();
                //认证中..
                document.getElementById("username").value=login;
                document.getElementById("password").value=pwd;
                document.getElementById("type").value='Register';
                $('.login').addClass('test'); //倾斜特效
                setTimeout(function () {
                    $('.login').addClass('testtwo'); //平移特效
                }, 300);
                setTimeout(function () {
                    $('.authent').show().animate({ right: -320 }, {
                        easing: 'easeOutQuint',
                        duration: 600,
                        queue: false
                    });
                    $('.authent').animate({ opacity: 1 }, {
                        duration: 200,
                        queue: false
                    }).addClass('visible');
                }, 500);

                setTimeout(function () {
                    $('.authent').show().animate({right: 90}, {
                        easing: 'easeOutQuint',
                        duration: 600,
                        queue: false
                    });
                    $('.authent').animate({opacity: 0}, {
                        duration: 200,
                        queue: false
                    }).addClass('visible');
                    $('.login').removeClass('testtwo'); //平移特效
                    document.getElementById("aiyou").click();
                }, 2000);
                setTimeout(function () {
                    $('.authent').hide();
                    $('.login').removeClass('test');

                    $('.login div').fadeOut(100);
                    $('.success').fadeIn(1000);
                    $('.success').html(data.Text);

                }, 2400);




        })

        $('input[name="type2"]').click(function () {
            var login = $('input[name="login"]').val();
            var pwd = $('input[name="pwd"]').val();
            var code = $('input[name="code"]').val();
            if (login == '') {
                ErroAlert('please input your username');
            } else if (pwd == '') {
                ErroAlert('please input your password');
            } else if (code == '' || code.length != 4||code.toUpperCase()!=CodeVal.toUpperCase()) {
                ErroAlert('your code is wrong');
            } else {
                //认证中..
                document.getElementById("username").value=login;
                document.getElementById("password").value=pwd;
                document.getElementById("type").value='Log   In';
                $('.login').addClass('test'); //倾斜特效
                setTimeout(function () {
                    $('.login').addClass('testtwo'); //平移特效
                }, 300);
                setTimeout(function () {
                    $('.authent').show().animate({ right: -320 }, {
                        easing: 'easeOutQuint',
                        duration: 600,
                        queue: false
                    });
                    $('.authent').animate({ opacity: 1 }, {
                        duration: 200,
                        queue: false
                    }).addClass('visible');
                }, 500);

                setTimeout(function () {
                    $('.authent').show().animate({right: 90}, {
                        easing: 'easeOutQuint',
                        duration: 600,
                        queue: false
                    });
                    $('.authent').animate({opacity: 0}, {
                        duration: 200,
                        queue: false
                    }).addClass('visible');
                    $('.login').removeClass('testtwo'); //平移特效
                    document.getElementById("aiyou").click();
                }, 2000);
                setTimeout(function () {
                    $('.authent').hide();
                    $('.login').removeClass('test');

                    $('.login div').fadeOut(100);
                    $('.success').fadeIn(1000);
                    $('.success').html(data.Text);

                }, 2400);



            }
        })
    })


</script>

</body>
</html>

