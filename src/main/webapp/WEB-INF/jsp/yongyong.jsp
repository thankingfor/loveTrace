<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
<title>永无止境</title>
<%@ include file="common/common_css.jsp"%>
<%@ include file="common/common_js.jsp"%>
<link href="${pageContext.request.contextPath}/static/css/old/meitu.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/old/js.js"></script>
<script src="${pageContext.request.contextPath}/static/js/old/scrollReveal.js"></script>
<style type="text/css">
/* photowall */
.photowall { width: 100%;  padding: 30px 0; overflow: hidden; border-bottom: #226039 1px solid }
.photowall img { display: block; opacity: 0.9; -webkit-transition: opacity 0.35s; transition: opacity 0.35s; }
.wall_a { width: 1000px; margin: auto; background: #fafcfa; overflow: hidden }
.wall_a li { float: left; position: relative; }
.wall_a li p a { color: #686868 }
.text_a { width: 220px; line-height: 24px; padding: 30px 20px }
.text_b { width: 164px; line-height: 24px; padding: 40px 20px }
.wall_a li figcaption { position: absolute; left: 0; top: 10px; }
.wall_a li h2 { font-size: 12px; line-height: 24px; padding: 20px; font-weight: normal; opacity: 0; -webkit-transition: opacity 0.35s, -webkit-transform 0.35s; transition: opacity 0.35s, transform 0.35s; -webkit-transform: scale(0); transform: scale(0); color: #666 }
.wall_a li:hover h2 { opacity: 1; -webkit-transform: scale(1); transform: scale(1); }
.wall_a li:hover img { opacity: 0.4; }
</style>
</head>
<body>
<%@ include file="common/common_header.jsp"%>

<div class="rong">
<div id="mee1">
<div class="dowebok" style="">
<div class="list photowall">
<c:forEach items="${pageInfo.list }" var="photo">
<ul class="wall_a">
<li>
<img src="${photo.path }">
<figcaption>
<h2>${photo.story }<span>时间:${photo.datetime }</span> </h2>
</figcaption>
</li>
</ul>
</c:forEach>
<nav class="pull-right">
	    <ul class="pagination">
	        <li><a onclick="turnToUp(20,${pageInfo.pageNum },'/photo/yongyong')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
	      	<c:forEach items="${pageInfo.navigatepageNums}" var="page" varStatus="varStatus">
				<li><a onclick="turnTo(20,${page },'/photo/yongyong')" class="disabled">${page }</a></li>
			</c:forEach>
	        <li><a onclick="turnToDown(20,${pageInfo.pageNum },${pageInfo.pages },'/photo/yongyong')"><span aria-hidden="true">&raquo;</span></a></li>
	        
	    </ul>
	</nav>
</div>
</div>
</div>
</div>
<%@ include file="common/common_footer.jsp"%>
</body>
</html>