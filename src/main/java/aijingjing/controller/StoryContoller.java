package aijingjing.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import aijingjing.domain.Story;
import aijingjing.service.PhotoService;
import aijingjing.service.StoryService;
import aijingjing.utils.MyUtils;

@RequestMapping("/story")
@Controller
public class StoryContoller {
	
	@RequestMapping("/showEdit/{id}")
	public String showEdit(@PathVariable int id ,Model model) {
		Story story = storyService.selectById(id);
		model.addAttribute("story", story);
		return "/story/story_edit";
	}
	
	@ResponseBody
	@RequestMapping("/list/all")
	public Map<String,Object> listAll(
			@RequestParam(name="page",defaultValue="1") int page,
			@RequestParam(name="rows",defaultValue="4") int rows,
			@RequestParam(name="param",defaultValue="")String param) {
		map.clear();
		PageHelper.startPage(page, rows);
		List<Story> list = storyService.select(param);
		PageInfo<Story> pageInfo = new PageInfo<Story>(list,8);
		map.put("rows", pageInfo.getList());
		map.put("total", pageInfo.getTotal());
		return map;
	}
	
	@RequestMapping("/list")
	public String showList() {
		
		return "/story/story_list";
	}
	@RequestMapping("/showAdd")
	public String showAdd() {
		
		return "/story/story_add";
	}
	@ResponseBody
	@RequestMapping("/insert")
	public Map<String,Object> insert(Story story,String images) {
		map.clear();
		String[] imgs = images.split(",");
		String photos = "";
		for (String image : imgs) {
			Photo photo = new Photo();
			photo.setPath(image);
			int id = photoService.insertCallbackId(photo);
			//无法解决返回主键，只能查询出来了
			/*id = photoService.selectIdByPath(image);*/
			id = photo.getId();
			photos = new MyUtils().withDouhao(photos,String.valueOf(id));
		}
		story.setPhotos(photos);
		int msg = storyService.insert(story);
		map.put("msg", msg);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public Map<String,Object> insert(int[] ids) {
		map.clear();
		for (int i : ids) {
			storyService.delete(i);
		}
		return map;
	}
	
	@Autowired
	private PhotoService photoService;
	
	@Autowired
	private StoryService storyService;
	
	Logger log = LoggerFactory.getLogger(StoryContoller.class);
	
	Map<String,Object> map = new HashMap<String,Object>();
}
