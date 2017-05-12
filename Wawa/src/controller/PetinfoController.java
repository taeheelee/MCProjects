package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.crypto.interfaces.PBEKey;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IDogKindService;
import interface_service.IMedicalService;
import interface_service.IPetinfoService;
import model.PetInfo;

@Controller
public class PetinfoController {

	@Autowired
	private IPetinfoService petinfoService;
	@Autowired
	private IMedicalService medicalService;
	@Autowired
	private IDogKindService dogKindService;
	
	
	@RequestMapping("myPetInfo.do")
	public ModelAndView myPetInfo(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> petList = petinfoService.selectPetList(id);
		mav.addObject("petList", petList);
		mav.setViewName("myPetInfo.tiles");
		return mav;
	}
	@RequestMapping("addPetForm.do")
	public ModelAndView addPetForm(){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> kindList = dogKindService.selectAllDogKind();
		mav.addObject("kindList", kindList);
		mav.setViewName("addPetForm.tiles");
		return mav;
	}
	/*@RequestMapping("addPetForm.do")
	public String addPetForm(){
		return "addPetForm.tiles";
	}*/
	
	@RequestMapping("addPet.do")
	public String addPet(String resist, String id, String name, String kind, 
			String birthday, String neutral, double weight, String sex, 
			String groomingStart, String groomingPeriod, HttpSession session){
		
		String fromBirth = birthday;
		SimpleDateFormat transBirthFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date tobirth = null;
		try {
			tobirth = transBirthFormat.parse(fromBirth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String fromGs = groomingStart;
		SimpleDateFormat transGsFormat = new SimpleDateFormat("yyyy/MM/dd");
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
			session.setAttribute("petName", name);
			session.setAttribute("petSex", sex);	
			session.setAttribute("petBirth", transBirthFormat);	
			return "redirect:main.do";			
		}else {
			return "redirect:addPetForm.do";
		}
	}
	
	@RequestMapping("selectPet.do")
	public
	@ResponseBody HashMap<String, Object> selectPet(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> response = new HashMap<>();
		HashMap<String, Object> pet = petinfoService.selectByname(params);
		response.put("pet", pet);
		return response;
	}
	
	@RequestMapping("getAge.do")
	public 
	@ResponseBody HashMap<String, Object> getAge(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		HashMap<String, Object> petAge = petinfoService.getAge(params);
		return petAge;
	}
	
}