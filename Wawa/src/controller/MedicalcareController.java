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
		
//		String fromShotday = (String)params.get("shotday");
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date toShotday = null;
//		try {
//			toShotday = transFormat.parse(fromShotday);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
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
}
