package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IMedicalService;

@Controller
public class MedicalcareController {

	@Autowired
	private IMedicalService medicalService;
	
	@RequestMapping("updateDHPPL.do")
	public String updateDHPPL(HashMap<String, Object> params){
		medicalService.updateRealShotDate(params);
		return "redirect:medicalcareForm.do";
	}
	
	@RequestMapping("deleteDHPPL.do")
	public String deleteDHPPL(HashMap<String, Object> params){
		medicalService.deleteRealShotDate(params);
		return "redirect:medicalcareForm.do";
	}
	
	@RequestMapping("uploadDHPPL.do")
	public String uploadDHPPL(){
		
	}
	
	@RequestMapping("updateCorona.do")
	public String updateCorona(){
		
	}
	
	@RequestMapping("deleteCorona.do")
	public String deleteCorona(){
		
	}
	
	@RequestMapping("uploadCorona.do")
	public String uploadCorona(){
		
	}
	
	@RequestMapping("updateKennel.do")
	public String updateKennel(){
		
	}
	
	@RequestMapping("deleteKennel.do")
	public String deleteKennel(){
		
	}
	
	@RequestMapping("updateRabies.do")
	public String updateRabies(){
		
	}
	
	@RequestMapping("deleteRabies.do")
	public String deleteRabies(){
		
	}
	
	@RequestMapping("uploadRabies.do")
	public String uploadRabies(){
		
	}
}
