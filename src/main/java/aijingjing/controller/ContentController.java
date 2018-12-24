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

import aijingjing.domain.Content;
import aijingjing.service.ContentService;

@RequestMapping("/content")
@Controller
public class ContentController {

	@Autowired
	private ContentService contentService;
	
	Logger log = LoggerFactory.getLogger(ContentController.class);
	
	Map<String,Object> map = new HashMap<String,Object>();
	
	@RequestMapping("/{id}")
	public String showPage(@PathVariable int id,Model model) {
		Content content = contentService.selectById(id);
		model.addAttribute("content", content);
		return "/content/content_page";
	}
	
	@RequestMapping("/list")
	public String show() {
		return "/content/content_list";
	}
	
	@ResponseBody
	@RequestMapping("/edit")
	public Map<String,Object> edit(Content content) {
		map.clear();
		int msg = contentService.edit(content);
		map.put("msg", msg);
		return map;
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable int id,Model model) {
		Content content = contentService.selectById(id);
		model.addAttribute("content", content);
		return "/content/content_edit";
	}
	
	@RequestMapping("/manman")
	public String manman(@RequestParam(name="page",defaultValue="1") int page,
			@RequestParam(name="rows",defaultValue="4") int rows,
			@RequestParam(name="param",defaultValue="")String param,Model model) {
		PageHelper.startPage(page, rows);
		List<Content> list = contentService.select(param);
		PageInfo<Content> pageInfo = new PageInfo<Content>(list,8);
		model.addAttribute("pageInfo", pageInfo);
		return "manman";
	}
	
	@ResponseBody
	@RequestMapping("/list/all")
	public Map<String,Object> listAll(
			@RequestParam(name="page",defaultValue="1") int page,
			@RequestParam(name="rows",defaultValue="4") int rows,
			@RequestParam(name="param",defaultValue="")String param) {
		map.clear();
		PageHelper.startPage(page, rows);
		List<Content> list = contentService.select(param);
		PageInfo<Content> pageInfo = new PageInfo<Content>(list,8);
		map.put("rows", pageInfo.getList());
		map.put("total", pageInfo.getTotal());
		return map;
	}
	
	@RequestMapping("/showAdd")
	public String showAdd() {
		return "/content/content_add";
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public Map<String,Object> insert(Content content) {
		map.clear();
		int msg = contentService.insert(content);
		if(msg == 1) {
			map.put("msg","添加成功！");
		}else {
			map.put("msg","添加失败！");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public Map<String,Object> insert(int[] ids) {
		map.clear();
		for (int i : ids) {
			contentService.delete(i);
		}
		return map;
	}
}
