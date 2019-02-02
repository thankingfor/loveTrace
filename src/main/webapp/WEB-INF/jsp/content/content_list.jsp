<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>内容管理</title>
<%@ include file="../common/common_css.jsp"%>
<%@ include file="../common/common_js.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/content/content_list.js"></script>
</head>
<body>
<!-- 导航栏 -->
<%@ include file="../common/manager_header.jsp"%>
<!-- 内容 -->
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="#" class="list-group-item active">内容信息</a>
                <a href="${pageContext.request.contextPath}/content/showAdd" role="button"  class="list-group-item">添加内容</a>
                <a class="list-group-item" onclick="showEdit()">内容修改</a>
                <input id="sel" type="text" class="form-control" value="" placeholder="搜索内容">
                <a class="list-group-item" onclick="selectList()">内容搜索</a>
                <a class="list-group-item" onclick="selectDel()">内容删除</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>内容管理</h1>
            </div>
            <div class="page-body">
            	<table id="table"></table>
            </div>
     	</div>
     </div>
</div>
<!-- 内容 -->

<!-- 模态框 -->
<!-- 模态框 -->

</body>
</html>