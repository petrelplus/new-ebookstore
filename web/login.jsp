<%--
  Created by IntelliJ IDEA.
  User: coldilock
  Date: 2018/5/9
  Time: 00:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
</html>
