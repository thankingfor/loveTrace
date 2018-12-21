package aijingjing.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import aijingjing.domain.Photo;
import aijingjing.service.PhotoService;

@RequestMapping("/photo")
@Controller
public class PhotoController {

	@ResponseBody
	@RequestMapping("/edit")
	public String edit(Photo photo,String ids,Model model) {
		int msg = photoService.editPhotos(photo,ids);
		return ""+msg;
	}
	
	@RequestMapping("/edit/{ids}")
	public String showEdit(@PathVariable String ids,Model model) {
		List<Photo> list = photoService.getPhotoList(ids);
		model.addAttribute("photos", list);
		return "/photo/photo_edit";
	}
	
	@RequestMapping("/list")
	public String showList() {
		return "/photo/photo_list";
	}
	
	@ResponseBody
	@RequestMapping("/list/all")
	public Map<String,Object> listAll(
			@RequestParam(name="page",defaultValue="1") int page,
			@RequestParam(name="rows",defaultValue="4") int rows,
			@RequestParam(name="param",defaultValue="")String param) {
		map.clear();
		PageHelper.startPage(page, rows);
		List<Photo> list = photoService.select(param);
		PageInfo<Photo> pageInfo = new PageInfo<Photo>(list,8);
		map.put("rows", pageInfo.getList());
		map.put("total", pageInfo.getTotal());
		return map;
	}
	
	Map<String,Object> map = new HashMap<String,Object>();
	
	@Autowired
	private PhotoService photoService;
}
