<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html> 
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>爱情树</title>
    <%@ include file="common/common_css.jsp"%>
	<%@ include file="common/common_js.jsp"%>
    <link href="${pageContext.request.contextPath}/static/js/source/default.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/source/jscex.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/source/jscex-parser.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/source/jscex-jit.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/source/jscex-builderbase.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/source/jscex-async.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/source/jscex-async-powerpack.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/source/functions.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/js/source/love.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/js/source/canvas.js" charset="utf-8"></script>
    <script>
        var lover = {};
        lover.info = {
            name: "[感动]", //点开时爱心桃旁边的字
            year: 2018,     //相遇的年份
            month: 4,      //月
            day: 28,        //日
            hour: 17,       //小时
            minute: 26,     //分钟
            second: 0,      //秒
            
            debug: false,   //是否开启调试模式（如果选是，则会弹窗提示为什么加载出错）
        }
    </script>
</head>
<body>
    <!-- 背景音乐部分 -->
    <audio id="loveBgm" src="${pageContext.request.contextPath}/static/music/bgm.mp3" loop="loop"></audio>  
    
	<div id="main">
        <div id="error">
            本页面采用HTML5编辑，目前您的浏览器无法显示，请换成(<a href="http://dl.360safe.com/netunion/20140425/360se+14478+n4a1de2568d.exe">360</a>)
            或者火狐(<a href="http://firefox.com.cn/download/">Firefox</a>)浏览器，或者其他游览器的最新版本。
        </div>
		<div id="wrap">
			<div id="text">
				<div id="code">
					<span class="say">亲爱的，我爱你，虽然你看不见我当面对你的告白</span><br>
					<span class="say"> </span><br>
					<span class="say">我知道我不会甜言蜜语，但是我会用行动证明一切</span><br>
					<span class="say"> </span><br>
					<span class="say">你说我离不开你，有些东西因为越在乎所以越失去</span><br>
					<span class="say"> </span><br>
					<span class="say">因为我太爱你了，所以我粘你</span><br>
					<span class="say"> </span><br>
					<span class="say">因为我离不开你，所以我要紧紧的拽着你</span><br>
					<span class="say"> </span><br>
					<span class="say">缘分让我们4月28日相识,短短天我就被你迷的离不开你</span><br>
					<span class="say"> </span><br>
					<span class="say">虽然我们相遇还很短暂，但是我还是要把这些心里话说</span><br>
					<span class="say"> </span><br>
					<span class="say">一不小心已经沦陷于你的深情,请让我爱你,让我照顾你</span><br>
					<span class="say"> </span><br>
					<span class="say">让每个难安眠都想到你,每场梦境都有你</span><br>
					<span class="say"> </span><br>
					<span class="say">让风儿吹去我对你的私语,让月亮寄托我对你的思念</span><br>
					<span class="say"> </span><br>
					<span class="say"> -- 来自傻傻的告白--</span>
					<span class="say"> </span><br>
					<a href="index" class="say" style="font-size: 22px;"> -- 属于我们的博客--</a>
				</div>
			</div>
			<div id="clock-box">
				<span><font color="#666666">
					<span style="font-size: 32px;">李延富</span>
					和
					<span style="font-size: 32px;">张思静</span>
					相识相爱</font></span>
				<div id="clock"></div>
			</div>
			<canvas id="canvas" width="1100" height="680"></canvas>
		</div>
	</div>
</body>
</html>