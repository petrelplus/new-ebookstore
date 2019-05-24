<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/backend/include/taglib.jsp" %>

<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>名称</th>
        <th>价格</th>
        <th>描述</th>
        <th>作者</th>
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
            <td>${book.author}</td>
            <td>
                <c:if test="${book.secondClassifyId == 0}">未知</c:if>
                <c:if test="${book.secondClassifyId == 1}">经典名著</c:if>
                <c:if test="${book.secondClassifyId == 2}">秒杀书籍</c:if>
            </td>
            <td>
                <button type="button" class="btn btn-info infoItemBtn"
                        data-bookid="${book.id}"
                        data-bookname = "${book.name}"
                        data-bookprice = "${book.price}"
                        data-bookdesc = "${book.description}"
                        data-booktype = "${book.secondClassifyId}"
                        data-bookauthor = "${book.author}"
                        data-toggle="modal" data-target="#modifyBookModal">
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

<!-- Modify Modal -->
<div class="modal fade" id="modifyBookModal" tabindex="-1" role="dialog" aria-labelledby="modifyBookLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modifyBookLabel">修改书籍信息</h4>
            </div>

            <div class="modal-body">

                <form class="form-horizontal" id="modifyBookForm" method="post">

                    <div class="form-group">
                        <label for="modifyBookId" class=" col-sm-2 am-padding-horizontal-0 control-label">书籍编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="modifyBookId" name="modifyBookId" maxlength="32"
                                   disabled>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="modifyBookName" class=" col-sm-2 am-padding-horizontal-0 control-label">书籍名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="modifyBookName" name="modifyBookName" maxlength="32"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="modifyBookPrice" class="col-sm-2 am-padding-horizontal-0 control-label">书籍价格</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="modifyBookPrice" name="modifyBookPrice" maxlength="64"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="modifyBookAuthor" class="col-sm-2 am-padding-horizontal-0 control-label">书籍作者</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="modifyBookAuthor" name="modifyBookAuthor" maxlength="64"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="modifyBookType" class="col-sm-2 am-padding-horizontal-0 control-label">书籍类别</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="modifyBookType" name="modifyBookType" required>
                                <option value="-1" selected>请选择</option>
                                <option value="1">经典名著</option>
                                <option value="2">秒杀书籍</option>
                                <option value="3">自然科学</option>
                                <option value="4">军事地理</option>
                                <option value="5">计算机相关</option>
                                <option value="6">生活休闲</option>
                                <option value="7">社会科学</option>
                                <option value="8">其 他</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="modifyBookDescription" class=" col-sm-2 am-padding-horizontal-0 control-label">书籍描述</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="modifyBookDescription" name="modifyBookDescription" maxlength="32"
                                   required>
                        </div>
                    </div>
                </form>

            </div>

            <div class="modal-footer">
                <div align="center">
                    <button type="button" class="btn btn-primary" id="bookModifyBtn">
                        保 存
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取 消</button>
                </div>
            </div>

        </div>
    </div>
</div>