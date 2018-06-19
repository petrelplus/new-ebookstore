<%@ page import="java.util.HashMap" %>
<%@ page import="com.store.model.Book" %>
<%@ page import="com.store.dao.CartDao" %>
<%@ page import="com.store.service.CartService" %>
<%@ page import="com.store.service.impl.CartServiceImpl" %>
<%@ page import="com.store.model.User" %><%--
  Created by IntelliJ IDEA.
  User: swx6868752
  Date: 2018/5/9
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车详情</title>
</head>
<body>
<%CartService cartService = new CartServiceImpl();
    User user = (User)session.getAttribute("user");
HashMap<Book,Integer> books=cartService.getBooksById(user.getId());
%>
<%=books.size()%>
<!--books就是一个主键是书对象，值是每本书的数量，遍历输出即可-->
</body>
</html>
