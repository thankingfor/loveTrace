package aijingjing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PathController {
	
	/*@RequestMapping("/{path}")
	public String show(@PathVariable String path) {
		return path;
	}*/
	@RequestMapping(value= {"/","/index"})
	public String index() {
		return "index";
	}
	/*@RequestMapping("/article")
	public String article() {
		return "article";
	}*/
	@RequestMapping("/biaobai")
	public String biaobai() {
		return "biaobai";
	}
	@RequestMapping("/liuyan")
	public String liuyan() {
		return "liuyan";
	}
	@RequestMapping("/suiyan")
	public String show() {
		return "suiyan";
	}
	@RequestMapping("/music")
	public String music() {
		return "music";
	}
	/*@RequestMapping("/yongyong")
	public String yongyong() {
		return "yongyong";
	}*/
}
