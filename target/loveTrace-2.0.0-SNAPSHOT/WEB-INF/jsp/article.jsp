<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
<title>慢生活</title>
<link
	href="${pageContext.request.contextPath}/static/css/old/manwen.css"
	rel="stylesheet">
<%@ include file="common/common_css.jsp"%>
<%@ include file="common/common_js.jsp"%>
<script src="${pageContext.request.contextPath}/static/js/old/js.js"></script>
<%-- <script src="${pageContext.request.contextPath}/static/js/old/manman.js"></script> --%>
<style type="text/css">
#pinglun {
	font-size: 22px;
	color: #FFBBFF;
	text-align: center;
}
</style>
</head>
<body>

	<%@ include file="common/common_header.jsp"%>

	<!-- 时间轴 -->
	<div class="rong">
		<div class="blogs">
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
			<!-- <div id="wenzi">
				<h2 style="text-align: center;">那日，此后</h2>
				<br>

			</div> -->
		</div>
		<!-- <div id="lunlun">
			<span><h2 style="text-align: center;">评论</h2>
				<br></span>
			<div id="pinglun"></div>
			<div id="liuyan"></div>
		</div> -->
	</div>
</body>
</html>