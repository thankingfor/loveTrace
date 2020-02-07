<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
<title>留言板</title>
<%@ include file="common/common_css.jsp"%>
<%@ include file="common/common_js.jsp"%>
<link href="${pageContext.request.contextPath}/static/css/old/liuyan.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/old/js.js"></script>
<script src="${pageContext.request.contextPath}/static/js/old/liuyan.js"></script>
<style type="text/css">
#meinv{
  float: right;
  margin-right: 64px;
  margin-top: -1189px;
  }
  #meinv img{width: 180px;
    height: 260px;
    border: 1px hidden red;
    border-radius: 40px;}
}
</style>
<script type="text/javascript">
   //图片替换    轮播图
      var j=1;
      setInterval(function(){
          if(j<32){
              j++;
          }else{
              j=1;
          }
          var path = "images/phones/"+j+".jpg";
          document.getElementById("tu").src =path;
    },3000);
</script>
</head>
<body>
<%@ include file="common/common_header.jsp"%>

<div class="rong">
<div id="tuuu">
<form action="#" method="post">
             <h1 id="liuxin" style="width: 500px;font-size: 24px;font-weight:bold;color:orange;
text-shadow:0 0 1px currentColor,-1px -1px 1px #030,0 -1px 1px #030,1px -1px 1px #030,1px 0 1px #030,1px 1px 1px #030,0 1px 1px #030,-1px 1px 1px #030,-1px 0 1px #030">Record What You Think</h1>
             <textarea id="dak" type="text" size="12" maxlength="60" name="centos" style=" font-size: 21px;color:#369;font-weight:bold;text-shadow:0 0 1px currentColor,1px 1px 1px #000,2px 2px 3px #000; height: 60px;width: 400px;"></textarea><br>
             <h2 id="yongming" style="width: 500px;font-size: 24px;font-weight:bold;color:orange;
text-shadow:0 0 1px currentColor,-1px -1px 1px #030,0 -1px 1px #030,1px -1px 1px #030,1px 0 1px #030,1px 1px 1px #030,0 1px 1px #030,-1px 1px 1px #030,-1px 0 1px #030">Sign：&nbsp;&nbsp;<input id="fuu" style="height: 24px;width: 60px;" type="text" name="name">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input id="fu" type="submit" name="liuyan" value="提交"></h2><br>
        </form>
    </div>
    
    <div id="hua">
    	我爱你
    </div>
</body>