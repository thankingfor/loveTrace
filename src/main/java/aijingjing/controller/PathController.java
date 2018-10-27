package aijingjing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PathController {
	
	@RequestMapping("/{path}")
	public String show(@PathVariable String path) {
		return path;
	}
	@RequestMapping("/")
	public String show() {
		return "index";
	}
}
