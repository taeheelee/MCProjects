package controller;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IMemberService;
import model.UserInfo;

@Controller
public class MainController {
	@Autowired
	private IMemberService iMemberService;
	
	@RequestMapping("loginForm.do")
	public String loginForm(){
		return "loginForm.tiles";
	}
	@RequestMapping(method=RequestMethod.POST, value="login.do")
	public String login(HttpSession session, String id, String pw){
		UserInfo userInfo = iMemberService.getMember(id);
		if(iMemberService.loginMember(id, pw)){
			
			session.setAttribute("id", userInfo.getId());
			session.setAttribute("name", userInfo.getNickname());
		}
		return "redirect:main.do";
	}
	 
	@RequestMapping("main.do")
	public String main(){
		return "main.tiles";
	}
	
	@RequestMapping("joinForm.do")
	public String joinForm(){
		return "joinForm.tiles";
	}
	 
	@RequestMapping("join.do")
	public String join(String id, String password, String nickname,
			String sex, String phoneNum, int adminCheck, String email){
		iMemberService.join(id, password, nickname, sex, phoneNum, adminCheck, email);
		return "redirect:main.do";
	}
}
	

