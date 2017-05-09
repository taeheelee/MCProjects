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
	
	@RequestMapping("healthcare.do")
	public ModelAndView healthcare(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = session.getAttribute("id").toString();
		
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
	
	@RequestMapping("uploadHealthcare.do")
	public
	@ResponseBody HashMap<String, Object> uploadHealthcare(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> healthcare = new HashMap<>();
	
		int idx = (int) petinfoService.selectByname(healthcare).get("idx");
		
		String from = (String) params.get("day");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = null;
		try {
			to = transFormat.parse(from);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Date day = to;
		Double weight = (Double) params.get("weight");
		
		model.Management model = new model.Management();
		model.setManagementIdx(0);
		model.setIdx(idx);
		model.setDate(day);
		model.setWeight(weight);
		
		HashMap<String, Object> response = new HashMap<>();
		if(managementService.updateManagement(model)){
			response.put("result", true);
		}else {
			response.put("result", false);
		}
		return response;
		
	}
	
	
	
}

