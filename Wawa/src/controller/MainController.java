package controller;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IJoinService;

@Controller
public class MainController {
	@Autowired
	private IJoinService joinService;
	
	@RequestMapping("main.do")
	public void main(){}
	
	@RequestMapping("joinForm.do")
	public void joinForm(){}
	
	@RequestMapping("join.do")
	public String join(String id, String password, String nickname,
			String sex, String phoneNum, int adminCheck, String email){
		joinService.join(id, password, nickname, sex, phoneNum, adminCheck, email);
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
	

