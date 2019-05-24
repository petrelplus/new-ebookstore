<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/backend/include/taglib.jsp" %>

<form class="form-horizontal" id="queryBookForm" method="post"
      action="/backend/book/query">
    <div class="form-group am-margin-bottom-sm">

        <label for="queryBookName" class="col-md-2 am-padding-horizontal-0 control-label">书籍名称</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="queryBookName" name="bookName" maxlength="64">
        </div>

        <%--<label for="queryItemType" class="col-md-2 am-padding-horizontal-0 control-label">书籍类别</label>--%>
        <%--<div class="col-sm-3">--%>
            <%--<select class="form-control" id="queryItemType" name="itemType" required>--%>
                <%--<option value="-1" selected>请选择</option>--%>
                <%--<option value="0">未知</option>--%>
                <%--<option value="1">经典名著</option>--%>
                <%--<option value="2">秒杀书籍</option>--%>
            <%--</select>--%>
        <%--</div>--%>

        <button type="button" class="col-sm-1 btn btn-primary" id="queryBookBtn" style="margin-left: 36px">
            查询
        </button>

    </div>

</form>

