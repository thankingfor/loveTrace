<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>数据维护-内容详情-内容添加</title>
<%@ include file="../common/common_css.jsp"%>
<%@ include file="../common/common_js.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/photo/photo_edit.js"></script>
<script type="text/javascript">
var datetime = "${story.datetime }";
var article = '${story.article }';
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
                <h1>相册修改</h1>
            </div>
            <div class="page-body">
                <form id="addForm">
                    <div class="form-group">
                        <label for="addname">相册名称</label>
                        <input type="text" id="addFormTitle" name="name" value="" class="form-control" placeholder="请输入相册名字" required data-bv-notempty-message="不能为空">
                    </div>
                    <div class="form-group">
		                <div class="input-group date col-md-4" >
		                    <input class="form-control form_datetime" size="16" type="text" value="" name="datetime" readonly>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
		            </div>
                    <div class="form-group">
                   		<label for="images">图片</label>
                   		<c:forEach items="${photos }" var="photo">
                   			<img src='${photo.path }' style='height: 50px;width: 70px;'>
                   		</c:forEach>
                    </div>
                    <div class="form-group">
                        <label for="addname">相册的故事</label>
                        <div id="editor"></div>
                    	<input type="hidden" id="addFormContent" value="" name="article">
                    </div>
                    
					<div class="page-footer" style="text-align:center;margin-top: 50px;margin-bottom: 50px;">
						<button type="button" class="btn btn-success" onclick="addContent()" style="height: 40px;width: 140px;">修改</button>
		            </div>
                </form>
            </div>
     	</div>
     	<div class="col-md-1"></div>
     </div>
</div>
<!-- 内容 -->
</body>
</html>