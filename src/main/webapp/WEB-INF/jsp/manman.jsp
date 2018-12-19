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
<link href="${pageContext.request.contextPath}/static/css/old/manman.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/old/js.js"></script>
<script src="${pageContext.request.contextPath}/static/js/old/manman.js"></script>
</head>
<body>
${pageInfo }
<%@ include file="common/common_header.jsp"%>


<!-- 时间轴 -->
<div class="rong">
  <div class="blogs" style="background:#548B54;">
    <ul class="bloglist">
    <c:forEach var="content" items="${pageInfo.list }">
    <li>
        <div class="arrow_box">
          <div class="ti"></div>
          <div class="ci"></div>
          <h2 class="title"><a href="#" target="_blank">${content.title }</a></h2>
          <ul class="textinfo">
            <a href="${pageContext.request.contextPath}/content/${content.id }">
            <%-- <c:if test="${content.onePage}">
            	<img src="${content.onePage}">
            </c:if> --%>
            <c:if test="${not empty content.onePage}">
            	<img src="${content.onePage}">
            </c:if>
            <p>${content.fontContent }</p></a>
          </ul>
            <span style="color: red; float: right;margin-top: -20px;padding-right: 20px;">${content.datetime }</span>
        </div>
      </li>
    </c:forEach>
    </ul>
    <nav class="pull-right">
    <ul class="pagination">
        <li><a onclick="turnToUp(${pageInfo.pageNum },'/content/manman')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
      	<c:forEach items="${pageInfo.navigatepageNums}" var="page" varStatus="varStatus">
			<li><a onclick="turnTo(4,${page },'/content/manman')" class="disabled">${page }</a></li>
		</c:forEach>
        <li><a onclick="turnToDown(${pageInfo.pageNum },${pageInfo.pages },'/content/manman')"><span aria-hidden="true">&raquo;</span></a></li>
        
    </ul>
</nav>
  </div>
</div>

<%@ include file="common/common_footer.jsp"%>
</body>
</html>
