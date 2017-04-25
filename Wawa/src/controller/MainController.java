package controller;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import interface_service.IMemberService;
import model.UserInfo;

@Controller
public class MainController {
	@Autowired
	private IMemberService iMemberService;
	
	@RequestMapping("loginForm.do")
	public String loginForm(){
		return "login.tiles";
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
	
	@RequestMapping("logout.do")
	public String login(HttpSession session){
		session.removeAttribute("id");
		session.removeAttribute("name");
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
	 
	@RequestMapping(method=RequestMethod.POST, value="join.do")
	public String join(String id, String password, String nickname,
			String sex, String phoneNum, @RequestParam(defaultValue="0")int adminCheck, String email){
		System.out.println(id + "컨트롤러에서 받아오는지");
		int result = iMemberService.join(id, password, nickname, sex, phoneNum, adminCheck, email);
//		return"";2
		if(result > 0)
			return "redirect:main.do";			
		else
			return "redirect:joinForm.do";
	}
	
	@RequestMapping("idCheck.do")
	public 
	@ResponseBody HashMap<String, Object> idCheck(HttpServletResponse resp, String id){
//		System.out.println("idCheck.do로 들어옴");
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", iMemberService.checkId(id));
		return response;
	}
	
	@RequestMapping("nicknameCheck.do")
	public 
	@ResponseBody HashMap<String, Object> nicknameCheck(HttpServletResponse resp, String nickname){
		System.out.println(iMemberService.nicknameCheck(nickname));
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", iMemberService.nicknameCheck(nickname));
		return response;
	}
	

	@RequestMapping("userinfoForm.do")
	public String userinfoForm(HttpSession session, String id){
		UserInfo userInfo = iMemberService.getMember(id);
		session.setAttribute("id", userInfo.getId());
		session.setAttribute("name", userInfo.getNickname());
		session.setAttribute("sex", userInfo.getSex());
		session.setAttribute("pass", userInfo.getPassword());
		session.setAttribute("phone", userInfo.getPhoneNum());
		session.setAttribute("email", userInfo.getEmail());
		return "userinfoForm.tiles";

	}
}
	

