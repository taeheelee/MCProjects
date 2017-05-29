package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
import interface_service.IMedicalService;
import interface_service.IMemberService;
import interface_service.IPetinfoService;
import model.UserInfo;
import service.MemberService;

@Controller
public class MainController {
	@Autowired
	private IMemberService iMemberService;
	@Autowired
	private IPetinfoService IPetinfoService;
	@Autowired
	private IBoardService iBoardService;
	@Autowired
	private IMedicalService iMedicalService;
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "login.tiles";
	}

	@RequestMapping("findIdForm.do")
	public ModelAndView findIdForm(@RequestParam(defaultValue="") String msg){
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("findIdForm.tiles");
		return mav;
	}
	
	@RequestMapping("findPassForm.do")
	public ModelAndView findPassForm(@RequestParam(defaultValue="") String msg){
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("findPassForm.tiles");
		return mav;
	}
	
	@RequestMapping("findId.do")
	public String findId() {
		return "redirect:loginForm.do";
	}
	
	@RequestMapping("findPass.do")
	public String findPass(String inputPass, String id) {
		iMemberService.updatePass(id, inputPass);
		return "redirect:loginForm.do";
	}
	
	@RequestMapping("newPasswordForm.do")
	public ModelAndView newPasswordForm(String myId){
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", myId);
		mav.setViewName("newPasswordForm.tiles");
		return mav;
	}
	
	/*@RequestMapping("findPass.do")
	public
	@ResponseBody HashMap<String, Object> findPass(HttpServletResponse resp,
	      @RequestParam HashMap<String, Object> params){
	
		
		HashMap<String, Object> response = new HashMap<>();
		
		return response;
	}*/
	@RequestMapping(method = RequestMethod.POST, value = "login.do")
	public ModelAndView login(HttpSession session, String id, String pw, RedirectAttributes redirectAttr) {
		UserInfo userInfo = iMemberService.getMember(id);
		if (userInfo != null) {
			if (iMemberService.loginMember(id, pw)) {
				HashMap<String, Object> mainPet = IPetinfoService.selectMainPet(id);
				session.setAttribute("idx", userInfo.getIdx());
				session.setAttribute("id", userInfo.getId());
				session.setAttribute("name", userInfo.getNickname());
				if (mainPet != null) {
					session.setAttribute("petName", mainPet.get("name"));
					session.setAttribute("petSex", mainPet.get("sex"));
					session.setAttribute("petBirth", mainPet.get("birthday"));
					session.setAttribute("fileId", mainPet.get("fileId"));
					session.setAttribute("groomingStart", mainPet.get("groomingStart"));
					session.setAttribute("groomingPeriod", mainPet.get("groomingPeriod"));
				}
				redirectAttr.addFlashAttribute("isLogin", id + "님 로그인");

			} else {
				redirectAttr.addFlashAttribute("isLogin", "아이디와 비밀번호를 확인하세요");
				RedirectView rv = new RedirectView("loginForm.do");
				rv.setExposeModelAttributes(false);
				return new ModelAndView(rv);
			}
		} else {
			redirectAttr.addFlashAttribute("isLogin", "회원정보가 없습니다.");
			RedirectView rv = new RedirectView("loginForm.do");
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		}
		RedirectView rv = new RedirectView("main.do");
		rv.setExposeModelAttributes(false);
		return new ModelAndView(rv);
	}

	@RequestMapping(method = RequestMethod.POST, value = "naverLogin.do")
	public String naverLogin(HttpSession session, String id, String nickname, String email, String sex,
			String question1, String answer1,
			String question2, String answer2) {
		String password = "123456";
		String phone = "010-0000-0000";

		int adminCheck = 0;
		if (iMemberService.checkId(id)) {
			int result = iMemberService.join(id, password, nickname, sex, phone, adminCheck, email,
					question1, answer1, question2, answer2);
		}

		UserInfo userInfo = iMemberService.getMember(id);
		HashMap<String, Object> mainPet = IPetinfoService.selectMainPet(id);
		session.setAttribute("idx", userInfo.getIdx());
		session.setAttribute("id", userInfo.getId());
		session.setAttribute("name", userInfo.getNickname());
		if (mainPet != null) {
			session.setAttribute("petName", mainPet.get("name"));
			session.setAttribute("petSex", mainPet.get("sex"));
			session.setAttribute("petBirth", mainPet.get("birthday"));
			session.setAttribute("fileId", mainPet.get("fileId"));
			session.setAttribute("groomingStart", mainPet.get("groomingStart"));
			session.setAttribute("groomingPeriod", mainPet.get("groomingPeriod"));
		}
		return "redirect:main.do";
	}

	@RequestMapping("logout.do")
	public String login(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}

	@RequestMapping("main.do")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> nlist = new HashMap<>();
		nlist.put("firstBoard", iBoardService.getBoardList(1, 6)); // freeboard
		nlist.put("secondBoard", iBoardService.getBoardList(1, 2)); // reviewBoard
		nlist.put("thirdBoard", iBoardService.getBoardList(1, 4)); // lostBoard

		mav.addAllObjects(nlist);
		mav.setViewName("main.tiles");

		return mav;
	}

	@RequestMapping("joinForm.do")
	public String joinForm() {
		return "joinForm.tiles";
	}

	@RequestMapping(method = RequestMethod.POST, value = "join.do")
	public ModelAndView join(String id, String nick, String password, String sex,
			@RequestParam(defaultValue = "0") int adminCheck,
			String phone, String email,
			String question1, String answer1,
			String question2, String answer2,
			RedirectAttributes redirectAttr) {
		int result = iMemberService.join(id, password, nick, sex, phone, adminCheck, email,
				question1, answer1, question2, answer2);
		if (result > 0) {
			redirectAttr.addFlashAttribute("isJoin", "회원가입 완료");
			RedirectView rv = new RedirectView("loginForm.do");
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		} else {
			redirectAttr.addFlashAttribute("isJoin", "회원가입 오류");
			RedirectView rv = new RedirectView("joinForm.do");
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		}
	}

	@RequestMapping("idCheck.do")
	public @ResponseBody HashMap<String, Object> idCheck(HttpServletResponse resp, String id) {
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", iMemberService.checkId(id));
		return response;
	}
	
	@RequestMapping("emailCheck.do")
	public @ResponseBody HashMap<String, Object> emailCheck(String email) {
		System.out.println("이메일:" + email);
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", iMemberService.emailCheck(email));
		return response;
	}
	
	@RequestMapping("phonenumCheck.do")
	public @ResponseBody HashMap<String, Object> phonenumCheck(String phone) {
		System.out.println("폰넘버:" + phone); 
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", iMemberService.phonenumCheck(phone));
		return response;
	}
	
	@RequestMapping("nicknameCheck.do")
	public @ResponseBody HashMap<String, Object> nicknameCheck(HttpServletResponse resp, String nickname, String id) {
		HashMap<String, Object> response = new HashMap<>();
		// 닉네임 체크시 내 닉네임도 사용가능으로 출력
		// 만약 로그인 한 상태라면 닉네임 체크시 내 닉네임도 사용가능으로 출력
		if (id != null) {
			String myNickname = iMemberService.getMember(id).getNickname();

			if (myNickname.equals(nickname) && id != null) {
				response.put("result", true);
				return response;
			} else {
				response.put("result", iMemberService.nicknameCheck(nickname));
				return response;
			}
		} else {
			response.put("result", iMemberService.nicknameCheck(nickname));
			return response;
		}

	}
	
	@RequestMapping("findNickname.do")
	public @ResponseBody HashMap<String, Object> findNickname(HttpServletResponse resp, String nickname) {
		HashMap<String, Object> response = new HashMap<>();
		if(iMemberService.nicknameCheck(nickname)){
			response.put("result", true);
		}else {
			response.put("result", false);
		}
		return response;
	}
	
	@RequestMapping("verifyPerson.do")
	public @ResponseBody HashMap<String, Object> verifyPerson(HttpServletResponse resp, String nickname, String id,
			String addQuestion, String addAnswer){
		HashMap<String, Object> response = new HashMap<>();
		if(iMemberService.selectByNameId(id, nickname) == null){
			//존재하는 정보 없음
			// null로 받아지나 size로해야되나 
			response.put("result", false);
		}else {
			if(addQuestion.equals(1)){
				 // 이메일 검사
				if(iMemberService.selectByEmailAndName(nickname, addAnswer).equals(id)){
					// 정보 확인 완료
					response.put("result", true);
				}else {
					response.put("result", false);
				}
			}else{
				//전화번호로 검사
				if(iMemberService.selectByPhoneAndName(nickname, addAnswer).equals(id)){
					// 정보 확인 완료
					response.put("result", true);
				}else {
					response.put("result", false);
				}
			}
		}
		
		return response;
	}
	
	@RequestMapping("verifyByName.do")
	public @ResponseBody HashMap<String, Object> verifyByName(HttpServletResponse resp, String nickname,
			String addQuestion, String addAnswer){
		HashMap<String, Object> response = new HashMap<>();
		if(iMemberService.selectByNickname(nickname) == null){
			//존재하는 정보 없음
			// null로 받아지나 size로해야되나 
			response.put("result", false);
		}else {
			String id = (String) iMemberService.selectByNickname(nickname).get("id");
			if(addQuestion.equals(1)){
				 // 이메일 검사
				if(iMemberService.selectByEmailAndName(nickname, addAnswer).equals(id)){
					// 정보 확인 완료
					response.put("result", true);
				}else {
					response.put("result", false);
				}
			}else{
				//전화번호로 검사
				if(iMemberService.selectByPhoneAndName(nickname, addAnswer).equals(id)){
					// 정보 확인 완료
					response.put("result", true);
				}else {
					response.put("result", false);
				}
			}
		}
		
		return response;
	}
	@RequestMapping("chkQuestion.do")
	public @ResponseBody HashMap<String, Object> chkQuestion(
			String nickname, 
			String question1, String answer1,
			String question2, String answer2){
		HashMap<String, Object> userinfo = iMemberService.selectByNickname(nickname);
		
		HashMap<String, Object> response = new HashMap<>();

		if(Integer.parseInt((String)userinfo.get("question1")) == Integer.parseInt(question1) 
				&& Integer.parseInt((String)userinfo.get("question2")) == Integer.parseInt(question2)){
			response.put("result", true);
			response.put("id", (String)userinfo.get("id"));
		}else {
			response.put("result", false);
		}
		return response;
	}
	
	
	@RequestMapping("userinfoForm.do")
	public ModelAndView userinfoForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 세션의 아이디로 회원정보 출력 후 폼에 뿌려줌
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
		// 아아디에 해당하는 게시글 리스트 출력
		List<HashMap<String, Object>> boardList = iBoardService.getBoardByWriter(userInfo.getNickname());
		mav.addObject("boardList", boardList);
		System.out.println(boardList);
		// 아이디에 해당하는 강아지 목록 출력
		List<HashMap<String, Object>> petList = IPetinfoService.selectPetList(id);
		mav.addObject("petList", petList);

		mav.setViewName("userinfoForm.tiles");
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "userUpdate.do")
	public ModelAndView userUpdate(String id, String password, String nickname, String sex, String phone, String email,
			String newPassword, HttpSession session, RedirectAttributes redirectAttr,
			String question1, String answer1, String question2, String answer2) {

		UserInfo tmp = iMemberService.getMember(id);
		UserInfo userInfo = new UserInfo();
		// 정보수정을 위해 폼에서 입력한 비밀번호와 DB의 비밀번호 비교
		if (password.equals(tmp.getPassword())) {
			// 일치한다면 위의 받아온 내용을 모델에 담는다.
			userInfo.setAdminCheck(0);
			userInfo.setEmail(email);
			userInfo.setId(session.getAttribute("id").toString());
			userInfo.setNickname(nickname);
			userInfo.setPhone(phone);
			userInfo.setSex(sex);
			userInfo.setQuestion1(question1);
			userInfo.setAnswer1(answer1);
			userInfo.setQuestion2(question2);
			userInfo.setAnswer2(answer2);
			// 닉네임이 변경되었을지도 모르니 헤더에 있는 세션도 업데이트
			session.setAttribute("name", userInfo.getNickname());
			// 비밀번호를 변경하였는지 확인
			if (newPassword.equals(""))
				// 아무것도 입력하지 않았다면 기존의 비밀번호를 그대로 입력
				userInfo.setPassword(tmp.getPassword());
			else
				// 만약 입력했다면 새로운 비밀번호를 모델에 셋
				userInfo.setPassword(newPassword);
			// 서비스단으로 ㄱㄱ
			redirectAttr.addFlashAttribute("result", "정보 수정 완료");
			iMemberService.modifyInfo(userInfo);
		} else {
			// 비밀번호가 일치하지 않았다면
			redirectAttr.addFlashAttribute("result", "비밀번호를 다시 확인해주세요!");
		}

		RedirectView rv = new RedirectView("userinfoForm.do");
		rv.setExposeModelAttributes(false);
		return new ModelAndView(rv);
	}

	@RequestMapping(method = RequestMethod.POST, value = "deleteCheck.do")
	public @ResponseBody HashMap<String, Object> passCheck(HttpSession session, String id, String password,
			String chk) {
		HashMap<String, Object> response = new HashMap<>();
		UserInfo userinfo = iMemberService.getMember(id);
		String pwChk = userinfo.getPassword();
		String idChk = userinfo.getId();
		if (idChk.equals(chk) && pwChk.equals(password)) {
			iMemberService.deleteMember(id);
			session.invalidate();
			response.put("result", true);
		} else
			response.put("result", false);
		return response;

	}

	@RequestMapping("deleteForm.do")
	public String deleteForm() {

		return "userDeleteForm.popup";
	}

	@RequestMapping(method = RequestMethod.POST, value = "deleteMember.do")
	public ModelAndView deleteMember(String id, String password) {
		ModelAndView mav = new ModelAndView();
		iMemberService.getMember(id);

		return mav;
	}
	
	@RequestMapping("getMedical.do")
	public 
	@ResponseBody HashMap<String, Object> getMedical(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> tmp = new HashMap<>();
		String id = (String) params.get("id");
		String petName = (String) params.get("petName");
		
		tmp.put("id", id);
		tmp.put("name", petName);
		
		int tmp_idx = (int) IPetinfoService.selectByname(tmp).get("idx");
		String idx = String.valueOf(tmp_idx);
		HashMap<String, Object> idxParam = new HashMap<>();
		idxParam.put("idx", idx);
	
		long dDay = (long) iMedicalService.calcDday(idxParam).get("dDay");
		int vaccineCode = (int) iMedicalService.calcDday(idxParam).get("vaccineCode");
		
		String vaccineName;
		int vGubun = vaccineCode/100;
		if(vGubun == 1){
			vaccineName = "종합백신";
		}else if(vGubun == 2){
			vaccineName = "코로나";
		}else if(vGubun == 3){
			vaccineName = "켄넬코프 ";
		}else {
			vaccineName = "광견병 ";
		}
		
		HashMap<String, Object> response = new HashMap<>();
		response.put("dDay", dDay);
		response.put("vaccineName", vaccineName);
		return response;
	}

}
