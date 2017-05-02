package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import interface_service.IMedicalService;
import interface_service.IPetinfoService;

@Controller
public class MedicalcareController {

	@Autowired
	private IMedicalService medicalService;
	@Autowired
	private IPetinfoService petinfoService;
	
	@RequestMapping("uploadMedical.do")
	public 
	@ResponseBody HashMap<String, Object> uploadMedical(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> medical = new HashMap<>();

		HashMap<String, Object> map = new HashMap<>();
		map.put("name", (String)params.get("petname"));
		map.put("id", (String)params.get("id"));
		int idx = (int)petinfoService.selectByname(map).get("idx");
		int vaccineCode = Integer.parseInt((String) params.get("vaccineCode"));

		medical.put(Constant.MedicalManage.VACCINECODE, vaccineCode);
		medical.put(Constant.MedicalManage.IDX, idx);
		medical.put(Constant.MedicalManage.REALSHOTDATE, params.get("shotday"));

		HashMap<String, Object> response = new HashMap<>();
		if(medicalService.updateRealShotDate(medical)){
			response.put("result", true);
		}else {
			response.put("result", false);
		}
		return response;
	}
	
	@RequestMapping("updateMedical.do")
	public 
	@ResponseBody HashMap<String, Object> updateMedical(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> tmp = new HashMap<>();
		tmp.put("id", params.get("id"));
		tmp.put("name", params.get("petname"));
		int idx = (int) petinfoService.selectByname(tmp).get("idx");
		int vaccineCode = Integer.parseInt((String) params.get("vaccineCode"));
		
		System.out.println("idx:"+idx);
		System.out.println("vaccineCode:"+vaccineCode);
		
		HashMap<String, Object> deleteObject = new HashMap<>();
		deleteObject.put("idx", idx);
		deleteObject.put("vaccineCode", vaccineCode);
	
		HashMap<String, Object> response = new HashMap<>();
		if(medicalService.deleteRealShotDate(deleteObject)){
			response.put("result", true);
		}else {
			response.put("result", false);
		}
		return response;
	}
	
}
