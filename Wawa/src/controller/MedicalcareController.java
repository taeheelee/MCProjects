package controller;

import java.util.Date;
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
	
	@RequestMapping("uploadDHPPL.do")
	public String uploadDHPPL(String shotday){
	
	}
	
	@RequestMapping("uploadCorona.do")
	public String uploadCorona(String shotday){
		
	}
	
	@RequestMapping("uploadKennel.do")
	public String uploadKennel(String shotday){
		
	}
	
	@RequestMapping("uploadRabies.do")
	public String uploadRabies(String shotday){
		
	}
}
