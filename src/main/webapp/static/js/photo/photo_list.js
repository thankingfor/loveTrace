$(function () {
	tableshow();
})

/**
 * 显示修改弹出框
 * @returns
 */
function showEdit(){
	var rows = $("#table").bootstrapTable("getSelections");
	if(rows.length < 0){
		toastr.info("请选择至少一条数据！！！");
		return ;
	}
	var str = "";
	for(var i = 0 ;i < rows.length ; i++){
		str = getStrByDouHao(rows[i].id,str)
	}
	window.location.href=conPath+"/photo/edit/"+str;
}

/**
 * 删除
 * @returns
 */
function selectDel(){
	var rows = $("#table").bootstrapTable("getSelections");
	if(JSON.stringify(rows) == "[]"){
		toastr.info("请选择至少一条数据！！！");
		return ;
	}
	//传入id数组
	var ids = new Array();
	for (var i = 0; i < rows.length; i++) {
		ids[i] = rows[i].id;
	}
	$.ajax({
        type:"post",
        dataType:"json",
        url:conPath+"/story/del",
        async:false,
        traditional: true,
        data:{ids:ids},
        success:function(XYZResult){  
        	toastr.success("删除成功");
        	$("#table").bootstrapTable("refresh");
        },error:function(){
            toastr.warning('删除异常！'); 
        }
    })
}

/**
 * 搜索
 * @returns
 */
function selectList(){
	$("#table").bootstrapTable("refresh");
}

/**
 * 激活
 * @returns
 */
function active(id){
	$.ajax({
        url:conPath+"/photo/active/"+id,
        success:function(XYZResult){  
        	$("#table").bootstrapTable("refresh");
        }
    })
}

/**
 * 激活
 * @returns
 */
function locked(id){
	$.ajax({
        url:conPath+"/photo/locked/"+id,
        success:function(XYZResult){  
        	$("#table").bootstrapTable("refresh");
        }
    })
}

/**
 * 数据的表格
 * @returns
 */
function tableshow(){
	 $('#table').bootstrapTable({  
		 url: conPath+'/photo/list/all',  
		 method: 'get',
		 dataType: 'json',
		 contentType: "application/x-www-form-urlencoded",
		 cache: false, 
		 pagination: true, 
		 singleSelect: false,
		 clickToSelect:true,
         sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
         pageNumber: 1,                       //初始化加载第一页，默认第一页
         pageSize: 4,                       //每页的记录行数（*）
         pageList: [4, 6,8,10],        //可供选择的每页的行数（*）
         queryParams: function (params) {
        	 return {
        		 param:$("#sel").val(),
        		 page:this.pageNumber,
        		 rows:this.pageSize
        	 };
         }, 
	     columns: [ {  
                checkbox: true  
            },{
            title: 'ID',
            field: 'id',
            align: 'center',
            valign: 'middle'
          },{
            title: '名称',
            field: 'name',
            align: 'center',
            valign: 'middle',
            formatter:function(value, row, index){
            	if(value ==null){
            		return value = "";
            	}
            	return value.substring(0,10);
            }
          },{
	          title: '文章',
	          field: 'story',
	          align: 'center',
	          valign: 'middle',
	          formatter:function(value, row, index){
	        	  return getChinese(value).substring(0,20);
              }
          },{
            title: '图片',
            field: 'path',
            align: 'center',
            valign: 'middle',
            formatter:function(value,row,index){
                var s = '<img style="width:70;height:30px;"  src='+value+' />';
                return s;
            }
          },{
              title: '时间',
              field: 'datetime',
              align: 'center',
              valign: 'middle'
          },{
              title: '状态',
              field: 'state',
              align: 'center',
              valign: 'middle',
              formatter:function(value,row,index){
            	  if(value == 0){
            		  return "启用";
            	  }
                  return "禁用";
              }
          },{
              title: '操作',
              align: 'center',
              valign: 'middle',
              formatter:function(value,row,index){
                  var btn = '<a href='+conPath+'/photo/'+row.id+' class="btn btn-default" >查看</a>';
                  if(row.state == 0){
                	  btn += '<a class="btn btn-default" onclick="locked('+row.id+')">禁用</a>';
            	  }else {
            		  btn += '<a class="btn btn-default" onclick="active('+row.id+')">激活</a>';
            	  }
                  return btn;
              }
          }]   
          });
	$("#table").bootstrapTable('hideColumn', 'id');
}