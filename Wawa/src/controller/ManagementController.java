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

import org.apache.ibatis.ognl.Ognl;
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
		
//		for(Management m : weightList) {
//			Date temp = m.getDate();
//			String newDate = new SimpleDateFormat("yy-MM-dd").format(temp);
//			try {
//				temp = new SimpleDateFormat("yy-MM-dd").parse(newDate);
//				m.setDate(temp);
////				System.out.println(m.getDate());
//			} catch (ParseException e) {
//				System.out.println("date format error");
//				e.printStackTrace();
//			}
//		}
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
		
//		return [
//		        {
//		          values: sin,      //values - represents the array of {x,y} data points
//		          key: 'Sine Wave', //key  - the name of the series.
//		          color: '#ff7f0e'  //color - optional: choose your own line color.
//		        },
//		        {
//		          values: cos,
//		          key: 'Cosine Wave',
//		          color: '#2ca02c'
//		        },
//		        {
//		          values: sin2,
//		          key: 'Another sine wave',
//		          color: '#7777ff',
//		          area: true      //area - set to true if you want this line to turn into a filled area chart.
//		        }
//		      ];
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
	
		HashMap<String, Object> petinfo = petinfoService.selectByname(params);
		int idx = (int) petinfo.get("idx");
		
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
			Date date = managementService.selectRecentDate(idx);
			double recentWeight = managementService.selectRecentWeight(date);
			if(petinfoService.updateWeight(recentWeight, idx)){					
				response.put("result", true);
			}else {
				response.put("result", false);
			}
		}else {
			response.put("result", false);
		}
		return response;
	}
	
	@RequestMapping("updateHealthcare.do")
	public
	@ResponseBody HashMap<String, Object> updateHealthcare(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
	
		HashMap<String, Object> pet = petinfoService.selectByname(params);
		int idx = (int) pet.get("idx");
		
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
			Date date = managementService.selectRecentDate(idx);
			double recentWeight = managementService.selectRecentWeight(date);
			if(petinfoService.updateWeight(recentWeight, idx)){					
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

