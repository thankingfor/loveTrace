<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>内容详情</title>
<%@ include file="../common/common_css.jsp"%>
<%@ include file="../common/common_js.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/content/content_page.js"></script>
<script type="text/javascript">
	var images = "${content.img }";
</script>
</head>
<body>
<!-- 导航栏 -->
<%@ include file="../common/manager_header.jsp"%>
<!-- 内容 -->
<div class="container">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
        	<div>
        		<h1>${content.title }</h1>
        		<div id="images" style="width:100%;"></div>
        		<p style="font-size: 22px;">${content.content }</p>
        		<span style="color:red;">
        			<c:if test="${content.state == 1 }">
        				已被禁用
        			</c:if>
        		</span>
        	</div>
     	</div>
     	<div class="col-md-2">
        </div>
     </div>
</div>
<!-- 内容 -->

<!-- 模态框 -->
<!-- 模态框 -->

</body>
</html>