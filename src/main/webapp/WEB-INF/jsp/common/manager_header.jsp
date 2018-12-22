<!-- 此标签解决乱码问题 -->
<%@page pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${pageContext.request.contextPath}/index" class="navbar-brand">言 静</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/content/list"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;内容管理</a></li>
                <li><a href="${pageContext.request.contextPath}/story/list"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;相册管理</a></li>
                <li><a href="${pageContext.request.contextPath}/photo/list"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;精彩瞬间</a></li>
                <li><a href="tag"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;标签管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        	We World
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dLabel">
				      <li><a href="${pageContext.request.contextPath}/index"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;&nbsp;首页</a></li>
				      <li><a href="${pageContext.request.contextPath}/suiyan"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;碎言碎语</a></li>
				      <li><a href="${pageContext.request.contextPath}/content/manman"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;慢生活</a></li>
				      <li><a href="${pageContext.request.contextPath}/story/xiangce"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;回忆相册</a></li>
				      <li><a href="${pageContext.request.contextPath}/photo/yongyong"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;精彩瞬间</a></li>
				      <%-- <li><a href="${pageContext.request.contextPath}/article"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;文章记忆</a></li> --%>
				      <li><a href="${pageContext.request.contextPath}/biaobai"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;相爱相守</a></li>
				   	</ul>
                    <!-- <ul class="dropdown-menu" aria-labelledby="dLabel">
                        <li><a href="index"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;&nbsp;前台首页</a></li>
                        <li><a href="index"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;个人主页</a></li>
                        <li><a href="index"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;个人设置</a></li>
                        <li><a href="index"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;账户中心</a></li>
                        <li><a href="index"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的收藏</a></li>
                        <li><a href="test"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;测试页面</a></li>
                    </ul> -->
                </li>
                <li><a href="#bbs"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a></li>
            </ul>
            <!-- <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        	数据维护
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dLabel">
                        <li><a href="item_cat"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;商品菜单</a></li>
                        <li><a href="item_list"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;商品数据</a></li>
                        <li><a href="content_cat"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;内容菜单</a></li>
                        <li><a href="content_list"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;内容数据</a></li>
                    </ul>
                </li>
            </ul> -->
        </div>
    </div>
</nav>
