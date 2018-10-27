<!-- 此标签解决乱码问题 -->
<%@page pageEncoding="UTF-8"%>
<!-- jquery -->
<script src="${pageContext.request.contextPath}/static/js/plug/jquery.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrap.min.js"></script>
<!-- tree插件 -->
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrap-treeview.js" ></script>
<!-- 消息框插件 -->
<script src="${pageContext.request.contextPath}/static/js/plug/toastr.min.js" ></script>
<!-- 富文本编辑器 -->
<script src="${pageContext.request.contextPath}/static/js/plug/wangEditor.min.js"></script>
<!-- 图样报表插件 -->
<script src="${pageContext.request.contextPath}/static/js/plug/Chart.js"></script>
<!-- 模态框 对话框插件 -->
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrap-dialog.min.js" ></script>
<!-- 图片上传插件 -->
<script src="${pageContext.request.contextPath}/static/js/plug/fileinput.min.js" ></script>
<!-- 图片上传插件 中文 -->
<script src="${pageContext.request.contextPath}/static/js/plug/fileinput_zh.js" ></script>
<!-- 表格的插件 -->
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrap-table.min.js" ></script>
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrap-table-zh-CN.min.js" ></script>
<!-- 表单验证插件 -->
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrapValidator.min.js" ></script>
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrapValidator_zh_CN.js" ></script>
<script type="text/javascript">
	/* 一下为全局变量 */
	//富文本编辑器
	var E = window.wangEditor;
	var editor = new E('#editor');
	//消息件的配置
    toastr.options = {
        closeButton: false,  
        debug: false,  
        progressBar: true,  
        positionClass: "toast-top-center",  
        onclick: null,  
        showDuration: "300",  
        hideDuration: "1000",  
        timeOut: "1000",  
        extendedTimeOut: "1000",  
        showEasing: "swing",  
        hideEasing: "linear",  
        showMethod: "fadeIn",  
        hideMethod: "fadeOut"  
   };
    /**
     * 初始化富文本编辑器
     * @returns
     */
    function initWangEditor(){
    	editor.customConfig.customUploadImg = function (files, insert) {
    	    // files 是 input 中选中的文件列表
    		//创建为表单去提交
    		var form = new FormData();
    		for (var i = 0; i < files.length; i++) {
    			form.append("uploadFile",files[i]);	
    		}
    		var imgUrls = ajaxUpload(form);
    	    // 上传代码返回结果之后，将图片插入到编辑器中
    		for (var i = 0; i < imgUrls.length; i++) {
    			insert(imgUrls[i]);
    		}
    	}
        editor.create();
    }
    /**
    *ajax上传
    */
    function ajaxUpload(form){
    	var imgUrls;
    	$.ajax({
	        type:"post",
	        dataType:"json",
	        url:"/upload",
	        async:false,//异步  true 同步
	        cache: false,//缓存 false的话会在url后面加一个时间缀，让它跑到服务器获取结果。
	        contentType: false,//上传的时候必须要
            processData: false,
	        data:form,
	        success:function(result){  
	        	imgUrls = result.urls;
	        },error:function(){
	        	
	        }
	    })
	    return imgUrls;
    }
    
    /**
    *初始化fileinput控件（第一次初始化）
     * @param ctrlName id
     * @param uploadUrl 路径
     * @returns
     */
    function initFileInput(ctrlName, uploadUrl) {    
        var control = $('#' + ctrlName); 
        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
            showUpload: false, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式             
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>", 
        });
    }
</script>