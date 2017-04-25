package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("medicalcare.do")
	public String medicalcare(){
		return "medicalcare.tiles";
	}
	
	
}
