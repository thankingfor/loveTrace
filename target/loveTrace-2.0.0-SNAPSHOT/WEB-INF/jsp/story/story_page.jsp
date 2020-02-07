<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>数据维护-商品详情</title>
<%@ include file="../common/common_css.jsp"%>
<%@ include file="../common/common_js.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/story/story_page.js"></script>
<style type="text/css">
#StoryName{
	font-size: 40px;
	text-align:center;
	color : red;
}
.image_One {
	width : 100%;
	/* overflow:hidden; */
}
.image_One img{
	height : 160px;
	width : 120px;
	float: left;
	padding: 5px;
}
#myarticle{
	width : 100%;
	background-color : #cccccc; 
	overflow:hidden;
}
#myarticle img{
	width:100%;
}
</style>
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
        		<div id="StoryName">
        			${story.name }
        		</div>
        		<div id="images" style="width:100%;">
        			<label>照片</label>
        			<c:forEach items="${story.list }" var="img">
        				<div class="image_One">
        					<img src="${img.path }">
        				</div>
        			</c:forEach>
        		</div>
        		<div id="myarticle">
        			${story.article }
        		</div>
        		
        		<span style="color:red;">
        			<c:if test="${story.state == 1 }">
        				<h1>已被禁用</h1>
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