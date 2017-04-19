package controller;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
	

