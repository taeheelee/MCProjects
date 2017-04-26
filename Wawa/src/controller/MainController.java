package controller;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		session.invalidate();
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
			String sex, String phone, @RequestParam(defaultValue="0")int adminCheck, String email){
		int result = iMemberService.join(id, password, nickname, sex, phone, adminCheck, email);
		if(result > 0)
			return "redirect:main.do";			
		else
			return "redirect:joinForm.do";
	}
	
	@RequestMapping("idCheck.do")
	public 
	@ResponseBody HashMap<String, Object> idCheck(HttpServletResponse resp, String id){
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", iMemberService.checkId(id));
		return response;
	}
	
	@RequestMapping("nicknameCheck.do")
	public 
	@ResponseBody HashMap<String, Object> nicknameCheck(HttpServletResponse resp, String nickname){
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", iMemberService.nicknameCheck(nickname));
		return response;
	}
	

	@RequestMapping("userinfoForm.do")
	public ModelAndView userinfoForm(HttpSession session, String id){
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo = iMemberService.getMember(id);
		HashMap<String, Object> params = new HashMap<>();
		params.put("id", userInfo.getId());
		params.put("name", userInfo.getNickname());
		params.put("sex", userInfo.getSex());
		params.put("pass", userInfo.getPassword());
		params.put("phone", userInfo.getPhone());
		params.put("email", userInfo.getEmail());
		session.setAttribute("name", userInfo.getNickname());
		
		mav.addAllObjects(params);
		mav.setViewName("userinfoForm.tiles");
		return mav;
	}
	
	@RequestMapping("userUpdate.do")
	public String userUpdate(UserInfo info){
		String id = info.getId();
		iMemberService.modifyInfo(info);
		return "redirect:userinfoForm.do?id=" + id;
	}
	
	@RequestMapping("deleteCheck.do")
	public
	@ResponseBody HashMap<String, Object> passCheck(HttpSession session, String id, String password, String chk){
		HashMap<String, Object> response = new HashMap<>();
		UserInfo userinfo = iMemberService.getMember(id);
		String pwChk = userinfo.getPassword();
		String idChk = userinfo.getId();
		if(idChk.equals(chk) && pwChk.equals(password) ){
			iMemberService.deleteMember(id);
			session.invalidate();
			response.put("result", true );
		}
		else
			response.put("result", false);
		return response;

	}

	@RequestMapping("deleteForm.do")
	public String deleteForm(){
		
		return"userDeleteForm.popup";
	}
	@RequestMapping(method=RequestMethod.POST, value="deleteMember.do")
	public ModelAndView deleteMember(String id, String password){
		ModelAndView mav = new ModelAndView();
		iMemberService.getMember(id);
		
		return mav;
	}

}
	

