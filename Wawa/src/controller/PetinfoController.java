package controller;

import java.util.Date;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import interface_service.IPetinfoService;

@Controller
public class PetinfoController {

	@Autowired
	private IPetinfoService petinfoService;
	
	@RequestMapping("addPetForm.do")
	public void addPetForm(){}
	
	@RequestMapping("addPet.do")
	public String addPet(int idx, String resist, String id, String name, String kind, 
			Date birthday, String neutral, double weight, String sex, 
			Date groomingStart, int groomingPeriod){
		boolean result = petinfoService.insertPetInfo(idx, resist, id, name, kind, birthday, neutral, weight, 
				sex, groomingStart, groomingPeriod);
		if(result){
			return "redirect:main.do";			
		}else {
			return "redirect:addPetForm.do";
		}
	}
	
}
