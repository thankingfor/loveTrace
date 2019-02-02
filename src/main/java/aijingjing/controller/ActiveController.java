package aijingjing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("info")
	public String info(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		return "active/info";
	}
	
	@RequestMapping("info1-0")
	public String info1(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		return "active/info1-0";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		session.invalidate();
		/*new CookieUtils().deleteCookie(request, response, ACTIVE_COOKIE);*/
		return "active/active";
	}
	
	@ResponseBody
	@RequestMapping("activePass")
	public String activePass(@RequestParam(name="passNumber",defaultValue="") String passNumber,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		if(ACTIVE_NUMBER.equals(passNumber)) {
			session.setAttribute(ACTIVE_COOKIE, passNumber);
			/*new CookieUtils().setCookie(request, response, ACTIVE_COOKIE, passNumber,1*60*60);*/
			return "0";
		}
		return "1";
	}
}
