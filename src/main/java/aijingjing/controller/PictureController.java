package aijingjing.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import aijingjing.utils.FastDFSClient;
import aijingjing.utils.JsonUtils;

/**
 * 	图片上传处理Controller
 * @author lyf
 */
@Controller
public class PictureController {

	private Map<String, Object> map = new HashMap<>();
	
	@Value("${IMAGE_SERVER_URL}")
	private String IMAGE_SERVER_URL;
	
	@RequestMapping(value="/upload", produces=MediaType.TEXT_PLAIN_VALUE+";charset=utf-8")
	@ResponseBody
	public String uploadFile(@RequestParam(value = "uploadFile", required = false) List<MultipartFile> uploadFile) {
		map.clear();
		try {
			//所有的图片url
			String[] urls = new String[uploadFile.size()];
			for (int i = 0; i < uploadFile.size(); i++) {
				String url = uploadPic(uploadFile.get(i));
				urls[i] = url;
			}
			//封装到map中返回
			//map.put("error", 0);
			map.put("urls", urls);
			return JsonUtils.objectToJson(map);
		} catch (Exception e) {
			e.printStackTrace();
			//map.put("error", 1);
			map.put("message", "图片上传失败");
			return JsonUtils.objectToJson(map);
		}
	}
	
	public String uploadPic(MultipartFile uploadFile) {
		try {
			//把图片上传的图片服务器
			FastDFSClient fastDFSClient = new FastDFSClient("classpath:conf/client.conf");
			String originalFilename = uploadFile.getOriginalFilename();
			String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
			//得到一个图片的地址和文件名
			String url = fastDFSClient.uploadFile(uploadFile.getBytes(), extName);
			//补充为完整的url
			url = IMAGE_SERVER_URL + url;
			return url;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
