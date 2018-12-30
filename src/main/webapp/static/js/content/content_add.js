$(function () {
	initWangEditor();
	initFileInput("filePicture",conPath+"/upload");
	$('#addForm').bootstrapValidator();
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
	$('.form_datetime').datetimepicker('setDate', new Date());
})

function selectPicAddr(){
	//1.验证是否为空
	if(strIsEmpty($('#picAddr').val())){
		toastr.warning('数据不能为空！！！'); 
		return ;
	}
	//2.0 把 用中文，的退回来
	if($('#picAddr').val().indexOf("，") != -1 ){
		toastr.warning('请输入英文逗号分隔符！！！'); 
		return ;
	}
	//2.验证是否是一个，或者多个图片
	if(!strIsPic($('#picAddr').val())){
		toastr.warning('图片的格式不对！！！'); 
		return ;
	}
	var imgURLs = $('#picAddr').val().split(",");
	//4.添加到表单的input标签中
	for(var i = 0; i < imgURLs.length;i++){
		if($('#addFormPic').val() == ""){
			$('#addFormPic').val(imgURLs[i]);
			//3.添加img图片回显
			$('#addFormPicName').append("<img src='"+imgURLs[i]+"' style='height: 50px;width: 70px;'>");
		}else{
			//判断是否地址重复，重复了就不添加
			if($('#addFormPic').val().indexOf(imgURLs[i]) == -1 ){
				//用,号区分
				$('#addFormPic').val($('#addFormPic').val()+","+imgURLs[i]);
				//3.添加img图片回显
				$('#addFormPicName').append("<img src='"+imgURLs[i]+"' style='height: 50px;width: 70px;'>");
			}
		}
	}
	//5.清空model中的input数据
	$('#picAddr').val("");
}


/**
 * 表单验证
 */
function addFormValidator(){
	$('#addForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            title: {
                message: '不能为空',
                validators: {
                    notEmpty: {
                        message: '标题不能为空'
                    },
                    stringLength: {     //输入　长度限制　　校验
                        min: 2,
                        message: '最少两个字'
                    },
                }
            },
        }
    });
}

/**
 * 提交表单
 * @returns
 */
function addContent() {
	$('#addForm').data('bootstrapValidator').validate();//启用验证
	var flag = $('#addForm').data('bootstrapValidator').isValid()//验证是否通过true/false
	if(!flag){
		return ;
	}
	//获取 <div id="editor"></div> 
	//给<input type="hidden" id="addFormSellPoint" name="sellPoint">赋值
	$('#addFormContent').val(editor.txt.html());
	$.ajax({
        type:"post",
        dataType:"json",
        url:conPath+"/content/insert",
        async:false,//异步  true 同步
        data:$('#addForm').serialize(),
        success:function(result){  
        	window.location.href=conPath+"/content/list";
        	toastr.success("添加成功"); 
        },error:function(result){
        	toastr.warning('添加异常！'); 
        }
    })
}

/**
 * 保存图片，并给表单赋值
 * @returns
 */
function selectPic(){
	$('#filePicture').fileinput('upload'); //触发插件开始上传。
	//异步上传返回结果处理 多个图片每次独立回调
	$("#filePicture").on("fileuploaded", function (event, data, previewId, index) {
		//alert(JSON.stringify(event));alert(JSON.stringify(data));alert(JSON.stringify(previewId));alert(JSON.stringify(index));
		var imgUrls = data.response.urls;
		//解决多次回调问题
		var paths = $('#addFormPic').val().split(",");
		if(paths[paths.length-1] == imgUrls[0]){
			return ;
		}
		$('#addFormPicName').append("<img src='"+imgUrls+"' style='height: 50px;width: 70px;'>");
		//给<input type="hidden" id="addFormImage" name="image" class="form-control">赋值
		if($('#addFormPic').val() == ""){
			$('#addFormPic').val(imgUrls);
		}else{
			//用,号区分
			$('#addFormPic').val($('#addFormPic').val()+","+imgUrls);
		}
	 });
	 $("#selectPicModal").modal("hide");
}