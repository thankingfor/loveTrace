/**
 * 验证是否是一个，或者多个图片
 * 通过都好分割 然后在判断点后门的图片格式
 * @param str 新添加的
 * @returns 字符串
 */
function strIsPic(str){
	if(str == null || str ==""){
		return false;
	}
	var imgURLs = str.split(",");
	for(var i = 0; i < imgURLs.length;i++){
		if(imgURLs[i].lastIndexOf(".") == -1 ){
			return false;
		}
		var last = imgURLs[i].substring(imgURLs[i].lastIndexOf(".")+1);
		if(last != "jpg" && last != "png" && last !="gif"){
			return false;
		}
	}
	return true;
}
/**
 * 判断字符串是否为空
 * @param str 字符串
 * @returns 字符串
 */
function strIsEmpty(str){
	if(str == null || str ==""){
		return true;
	}
	return false;
}

/**
 * 用a b 返回 a,b
 * @param a 新添加的
 * @param b 源字符串
 * @returns 字符串
 */
function getStrByDouHao(a,b){
	if(b == null || b ==""){
		return a;
	}
	return b+","+a;
}

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