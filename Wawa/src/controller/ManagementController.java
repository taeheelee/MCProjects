package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;
import com.google.gson.Gson;

import interface_service.IManagementService;
import interface_service.IPetinfoService;
import model.Management;
import model.PetInfo;

@RestController
public class ManagementController {

	@Autowired
	private IPetinfoService petinfoService;
	@Autowired
	private IManagementService managementService;

	
	@RequestMapping(value="/petWeightListJson/{id}/{idx}.do", produces="text/plain;charset=UTF-8")
	public @ResponseBody String petWeightListJson(@PathVariable("id")String id,
			@PathVariable("idx")int idx) {
		PetInfo model = new PetInfo();
		model.setId(id);
		model.setIdx(idx);
		List<HashMap<String, Object>> weightList = managementService.selectListByIdx(model);
		
		for(HashMap<String, Object> h : weightList) {
			long timemil = ((Date) h.get("date")).getTime();
			h.put("timemil", timemil);
		}
		Gson gson = new Gson();
		String result = gson.toJson(weightList);

		return result;
	}

	@RequestMapping(method= RequestMethod.POST, value="healthcare.do")

	public ModelAndView healthcare(HttpSession session){
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> petlist = petinfoService.selectPetList(id);
		mav.addObject("list", petlist);
		mav.setViewName("healthcare.tiles");
		return mav;
	}
	
