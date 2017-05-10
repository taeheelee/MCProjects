package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import interface_service.IMedicalService;
import interface_service.IPetinfoService;
import interface_service.IVaccineInfoService;

@Controller
public class MedicalcareController {

	@Autowired
	private IMedicalService medicalService;
	@Autowired
	private IPetinfoService petinfoService;
	@Autowired
	private IVaccineInfoService vaccineService;
	
	@RequestMapping("medicalcareForm.do")
	public ModelAndView medicalcareForm(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> petlist = petinfoService.selectPetList(id);
		
		for(int i = 0; i < petlist.size(); i ++){
			// 각 펫에 대한 메디칼 정보를 보내야하는데
		}
		
		mav.addObject("myid", id);
		mav.addObject("list", petlist);
		
		mav.setViewName("medicalcareForm.tiles");
		return mav;
	}
	
	@RequestMapping("calcShotday.do")
	public 
	@ResponseBody HashMap<String, Object> calcShotday(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		
		// 諛깆떊肄붾뱶�옉 �궇吏쒕낫�깂
		int vaccineCode = Integer.parseInt((String) params.get("vaccineCode"));
		
		String from = (String) params.get("shotday");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = null;
		try {
			to = transFormat.parse(from);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int period = (int) vaccineService.selectVaccineInfo(vaccineCode).get("vaccinePeriod");
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(to);
		cal.add(Calendar.DAY_OF_YEAR, period); // 二쇨린瑜� �뜑�븳�떎.

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = fm.format(cal.getTime());
		
		HashMap<String, Object> date = new HashMap<>(); 
		date.put("nextDate", strDate);
		
		return date;
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
	
	@RequestMapping("calcDday.do")
	public 
	@ResponseBody HashMap<String, Object> calcDday(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		
		String from = (String) params.get("nextShotday");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = null;
		try {
			to = transFormat.parse(from);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Date nextday = to;
		Date today = new Date();

		long diff = nextday.getTime() - today.getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);
		
		String days = "";
		if(diffDays > 0){
			diffDays *= -1;
			days += String.valueOf(diffDays);
		}
		else{
			days += "+"; 
			diffDays *= -1;
			days += String.valueOf(diffDays);
		}
		
		HashMap<String, Object> date = new HashMap<>();
		date.put("dDay", days);
		
		return date;
	}
	
	@RequestMapping("uploadMedical.do")
	public 
	@ResponseBody HashMap<String, Object> uploadMedical(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> medical = new HashMap<>();

		int idx = (int)petinfoService.selectByname(params).get("idx");
		int vaccineCode = Integer.parseInt((String) params.get("vaccineCode"));

		medical.put(Constant.MedicalManage.VACCINECODE, vaccineCode);
		medical.put(Constant.MedicalManage.IDX, idx);
		medical.put(Constant.MedicalManage.REALSHOTDATE, params.get("shotday"));

		HashMap<String, Object> response = new HashMap<>();
		if(medicalService.insertRealShotDate(medical)){
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
		HashMap<String, Object> medical = new HashMap<>();

		int idx = (int)petinfoService.selectByname(params).get("idx");
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
	
	@RequestMapping("deleteMedical.do")
	public 
	@ResponseBody HashMap<String, Object> deleteMedical(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){

		int idx = (int) petinfoService.selectByname(params).get("idx");
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
