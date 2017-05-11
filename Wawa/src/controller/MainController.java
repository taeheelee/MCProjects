package controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import interface_service.IBoardService;
import interface_service.IMemberService;
import interface_service.IPetinfoService;
import model.UserInfo;

@Controller
public class MainController {
	@Autowired
	private IMemberService iMemberService;
	@Autowired
	private IPetinfoService IPetinfoService;
	@Autowired
	private IBoardService iBoardService;
	
	@RequestMapping("loginForm.do")
	public String loginForm(){
		return "login.tiles";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="login.do")
	public String login(HttpSession session, String id, String pw){
		UserInfo userInfo = iMemberService.getMember(id);
		List<HashMap<String, Object>> petList = IPetinfoService.selectPetList(id);
		
		if(iMemberService.loginMember(id, pw)){
			HashMap<String, Object> params = new HashMap<>(); 					
					
			for(int i = 0; i < petList.size(); i ++){
				params.put("name" + i, petList.get(i).get("name"));
				params.put("sex" + i, petList.get(i).get("sex"));
				params.put("birth" + i, petList.get(i).get("birthday"));
			}
			session.setAttribute("id", userInfo.getId());
			session.setAttribute("name", userInfo.getNickname());
			session.setAttribute("petName", params.get("name0"));
			session.setAttribute("petSex", params.get("sex0"));	
			session.setAttribute("petBirth", params.get("birth0"));	

		}
		return "redirect:main.do";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="naverLogin.do")
	public String naverLogin(HttpSession session, String id, String nickname, String sex, String email){
		String password = "123456";
		String phone = "010-0000-0000";
		int adminCheck = 0;
		if(iMemberService.checkId(id)){
			int result = iMemberService.join(id, password, nickname, sex, phone, adminCheck, email);
		}
		
		UserInfo userInfo = iMemberService.getMember(id);
		List<HashMap<String, Object>> petList = IPetinfoService.selectPetList(id);
		HashMap<String, Object> params = new HashMap<>(); 					
		
		for(int i = 0; i < petList.size(); i ++){
			params.put("name" + i, petList.get(i).get("name"));
			params.put("sex" + i, petList.get(i).get("sex"));
			params.put("birth" + i, petList.get(i).get("birthday"));
		}
		session.setAttribute("id", userInfo.getId());
		session.setAttribute("name", userInfo.getNickname());
		session.setAttribute("petName", params.get("name0"));
		session.setAttribute("petSex", params.get("sex0"));	
		session.setAttribute("petBirth", params.get("birth0"));	
		return "redirect:main.do";
	}
	
	@RequestMapping("logout.do")
	public String login(HttpSession session){
		session.invalidate();
		return "redirect:main.do";
	}
	 
	@RequestMapping("main.do")
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> nlist = new HashMap<>();
		nlist.put("firstBoard",iBoardService.getBoardList(1, 6)); //freeboard
		nlist.put("secondBoard",iBoardService.getBoardList(1, 2)); //reviewBoard
		nlist.put("thirdBoard",iBoardService.getBoardList(1, 4)); //lostBoard
		
		mav.addAllObjects(nlist);
		mav.setViewName("main.tiles");
		
		return mav;
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
	@ResponseBody HashMap<String, Object> nicknameCheck(HttpServletResponse resp, String nickname, String id){
		HashMap<String, Object> response = new HashMap<>();
		System.out.println(id);
		iMemberService.getMember(id);
		response.put("result", iMemberService.nicknameCheck(nickname));
		return response;
	}
	

	@RequestMapping(method=RequestMethod.POST, value="userinfoForm.do")
	public ModelAndView userinfoForm(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = session.getAttribute("id").toString();
		UserInfo userInfo = iMemberService.getMember(id);
		HashMap<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("name", userInfo.getNickname());
		params.put("sex", userInfo.getSex());
		params.put("password", userInfo.getPassword());
		params.put("phone", userInfo.getPhone());
		params.put("email", userInfo.getEmail());
		mav.addAllObjects(params);
		mav.setViewName("userinfoForm.tiles");
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="userUpdate.do")
	public ModelAndView userUpdate(String id, String password, String nickname,
			String sex, String phone, String email, HttpSession session){
		UserInfo userInfo = new UserInfo();
		userInfo.setAdminCheck(0);
		userInfo.setEmail(email);
		userInfo.setId(session.getAttribute("id").toString());
		userInfo.setNickname(nickname);
		userInfo.setPhone(phone);
		userInfo.setSex(sex);
		if(password.equals("")){
			UserInfo tmp = iMemberService.getMember(id);
			userInfo.setPassword(tmp.getPassword());
		}else{
			userInfo.setPassword(password);
		}
		session.setAttribute("name", userInfo.getNickname());
		iMemberService.modifyInfo(userInfo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.tiles");
		return mav;
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
	

