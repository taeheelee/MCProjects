package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
//		return super.preHandle(request, response, handler);
		
		response.setContentType("text/html;charset=UTF-8");
		if(request.getSession().getAttribute("id") == null){
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('로그인이 필요합니다.');");
			pw.println("location.href='loginForm.do'");
			pw.println("</script>");
			pw.flush();
			pw.close();
			return false;
		}else
			return true;
	}
	
}