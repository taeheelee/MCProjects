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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	
	/* 그래프 기능 수정중..
	 * healthcare.do와 dataupload.do 작업중입니다.*/
	@RequestMapping("healthcare.do")
	public ModelAndView healthcare(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");	
		System.out.println(id);
		List<HashMap<String, Object>> petList = petinfoService.selectPetList(id);
	
//		String id = (String) session.getAttribute("id");
//		List<Management> weightList = new ArrayList<>();
//		weightList = managementService.selectList(id);
//		
//		Gson gson = new Gson();
//		String json = "[";
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
//			
//			Date oDate = weightList.get(i).getDate();
//			long t = oDate.getTime();
//			
//			json += "[";
////			json += gson.toJson(weightList.get(i).getDate());
//			json += gson.toJson(t);
//			json += ", ";
//			json += gson.toJson(weightList.get(i).getWeight());
//			json += "]";
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
//		json += "]";
//		System.out.println(json);
//		mav.addObject("weightList", json);
		mav.addObject("list", petList);
		mav.setViewName("healthcare.tiles");
		return mav;
	}
	
	/* 그래프 기능 수정중.
	 * healthcare.do와 dataupload.do 작업중입니다*/
	@RequestMapping(value="dataupload.do", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> dataupload(HttpSession session) {
//		System.out.println("dataupload.do 요청 받음");
		String id = (String) session.getAttribute("id");
		List<Management> weightList = new ArrayList<>();
		weightList = managementService.selectList(id);
		System.out.println(weightList);
		
		//펫리스트에서 펫 idx만 뽑아내기
		List<Integer> petIdxList = new ArrayList<Integer>();
		
		List<HashMap<String, Object>> petList = petinfoService.selectPetList(id);
		for(HashMap<String, Object> p : petList) {
			System.out.println(p.get("idx"));
		}
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("idx", 9);
		List<Long[]> data = new ArrayList<>();
		for(Management m : weightList)
		{
			Long[] xy = new Long[2];
			xy[0] = m.getDate().getTime();
			xy[1] = (long)m.getWeight();
			data.add(xy);
			
		}
		
		params.put("data", data);
		
		
//		Gson gson = new Gson();
//		double[] xy = new double[3];
//		List<double[]> arr = null;
//		
//		int flag = -1;
//		int cnt = 1;
//		for (int i = 0; i < weightList.size(); i++) {
//			if(flag != weightList.get(i).getIdx()) {
//				arr = new ArrayList<>();
//				flag = weightList.get(i).getIdx();
//			} else {
////				params.put("pet" + cnt++, arr);
//			}
//			xy[0] = weightList.get(i).getDate().getTime();
//			xy[1] = weightList.get(i).getWeight();
//			xy[2] = weightList.get(i).getIdx();
//			arr.add(xy);
//		}
////		params.put("wList", arr);
//		System.out.println("params : " + params);
//		for(int i = 0; i < params.size(); i++) {
//			System.out.println(params.get("pet" + i+1));
//		}

		return params;
		
		
		
//		String json = "[";
//		int tempIdx = -1;
//		for (int i = 0; i < weightList.size(); i++) {
//			if(tempIdx == weightList.get(i).getIdx()) {
//				json += ", ";
//			} else {
//				json += "[";
//			}
//			
//			Date oDate = weightList.get(i).getDate();
//			long t = oDate.getTime();
//			
//			json += "[";
//			json += gson.toJson(t);
//			json += ", ";
//			json += gson.toJson(weightList.get(i).getWeight());
//			json += "]";
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
//		json += "]";
//		System.out.println(json);
//		return json;

		
//		ModelAndView mav = new ModelAndView();
//		String id = (String) session.getAttribute("id");
//		List<Management> weightList = new ArrayList<>();
//		weightList = managementService.selectList(id);
//		
//		Gson gson = new Gson();
//		String json = "[";
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
//			
//			Date oDate = weightList.get(i).getDate();
//			long t = oDate.getTime();
//			
//			json += "[";
////			json += gson.toJson(weightList.get(i).getDate());
//			json += gson.toJson(t);
//			json += ", ";
//			json += gson.toJson(weightList.get(i).getWeight());
//			json += "]";
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
//		json += "]";
//		System.out.println(json);
//		mav.addObject("weightList", json);
//		mav.setViewName("healthcare.tiles");
//		return mav;
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
	      if(diff1 > 0 && diff2 > 0){
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
	      if(managementService.selectDate(model).size() != 0){
	    	 System.out.println("중복");
	         response.put("result", true);
	      }else {
	    	  System.out.println("중복아님");
	         response.put("result", false);
	      }
	      return response;
	   }
}

