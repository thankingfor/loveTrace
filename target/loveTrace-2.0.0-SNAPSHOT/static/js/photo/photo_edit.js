$(function () {
	initWangEditor();
	$(".form_datetime").datetimepicker({
		minView: "month",//选择日期后，不会再跳转去选择时分秒
		startView: 'month',  //起始选择范围
	    maxViewMode:'month', //最大选择范围
	    minViewMode:'days', //最小选择范围
	    todayHighlight : true,// 当前时间高亮显示
	    autoclose : 'true',// 选择时间后弹框自动消失
	    format : 'yyyy-mm-dd',// 时间格式
	    language : 'zh-CN',// 汉化
	    todayBtn:"linked",//显示今天 按钮
    });
	$('.form_datetime').val(datetime);
})

/**
 * 提交表单
 * @returns
 */
function addContent() {
	$('#addFormContent').val(editor.txt.html());
	/*console.log($('#addFormContent').val());
	console.log($('.form_datetime').val());
	console.log($('#addFormTitle').val());*/
	var param = "";
	if($('#addFormTitle').val()!=null && $('#addFormTitle').val()!=""){
		param = getPathParam("name",$('#addFormTitle').val(),param);
	}
	if($('.form_datetime').val()!=null && $('.form_datetime').val()!=""){
		param = getPathParam("datetime",$('.form_datetime').val(),param);
	}
	//<p><br></p>  这个是富文本的默认编辑
	if($('#addFormContent').val()!="<p><br></p>"){
		param = getPathParam("story",$('#addFormContent').val(),param);
	}
	
	var arr = window.location.href.split("/");
	var ids = arr[arr.length-1];
	param = getPathParam("ids",ids,param);
	if(param.indexOf("&") == -1){
		toastr.warning('请填写需要修改的内容！'); 
		return ;
	}
	//console.log(param)
	$.ajax({
        type:"post",
        dataType:"json",
        url:conPath+"/photo/edit",
        async:false,//异步  true 同步
        data:param,
        success:function(result){  
        	window.location.href=conPath+"/photo/list";
        	toastr.success("添加成功"); 
        },
        error:function(XMLHttpRequest,textStatus,errorThrown){
        	toastr.success("修改失败"); 
        }
    })
}