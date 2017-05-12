package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
	
	@RequestMapping("healthcare.do")
	public ModelAndView healthcare(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		
		List<HashMap<String, Object>> petList = petinfoService.selectPetList(id);
		
		List<Management> weightList = new ArrayList<>();
		weightList = managementService.selectList(id);
		
		Gson gson = new Gson();
		String json = "";
		json += "[";
		
//		for (int i = 0; i < weightList.size(); i++) {
//			json += "\"pet" + i + "\" : " + gson.toJson(weightList.get(i));
//			if(i < weightList.size()-1)
//				json += ", ";
//		}
		for (int i = 0; i < weightList.size(); i++) {
			json += gson.toJson(weightList.get(i));
			if(i < weightList.size()-1)
				json += ", ";
		}
		json += "]";
		System.out.println(json);
		mav.addObject("weightList", json);
		mav.addObject("list", petList);
		mav.setViewName("healthcare.tiles");
		return mav;
	}
//	
//	@RequestMapping("selectHealthcare.do")
//	public ModelAndView selectHealthcare(HashMap<String, Object> params){
//		ModelAndView mav = new ModelAndView();
//		HashMap<String, Object> healthcare = new HashMap<>();
//		int idx = (int) petinfoService.selectByname(params).get("idx");
//		List<Management> healthList = managementService.selectAllHealth(idx);
//		int length = healthcare.size();
//		mav.addObject("length", length);
//		mav.addObject("list", healthList);
//		return mav;
//	}
	
	@RequestMapping("setOrder.do")
	public 
	@ResponseBody HashMap<String, Object> setOrder(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
	
		Date [] dates = params.get("data");
		
		for(Date d : dates){
			Date from = d;
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String to = transFormat.format(from);
			System.out.println(to + " ");
		}
		System.out.println(params.get("data"));
		
		HashMap<String, Object> response = new HashMap<>();
//		response.put("list", healthList);
//		response.put("dateList", dateList);
		return response;
	}
	
	
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
		int managementIdx = managementService.selectIdx(model);
		model.setManagementIdx(managementIdx);
		//인덱스를 어찌하지
		
		HashMap<String, Object> response = new HashMap<>();
		if(managementService.updateManagement(model)){
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
	
}

