<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/backend/include/taglib.jsp" %>

<!-- Add Modal -->
<div class="modal fade" id="addItemModal" tabindex="-1" role="dialog" aria-labelledby="addItemLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addItemLabel">新增书籍</h4>
            </div>

            <div class="modal-body">

                <form class="form-horizontal" id="addItemForm" method="post"
                      action="<spring:url value="/item/add"/>">

                    <div class="form-group">
                        <label for="addItemNo" class=" col-sm-2 am-padding-horizontal-0 control-label">书籍编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addItemNo" name="itemNo" maxlength="32"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="addItemName" class="col-sm-2 am-padding-horizontal-0 control-label">书籍名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addItemName" name="itemName" maxlength="64"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="addItemType" class="col-sm-2 am-padding-horizontal-0 control-label">书籍类别</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addItemType" name="itemType" required>
                                <option value="-1" selected>请选择</option>
                                <option value="0">未知</option>
                                <option value="1">经典名著</option>
                                <option value="2">社会科学</option>
                                <option value="3">自然科学</option>
                                <option value="4">军事地理</option>
                                <option value="5">计算机相关</option>
                                <option value="6">生活休闲</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="addItemAuthor" class=" col-sm-2 am-padding-horizontal-0 control-label">书籍作者</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addItemAuthor" name="itemAuthor" maxlength="32"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="addPublishingHouse"
                               class="col-sm-2 am-padding-horizontal-0 control-label">出版社</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addPublishingHouse" name="publishingHouse"
                                   maxlength="32"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="addItemQuantity"
                               class="col-sm-2 am-padding-horizontal-0 control-label">总数</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addItemQuantity" name="itemQuantity"
                                   required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="addItemDesc" class="col-sm-2 am-padding-horizontal-0 control-label">书籍描述</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addItemDesc" name="itemDesc" maxlength="255">
                        </div>
                    </div>

                </form>

            </div>

            <div class="modal-footer">
                <div align="center">
                    <button type="submit" class="btn btn-primary" id="addItemBtn">
                        保存
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Info Modal -->
<div class="modal fade" id="infoItemModal" tabindex="-1" role="dialog" aria-labelledby="infoItemLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="infoItemLabel">详细描述</h4>
            </div>

            <div class="modal-body">

                <form class="form-horizontal" id="infoItemForm" method="post"
                      action="#">

                    <%--<div class="form-group">--%>
                    <%--<label for="infoItemQuantity" class="col-sm-2 am-padding-horizontal-0 control-label">总数</label>--%>
                    <%--<div class="col-sm-10">--%>
                    <%--<input type="text" class="form-control" id="infoItemQuantity" name="itemQuantity">--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <div class="form-group">
                        <label for="infoItemDesc" class="col-sm-2 am-padding-horizontal-0 control-label">书籍描述</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="infoItemDesc" name="itemDesc" maxlength="255">
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                    <%--<label for="infoItemStatus" class="col-sm-2 am-padding-horizontal-0 control-label">书籍状态</label>--%>
                    <%--<div class="col-sm-10">--%>
                    <%--<select class="form-control" id="infoItemStatus" name="itemStatus" required>--%>
                    <%--<option value="-1">请选择</option>--%>
                    <%--<option value="1">可借阅</option>--%>
                    <%--<option value="0">不可借阅</option>--%>
                    <%--</select>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="form-group">--%>
                    <%--<label for="infoStartTime" class="col-sm-2 am-padding-horizontal-0 control-label">借阅时间</label>--%>
                    <%--<div class="col-sm-10">--%>
                    <%--<input type="text" class="form-control" id="infoStartTime" name="startTime" readonly>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="form-group">--%>
                    <%--<label for="infoReturnTime" class="col-sm-2 am-padding-horizontal-0 control-label">归还时间</label>--%>
                    <%--<div class="col-sm-10">--%>
                    <%--<input type="text" class="form-control" id="infoReturnTime" name="startTime" readonly>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                </form>

            </div>

            <div class="modal-footer">
                <div align="center">
                    <button type="button" class="btn btn-primary" id="updateItemBtn">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Register Modal -->
<div class="modal fade" id="registerItemModal" tabindex="-1" role="dialog" aria-labelledby="registerItemLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="registerItemLabel">详细描述</h4>
            </div>

            <div class="modal-body">

                <form class="form-horizontal" id="registerItemForm" method="post"
                      action="#">

                <%--<div class="form-group">--%>
                <%--<label for="infoItemQuantity" class="col-sm-2 am-padding-horizontal-0 control-label">总数</label>--%>
                <%--<div class="col-sm-10">--%>
                <%--<input type="text" class="form-control" id="infoItemQuantity" name="itemQuantity">--%>
                <%--</div>--%>
                <%--</div>--%>


                <div class="form-group">
                    <label for="registerUserId"
                           class="col-sm-2 am-padding-horizontal-0 control-label">用户序号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="registerUserId" name="userId"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="registerRecordNo"
                           class="col-sm-2 am-padding-horizontal-0 control-label">记录编号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="registerRecordNo" name="recordNo"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="registerStartTime"
                           class="col-sm-2 am-padding-horizontal-0 control-label">起始时间</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control date-picker" id="registerStartTime" name="startTime"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="registerReturnTime"
                           class="col-sm-2 am-padding-horizontal-0 control-label">归还时间</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="registerReturnTime" name="returnTime"
                               required>
                    </div>
                </div>

                </form>

            </div>

            <div class="modal-footer">
                <div align="center">
                    <button type="button" class="btn btn-primary" id="addRecordBtn">借阅</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>

        </div>
    </div>
</div>