	@RequestMapping(value="getPetList.do", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> getIdxList(HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<HashMap<String, Object>> petList = petinfoService.selectPetList(id);
		HashMap<String, Object> params = new HashMap<>();
		params.put("petList", petList);
//		System.out.println("getPetList.do 요청 진입");
//		System.out.println(petList);
		return params;
	}
	
	@RequestMapping(value="getPetWeightList.do", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> dataupload(HttpSession session,
			int idx) {
		String id = (String) session.getAttribute("id");

		PetInfo model = new PetInfo();
		model.setId(id);
		model.setIdx(idx);
		List<HashMap<String, Object>> weightList = managementService.selectListByIdx(model);
		
		for(HashMap<String, Object> h : weightList) {
			long timemil = ((Date) h.get("date")).getTime();
			h.put("timemil", timemil);
		}
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("weightList", weightList); //강아지 idx로 받아 온 강아지 무게변화 기록
//		System.out.println("getPetWeightList.do 진입");
//		System.out.println(weightList);
		return params;
	}
	
//	백업용	
//	@RequestMapping(value="getIdxList.do", method=RequestMethod.GET)
//	public @ResponseBody HashMap<String, Object> getIdxList(HttpSession session) {
//		String id = (String) session.getAttribute("id");
//		// 펫리스트에서 펫 idx만 뽑아내기
//		List<Integer> petIdxList = new ArrayList<Integer>();
//		
//		List<HashMap<String, Object>> petList = petinfoService.selectPetList(id);
//		for (HashMap<String, Object> p : petList) {
//			petIdxList.add((Integer) p.get("idx"));
//		}
//		
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("idx", petIdxList);
//		return params;
//	}
	
	@RequestMapping("selectHealthcare.do")
	   public 
	   @ResponseBody HashMap<String, Object> selectHealthcare(HttpServletResponse resp,
	         @RequestParam HashMap<String, Object> params){
	      int idx = (int) petinfoService.selectByname(params).get("idx");
	      List<Management> healthList = managementService.selectAllHealth(idx);
	      List<String> dateList = new ArrayList<>();
	      
	      for(Management m : healthList){
	         Date from = m.getDate();
	         SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	         String to = transFormat.format(from);
	         dateList.add(to);
	      }
	      
	      HashMap<String, Object> response = new HashMap<>();
	      response.put("list", healthList);
	      response.put("dateList", dateList);
	      return response;
	   }
	   
	   @RequestMapping("uploadHealthcare.do")
	   public
	   @ResponseBody HashMap<String, Object> uploadHealthcare(HttpServletResponse resp,
	         @RequestParam HashMap<String, Object> params){
	   
	      int idx = (int) petinfoService.selectByname(params).get("idx");
	      
	      String from = (String) params.get("day");
	      SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	      Date to = null;
	      try {
	         to = transFormat.parse(from);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      Double weight = Double.parseDouble((String) params.get("weight"));
	      
	      model.Management model = new model.Management();
	      model.setIdx(idx);
	      model.setDate(to);
	      model.setWeight(weight);
	      
	      HashMap<String, Object> response = new HashMap<>();
	      if(managementService.insertManagement(model)){
	    	  if(petinfoService.updateWeight(weight, idx)){	    		 
		    		 response.put("result", true);
		    	 }else {
		    		 response.put("result", false);
		    	 }
	      }else {
	         response.put("result", false);
	      }
	      return response;
	      // 헬스케어로 리다이렉트해서 새로고침
	   }
	   
	   @RequestMapping("updateHealthcare.do")
	   public
	   @ResponseBody HashMap<String, Object> updateHealthcare(HttpServletResponse resp,
	         @RequestParam HashMap<String, Object> params){
	   
	      int idx = (int) petinfoService.selectByname(params).get("idx");
	      
	      String from = (String) params.get("day");
	      SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	      Date to = null;
	      try {
	         to = transFormat.parse(from);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      Double weight = Double.parseDouble((String) params.get("weight"));
	      
	      model.Management model = new model.Management();
	      model.setIdx(idx);
	      model.setDate(to);
	      model.setWeight(weight);
	      
	      HashMap<String, Object> response = new HashMap<>();
	      if(managementService.updateWeight(model)){
	    	 if(petinfoService.updateWeight(weight, idx)){	    		 
	    		 response.put("result", true);
	    	 }else {
	    		 response.put("result", false);
	    	 }
	      }else {
	         response.put("result", false);
	      }
	      return response;
	   }
	   
	   @RequestMapping("deleteHealthcare.do")
	   public 
	   @ResponseBody HashMap<String, Object> deleteHealthcare(HttpServletResponse resp,
	         @RequestParam HashMap<String, Object> params){

	      model.Management model = new model.Management();
	      model.setIdx((int) params.get("idx"));
	      model.setDate((Date) params.get("date"));
	      model.setWeight((double) params.get("weight"));
	      
	      int managementIdx = managementService.selectIdx(model);

	      HashMap<String, Object> response = new HashMap<>();
	      if(managementService.deleteManagement(managementIdx)){
	         response.put("result", true);
	      }else {
	         response.put("result", false);
	      }
	      return response;
	   }
	   
	   @RequestMapping("chkDate.do")
	   public 
	   @ResponseBody HashMap<String, Object> chkDate(HttpServletResponse resp,
	         @RequestParam HashMap<String, Object> params){
	      Date birthday = (Date) petinfoService.selectByname(params).get("birthday");
	  
		  String from = (String) params.get("day");
	      SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	      Date to = null;
	      try {
	         to = transFormat.parse(from);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      String from1 = managementService.getToday();
	      Date to1 = null;
	      try {
	         to1= transFormat.parse(from1);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      HashMap<String, Object> response = new HashMap<>();
	      long diff1 = to1.getTime() - to.getTime(); // 오늘날짜에서 입력날짜빼기
	      long diff2 = to.getTime() - birthday.getTime(); // 생일보다는 이후여야됨
	      if(diff1 >= 0 && diff2 >= 0){
	         response.put("result", true);
	      }else {
	         response.put("result", false);
	      }
	      return response;
	   }
	   
	   @RequestMapping("chkDupl.do")
	   public 
	   @ResponseBody HashMap<String, Object> chkDupl(HttpServletResponse resp,
	         @RequestParam HashMap<String, Object> params){
		  int idx = (int) petinfoService.selectByname(params).get("idx");
		      
	      model.Management model = new model.Management();
	      String from = (String) params.get("day");
	      SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	      Date to = null;
	      try {
	         to = transFormat.parse(from);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      model.setDate(to);
	      model.setIdx(idx);
	      
	      HashMap<String, Object> response = new HashMap<>();
	      if(managementService.selectDate(model) != null){
	         response.put("result", true);
	      }else {
	         response.put("result", false);
	      }
	      return response;
	   }
		@RequestMapping("calcAge.do")
		public 
		@ResponseBody HashMap<String, Object> calcAge(HttpServletResponse resp,
				@RequestParam HashMap<String, Object> params){
			
			HashMap<String, Object> pet = petinfoService.selectByname(params);
		
			Date birthday = (Date) pet.get("birthday");
			Date today = new Date();
			
			long diff = Math.abs(birthday.getTime() - today.getTime());
			long diffDays = diff / (24 * 60 * 60 * 1000);
			
			int year = (int) diffDays/365;
			long month = (int) diffDays%365/30;
			
			HashMap<String, Object> date = new HashMap<>();
			date.put("year", year);
			date.put("month", month);
			
			return date;
		}
}
