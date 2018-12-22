package aijingjing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import aijingjing.utils.CookieUtils;

@Controller
public class ActiveController {

	@Value("${ACTIVE_NUMBER}")
	private String ACTIVE_NUMBER;
	
	@Value("${ACTIVE_COOKIE}")
	private String ACTIVE_COOKIE;
	
	@RequestMapping("active")
	public String active() {
		return "active/active";
	}
	
	@ResponseBody
	@RequestMapping("activePass")
	public String activePass(@RequestParam(name="passNumber",defaultValue="") String passNumber,HttpServletRequest request,HttpServletResponse response) {
		if(ACTIVE_NUMBER.equals(passNumber)) {
			new CookieUtils().setCookie(request, response, ACTIVE_COOKIE, passNumber,1*60*60);
			return "0";
		}
		return "1";
	}
}
