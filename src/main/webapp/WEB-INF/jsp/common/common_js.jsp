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
<!-- 时间选择插件 -->
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrap-datetimepicker.min.js" ></script>
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrap-datetimepicker.zh-CN.js" ></script>
<!-- 表单验证插件 -->
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrapValidator.min.js" ></script>
<script src="${pageContext.request.contextPath}/static/js/plug/bootstrapValidator_zh_CN.js" ></script>
<!-- 自己的utils -->
<script src="${pageContext.request.contextPath}/static/js/plug/bzsy-utils.js" ></script>
<script type="text/javascript">
	/* 一下为全局变量 */
	//富文本编辑器
	var E = window.wangEditor;
	var editor = new E('#editor');
	var conPath = "${pageContext.request.contextPath}";
	var page404 ="https://i.ibb.co/Q68Vv52/404.png";
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
    		/* var form = new FormData();
    		for (var i = 0; i < files.length; i++) {
    			form.append("uploadFile",files[i]);	
    		}
    		var imgUrls = ajaxUpload(form);
    	    // 上传代码返回结果之后，将图片插入到编辑器中
    		for (var i = 0; i < imgUrls.length; i++) {
    			insert(imgUrls[i]);
    		} */
    		var form = new FormData();
    		for (var i = 0; i < files.length; i++) {
    			form.append("smfile",files[i]);	
    			var imgUrls = ajaxUpload(form);
    			insert(imgUrls);
    		}
    	}
    	editor.customConfig.menus = [
    	    'head',  // 标题
    	    /* 'bold',  // 粗体 */
    	    'fontSize',  // 字号
    	    'fontName',  // 字体
    	    /* 'italic',  // 斜体
    	    'underline',  // 下划线
    	    'strikeThrough',  // 删除线 */
    	    'foreColor',  // 文字颜色
    	    /* 'backColor',  // 背景颜色 */
    	    'link',  // 插入链接
    	  /*   'list',  // 列表
    	    'justify',  // 对齐方式 */
    	   /*  'quote',  // 引用
    	    'emoticon',  // 表情 */
    	    'image',  // 插入图片
    	  /*   'table',  // 表格
    	    'video',  // 插入视频
    	    'code',  // 插入代码 */
    	    'undo',  // 撤销
    	    'redo'  // 重复
        ]
        editor.create();
    }
    /**
    *ajax上传
    */
    function ajaxUpload(form){
    	var imgUrls;
    	/* $.ajax({
	        type:"post",
	        dataType:"json",
	        url : conPath+"/upload",
	        async:false,//异步  true 同步
	        cache: false,//缓存 false的话会在url后面加一个时间缀，让它跑到服务器获取结果。
	        contentType: false,//上传的时候必须要 
            processData: false,
	        data:form,
	        success:function(result){  
	        	imgUrls = result.urls;
	        },error:function(){
	        	
	        }
	    }) */
	    $.ajax({
	        type:"post",
	        dataType:"json",
	        url : "https://sm.ms/api/upload",
	        async:false,//异步  true 同步
	        cache: false,//缓存 false的话会在url后面加一个时间缀，让它跑到服务器获取结果。
	        contentType: false,//上传的时候必须要 
            processData: false,
	        data:form,
	        success:function(result){  
	        	imgUrls = result.data.url;
	        },error:function(){
	        	
	        }
	    })
	    return imgUrls;
    }
    
    /**
    *	初始化fileinput控件（第一次初始化）
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
    
    /**
    * 	得到一个图片 
    *	null "" page404
    *	一个就返回过去
    *	多个就返回第一个
    */
    function getOneImage(path){
    	if(path == "" ||path == null){
    		return page404;
    	} else {
    		var start = path.indexOf(",",0);
    		if(start != -1){
    			return path.substring(0,start);
    		}
    		return path;
    	}
    }
    
    /**
    *	null "" page404
    *	返回数组
    */
    function getImages(path){
    	if(path == "" ||path == null){
    		return page404.split(",");
    	} else {
    		return path.split(",");
    	}
    }
</script>