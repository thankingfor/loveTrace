<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
<title>慢生活</title>
<%@ include file="common/common_css.jsp"%>
<%@ include file="common/common_js.jsp"%>
<link href="${pageContext.request.contextPath}/static/css/old/xiangce.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/old/js.js"></script>
<script src="${pageContext.request.contextPath}/static/js/old/manman.js"></script>
</head>
<body>

<%@ include file="common/common_header.jsp"%>

<!-- 时间轴 -->
<div class="rong">
  <div class="blogs" style="background:#548B54;">
    <ul class="bloglist">
    <c:forEach var="story" items="${pageInfo.list }">
    <li>
        <div class="arrow_box">
          <div class="ti"></div>
          <div class="ci"></div>
          <h2 class="title"><a href="#" target="_blank">${story.name }</a></h2>
          <ul class="textinfo">
            <a href="${pageContext.request.contextPath}/story/${story.id }">
	            <c:if test="${not empty story.onePage}">
	            	<img src="${story.onePage}">
	            </c:if>
	            <p>${story.fontContent }</p>
            </a>
          </ul>
            <span style="color: red; float: right;margin-top: -20px;padding-right: 20px;">${story.datetime }</span>
        </div>
      </li>
    </c:forEach>
    </ul>
	<nav class="pull-right">
	    <ul class="pagination">
	        <li><a onclick="turnToUp(4,${pageInfo.pageNum },'/story/xiangce')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
	      	<c:forEach items="${pageInfo.navigatepageNums}" var="page" varStatus="varStatus">
				<li><a onclick="turnTo(4,${page },'/story/xiangce')" class="disabled">${page }</a></li>
			</c:forEach>
	        <li><a onclick="turnToDown(4,${pageInfo.pageNum },${pageInfo.pages },'/story/xiangce')"><span aria-hidden="true">&raquo;</span></a></li>
	        
	    </ul>
	</nav>
  </div>
</div>

<%@ include file="common/common_footer.jsp"%>
</body>
</html>
