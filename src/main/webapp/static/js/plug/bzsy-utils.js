

/**
 * 为了解决表单序列话拼串
 * 例如：pass 333 
 * 返回 pass=333
 * 如果name为空就返回空
 * @param name 原完好的路径
 * @param value 原完好的路径
 * @returns 字符串
 */
function getPathParam(name,value){
	if(name == null || name ==""){
		return name+"="+value;
	}
	return "";
}

/**
 * 为了解决表单序列话拼串
 * 例如：pass 333  id=1&name=3
 * 返回 pass=333&id=1&name=3
 * @param name 原完好的路径
 * @param value 原完好的路径
 * @param str 原完好的路径
 * @returns 字符串
 */
function getPathParam(name,value,str){
	if(str == null || str ==""){
		return name+"="+value;
	}
	return name+"="+value+"&"+str
}

/**
 *	保留中文
 * @param str 字符串
 * @returns 字符串
 */
function getChinese(str){
	if(str == null || str ==""){
		return "";
	}
	var reg = /[\u4e00-\u9fa5]/g;
  	if(str.match(reg) != null && str.match(reg)!=null){
  		str = str.match(reg).join("");
  		return str;
  	}else {
  		return "";
  	}
}

/**
 *	去除中文
 * @param str 字符串
 * @returns 字符串
 */
function getNoChinese(str){
	if(str == null || str ==""){
		return "";
	}
	var reg = /[\u4e00-\u9fa5]/g;
  	return str.replace(reg, "");
}

/**
 * 	上一页
 * @param rows 每页多少条记录
 * @param page 第几页
 * @param path 地址
 */
function turnToUp(rows,page,path){
	if(page >1){
		turnTo(rows,page - 1,path);
	}else{
		turnTo(rows,1,path);
	}
}

/**
 * 	下一页
 * @param rows 每页多少条记录
 * @param page 第几页
 * @param totalPage 总共有几页
 * @param path 地址
 */
function turnToDown(rows,page,totalPage,path){
	if(page < totalPage){
		turnTo(rows,page + 1,path);
	}else{
		turnTo(rows,totalPage,path);
	}
}
/**
 * 	跳转某一页数
 * 
 * @param rows 每页多少条记录
 * @param page 第几页
 * @param path 地址
 */
function turnTo(rows,page,path) {
	window.location.href = conPath+path+"?page="+page+"&rows="+rows;
}