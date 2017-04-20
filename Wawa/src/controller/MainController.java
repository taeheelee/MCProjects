package controller;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

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
	
	@RequestMapping("idCheck.do")
	public 
	@ResponseBody HashMap<String, Object> idCheck(HttpServletResponse resp, String id){
		System.out.println("idCheck.do로 들어옴");
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", joinService.idCheck(id));
		return response;
	}
	
	@RequestMapping("nicknameCheck.do")
	public 
	@ResponseBody HashMap<String, Object> nicknameCheck(HttpServletResponse resp, String nickname){
		System.out.println("nicknameCheck.do로 들어옴");
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", joinService.nicknameCheck(nickname));
		return response;
	}
}
	

