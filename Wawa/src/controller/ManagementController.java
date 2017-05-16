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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import interface_service.IManagementService;
import interface_service.IPetinfoService;
import model.Management;

@RestController
public class ManagementController {

	@Autowired
	private IPetinfoService petinfoService;
	@Autowired
	private IManagementService managementService;
	
	/* 그래프 기능 수정중..
	 * healthcare.do와 dataupload.do 작업중입니다.*/
	@RequestMapping("healthcare.do")
	public ModelAndView healthcare(){
		ModelAndView mav = new ModelAndView();
//		String id = (String) session.getAttribute("id");
//		
//		List<HashMap<String, Object>> petList = petinfoService.selectPetList(id);
//		
//		List<Management> weightList = new ArrayList<>();
//		weightList = managementService.selectList(id);
//		
//		Gson gson = new Gson();
//		String json = "";
//		json += "[";
//		
//		for (int i = 0; i < weightList.size(); i++) {
//			json += gson.toJson(weightList.get(i));
//			if(i < weightList.size()-1)
//				json += ", ";
//		}
//		json += "]";
//		System.out.println(json);
//		mav.addObject("weightList", json);
//		mav.addObject("list", petList);
		mav.setViewName("healthcare.tiles");
		return mav;
	}
	
	/* 그래프 기능 수정중.
	 * healthcare.do와 dataupload.do 작업중입니다.*/
	@RequestMapping("dataupload.do")
	public ModelAndView dataupload(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		List<Management> weightList = new ArrayList<>();
		weightList = managementService.selectList(id);
		
		Gson gson = new Gson();
		String json = "[";

		int tempIdx = -1;
		boolean writer = false;
		
		for (int i = 0; i < weightList.size(); i++) {
			if(tempIdx == weightList.get(i).getIdx()) {
				json += ", ";
			} else {
				json += "[";
			}
			
			Date oDate = weightList.get(i).getDate();
			long t = oDate.getTime();
			
			json += "[";
//			json += gson.toJson(weightList.get(i).getDate());
			json += gson.toJson(t);
			json += ", ";
			json += gson.toJson(weightList.get(i).getWeight());
			json += "]";
			
			if(i < weightList.size()-1) {
				tempIdx = weightList.get(i).getIdx();
				if(weightList.get(i).getIdx() != weightList.get(i+1).getIdx()) {
					json += "], ";
				}
			}
			if(i == weightList.size() - 1) {
				json += "]";
			}
		}
		
		json += "]";
		System.out.println(json);
		mav.addObject("weightList", json);
		mav.setViewName("healthcare.tiles");
		return mav;
	}
	
//	@RequestMapping("dataupload.do")
//	public ModelAndView dataupload(HttpSession session){
//		ModelAndView mav = new ModelAndView();
//		String id = (String) session.getAttribute("id");
//		List<Management> weightList = new ArrayList<>();
//		weightList = managementService.selectList(id);
//		
//		Gson gson = new Gson();
//		String json = "";
//
//		int tempIdx = -1;
//		boolean writer = false;
//		
//		for (int i = 0; i < weightList.size(); i++) {
//			if(tempIdx == weightList.get(i).getIdx()) {
//				json += ", ";
//			} else {
//				json += "[";
//			}
//			String fDate = "";
//			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//			Date oDate = weightList.get(i).getDate();
//			long t = oDate.getTime();
//			System.out.println("롱롱롱:" +t);
//			fDate = transFormat.format(oDate);
////			System.out.println(fDate + "??????");
//			
//			json += "{\"x\" : ";
////			json += gson.toJson(weightList.get(i).getDate());
//			json += gson.toJson(fDate);
//			json += ", \"y\" : ";
//			json += gson.toJson(weightList.get(i).getWeight());
//			json += "}";
//			
//			if(i < weightList.size()-1) {
//				tempIdx = weightList.get(i).getIdx();
//				if(weightList.get(i).getIdx() != weightList.get(i+1).getIdx()) {
//					json += "], ";
//				}
//			}
//			if(i == weightList.size() - 1) {
//				json += "]";
//			}
//		}
//		
////		json += "]";
//		System.out.println(json);
//		mav.addObject("weightList", json);
//		mav.setViewName("healthcare.tiles");
//		return mav;
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
	   
	      System.out.println("나불럿졍?");
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
	         response.put("result", true);
	      }else {
	         response.put("result", false);
	      }
	      return response;
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
	         response.put("result", true);
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
	      System.out.println(params.get("day")); // 사용자가 적은 날짜를 받아와서
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
	      long diff = to1.getTime() - to.getTime(); // 오늘날짜에서 입력날짜빼기
	      if(diff > 0){
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
	      model.Management model = new model.Management();
	      
	      System.out.println(params.get("day"));
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
	      System.out.println("시바어디서오류났어");
	      HashMap<String, Object> response = new HashMap<>();
	      System.out.println(managementService.selectDate(model));
	      if(managementService.selectDate(model).size() != 0){
	         response.put("result", true);
	         System.out.println("중복");
	      }else {
	         response.put("result", false);
	         System.out.println("중복아님");
	      }
	      return response;
	   }

}

