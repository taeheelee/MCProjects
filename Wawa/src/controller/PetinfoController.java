package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IPetinfoService;

@Controller
public class PetinfoController {

	@Autowired
	private IPetinfoService petinfoService;
	
	@RequestMapping("addPetForm.do")
	public String addPetForm(HttpSession session){
	//	session.setAttribute("id", session.);
		return "addPetForm.tiles";
	}
	
	@RequestMapping("addPet.do")
	public String addPet(String resist, String id, String name, String kind, 
			String birthday, String neutral, double weight, String sex, 
			String groomingStart, String groomingPeriod){
		
		String fromBirth = birthday;
		SimpleDateFormat transBirthFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date tobirth = null;
		try {
			tobirth = transBirthFormat.parse(fromBirth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String fromGs = groomingStart;
		SimpleDateFormat transGsFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date toGs = null;
		try {
			toGs = transGsFormat.parse(fromGs);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		boolean result = petinfoService.insertPetInfo(0, resist, id,
				name, kind, tobirth, neutral, weight, 
				sex, toGs, groomingPeriod);
		if(result){
			return "redirect:main.do";			
		}else {
			return "redirect:addPetForm.do";
		}
	}
	
	@RequestMapping("healthcare.do")
	public String healthcare(){
		return "healthcare.tiles";
	}
	
	@RequestMapping("medicalcareForm.do")
	public String medicalcareForm(String id){
		return "medicalcareForm.tiles";
	}
	
	@RequestMapping("selectPet.do")
	public 
	@ResponseBody HashMap<String, Object> selectPet(HttpServletResponse resp, HashMap<String, Object> params){
		HashMap<String, Object> response = new HashMap<>();
		response.put("result", petinfoService.selectOne(params));
		return response;
	}
	
	
}
