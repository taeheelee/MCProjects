package controller;

import java.util.Date;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import interface_service.IPetinfoService;

@Controller
@SessionAttributes("id")
public class PetinfoController {

	@Autowired
	private IPetinfoService petinfoService;
	
	@RequestMapping("addPetForm.do")
	public String addPetForm(){
		return "addPetForm.tiles";
	}
	
	@RequestMapping("addPet.do")
	public String addPet(String resist, String id, String name, String kind, 
			Date birthday, String neutral, double weight, String sex, 
			Date groomingStart, int groomingPeriod){
		boolean result = petinfoService.insertPetInfo(0, resist, id, name, kind, birthday, neutral, weight, 
				sex, groomingStart, groomingPeriod);
		if(result){
			return "redirect:main.do";			
		}else {
			return "redirect:addPetForm.do";
		}
	}
	
}
