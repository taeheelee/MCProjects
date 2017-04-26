package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("uploadDHPPL.do")
	public 
	@ResponseBody HashMap<String, Object> uploadDHPPL(HashMap<String, Object> params){
		HashMap<String, Object> response = new HashMap<>();
		
		String fromShotday = (String)params.get("shotday");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date toShotday = null;
		try {
			toShotday = transFormat.parse(fromShotday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("petname", (String)params.get("petname"));
		map.put("id", (String)params.get("id"));
		int idx = (int)petinfoService.selectByname(params).get("idx");
		
		int vaccineCode = (int)params.get("vaccineCode");
		
		response.put(Constant.MedicalManage.VACCINECODE, vaccineCode);
		response.put(Constant.MedicalManage.IDX, idx);
		response.put(Constant.MedicalManage.REALSHOTDATE, toShotday);
		//IDX, VACCINECODE, REALSHOTDATE
		
		if(medicalService.updateRealShotDate(response)){
			
		}else {
			
		}
		return response;
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
