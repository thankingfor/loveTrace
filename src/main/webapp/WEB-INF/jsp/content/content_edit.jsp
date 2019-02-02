<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>数据维护-内容详情-内容修改</title>
<%@ include file="../common/common_css.jsp"%>
<%@ include file="../common/common_js.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/content/content_edit.js"></script>
<script type="text/javascript">
var datetime = "${content.datetime }";
var article = '${content.content }';
</script>
</head>
<body>
<!-- 导航栏 -->
<%@ include file="../common/manager_header.jsp"%>
<!-- 内容 -->
<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="page-header" style="text-align:center;">
                <h1>内容修改</h1>
            </div>
            <div class="page-body">
                <form id="addForm">
                    <div class="form-group">
                        <label for="addname">内容名称</label>
                        <input type="text" id="addFormTitle" name="title" value="${content.title }" class="form-control" placeholder="请输入内容名字" required data-bv-notempty-message="不能为空">
                    </div>
                    <div class="form-group">
		                <div class="input-group date col-md-4" >
		                    <input class="form-control form_datetime" size="16" type="text" value="" name="datetime" readonly>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
		            </div>
                    <div class="form-group">
                    	<div id="addFormPicName">
                    		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#selectPicModal">添加图片到图床</button>
                    		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#selectPicAddrModal">添加内容地址</button>
                    		<c:forEach items="${content.images }" var="image">
                    			<img src='${image }' style='height: 50px;width: 70px;'>
                    		</c:forEach>
                    	</div>
                        <input type="hidden" id="addFormPic" name="img" value="${content.img }" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="addname">内容的故事</label>
                        <div id="editor"></div>
                    	<input type="hidden" id="addFormContent" value="" name="content">
                    </div>
                    
					<div class="page-footer" style="text-align:center;margin-top: 50px;margin-bottom: 50px;">
						<button type="button" class="btn btn-success" onclick="addContent(${content.id })" style="height: 40px;width: 140px;">修改</button>
		            </div>
                </form>
            </div>
     	</div>
     	<div class="col-md-1"></div>
     </div>
</div>
<!-- 内容 -->
<!-- 模态框 -->
<!-- 添加图片 -->
<div style="z-index: 100000" class="modal fade" id="selectPicModal" tabindex="-1" role="dialog" aria-labelledby="selectPicModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">选择图片</h4>
            </div>
            <div class="modal-body">
                <form id="selectPicForm">
                	<input type="file" id="filePicture" name="uploadFile" multiple="multiple" >
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="selectPic()">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 添加图片 -->
<!-- 添加图片地址 -->
<div style="z-index: 100000" class="modal fade" id="selectPicAddrModal" tabindex="-1" role="dialog" aria-labelledby="selectPicAddrModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加图片地址</h4>
            </div>
            <div class="modal-body">
            	<div class="form-group">
                    <label for="addname">图片的地址（多张图片用逗号分隔）</label>
                    <input type="text" id="picAddr" name="title" class="form-control" placeholder="请输入图片的地址（多张图片用逗号分隔）" required data-bv-notempty-message="不能为空">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="selectPicAddr()">添加</button>
            </div>
        </div>
    </div>
</div>
<!-- 添加图片地址 -->
<!-- 模态框 -->

</body>
</html>