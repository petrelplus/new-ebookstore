<%--
  Created by IntelliJ IDEA.
  User: coldilock
  Date: 2018/5/9
  Time: 00:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
</head>
<body>
<form action="register.do" method="post">
    <label> 用户名*：</label>
    <input name="username" type="text">
    <label> 密码*：</label>
    <input name="password" type="password">
    <label> 确认密码*：</label>
    <input name="repassword" type="password">
    <label> 真实姓名*：</label>
    <input name="realname" type="text">
    <label> 邮箱*：</label>
    <input name="email" type="text">
    <label> 地址：</label>
    <input name="address" type="text">
    <label> 联系电话：</label>
    <input name="telphone" type="text">
    <input type="submit" value="确认注册">
</form>
</body>
</html>
