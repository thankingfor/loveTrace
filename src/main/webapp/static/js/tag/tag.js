$(function () {
	
})

function delTag(id){
	var id = $('#delId').val();
	if(id<=0){
		alert("删除失败");
		return ;
	}
	$.ajax({
        type:"post",
        dataType:"json",
        url:"/manager/tag/del",
        async:false,//异步  true 同步
        data:{id:id},
        success:function(result){  
        	window.location.href = "tag";
        },error:function(){
        	alert("删除失败");
        	window.location.href = "tag";
        }
    })
}

function showdelModel(id){
	var id = $('#delId').val(id);
	$('#delModal').modal("show");
}

function tagAdd(){
	var text = $('#tagValue').val();
	if(text == "" ||text ==null ){
		alert("内容不能为空");
		return ;
	}
	if(text.length > 200){
		alert("内容不高于40字!!!");
		return ;
	}
	$.ajax({
        type:"post",
        dataType:"json",
        url:"/manager/tag/insert",
        async:false,//异步  true 同步
        data:{content:text},
        success:function(result){  
        	window.location.href = "tag";
        },error:function(){
        	alert("添加失败");
        	window.location.href = "tag";
        }
    })
}