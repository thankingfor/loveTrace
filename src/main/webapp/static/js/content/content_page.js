$(function () {
	var imgs = getImages(images);
	for(i = 0 ;i <  imgs.length; i ++){
		$('#images').append("<img style='width:400;height:300px;' src="+imgs[i]+" />");
	}
})
