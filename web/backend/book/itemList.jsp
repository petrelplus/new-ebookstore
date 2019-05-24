<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/backend/include/taglib.jsp" %>

<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>名称</th>
        <th>价格</th>
        <th>描述</th>
        <th>封面</th>
        <th>类别</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${bookList}" var="book">
        <tr>
            <td>${book.name}</td>
            <td>${book.price}</td>
            <td>${book.description}</td>
            <td>${book.imgPath}</td>
            <td>
                <c:if test="${book.secondClassifyId == 0}">未知</c:if>
                <c:if test="${book.secondClassifyId == 1}">未知</c:if>
                <c:if test="${book.secondClassifyId == 2}">秒杀书籍</c:if>
            </td>
            <td>
                <button type="button" class="btn btn-info infoItemBtn"
                        data-id="${book.id}"
                        data-url="/item/update/${book.id}"
                        data-toggle="modal" data-target="#infoItemModal">
                    <i class="backspace-icon fa fa-pencil"></i> 修改
                </button>
                <button type="button" class="btn btn-warning bookDeleteBtn"
                        data-id="${book.id}">
                    <i class="backspace-icon fa fa-eraser"></i> 删除
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>