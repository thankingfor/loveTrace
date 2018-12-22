<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>后台登录</title>
<%@ include file="../common/common_css.jsp"%>
<%@ include file="../common/common_js.jsp"%>
<script type="text/javascript">
function active(){
	if(strIsEmpty($("#activeNumber").val())){
		toastr.warning("不能为空");
		return ;
	}
	$.ajax({
		type : "post",
		url : conPath+"/activePass",
		async:false,
		data:{passNumber:$("#activeNumber").val()},
		success:function (value){
			if(value == "1"){
				toastr.error("密码错误");
			}
			if(value == "0"){
				window.location.href=conPath+"/index";
			}
		},
		error:function (value){
			toastr.error("系统出错");
		}
	});
}
function index(){
	window.location.href=conPath+"/index";
}
</script>
</head>
<body>
<!-- 导航栏 -->
<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
	        <div class="page-header" style="text-align:center;">
                <h1>激活页面</h1>激活后台管理权限
            </div>
	        <div class="page-body">
	        	
	        	<form id="activeForm" method="post" action="${pageContext.request.contextPath}/active">
                    <div class="form-group">
                        <label for="activeNumber">激活码</label>
                        <input type="text" id="activeNumber" name="passNumber" value="" class="form-control" placeholder="请输入激活码" required data-bv-notempty-message="不能为空">
                    </div>
					<div class="page-footer" style="text-align:center;margin-top: 50px;margin-bottom: 50px;">
						<button type="button" class="btn btn-success" onclick="active()" style="height: 40px;width: 140px;">激活</button>
						<button type="button" class="btn btn-success" onclick="index()" style="height: 40px;width: 140px;">返回首页</button>
		            </div>
                </form>
	        </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
</html>