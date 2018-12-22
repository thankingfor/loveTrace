package aijingjing.interceptor;

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import aijingjing.utils.CookieUtils;

public class ActiveInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String path = request.getContextPath();
        String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
		Properties po = new Properties();
		InputStream ras = this.getClass().getClassLoader().getResourceAsStream("/conf/resource.properties");
		po.load(ras);
		String cookieName = po.getProperty("ACTIVE_COOKIE");
		String cookieValue = po.getProperty("ACTIVE_NUMBER");
		String cookie = (String) request.getSession().getAttribute(cookieName);
		/*String cookie = new CookieUtils().getCookieValue(request, cookieName);*/
		//System.err.println(cookieName+","+cookieValue+","+cookie);
		if(cookieValue.equals(cookie)) {
			return true;
		}
		PrintWriter out = response.getWriter();
		out.print("<script>window.top.location.href ='"+basePath+"active'</script>");
		return false;
	}	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
