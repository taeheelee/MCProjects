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
		mav.addObject("list", petlist);
		mav.setViewName("medicalcareForm.tiles");
		return mav;
	}
	
	@RequestMapping("calcShotday.do")
	public 
	@ResponseBody HashMap<String, Object> calcShotday(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		
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
		
		System.out.println("백신코드" + vaccineCode);
		System.out.println("날짜" + to);
		int period = (int) vaccineService.selectVaccineInfo(vaccineCode).get("vaccinePeriod");
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(to);
		cal.add(Calendar.DAY_OF_YEAR, period); // 二쇨린瑜� �뜑�븳�떎.

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = fm.format(cal.getTime());
		
		Date from1 = to;
		SimpleDateFormat transFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		String to1 = transFormat.format(from1);

		HashMap<String, Object> date = new HashMap<>();
		date.put("realDate", to1);
		date.put("nextDate", strDate);
		
		System.out.println(strDate);
		System.out.println(to1);
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
	
	@RequestMapping("selectMedical.do")
	public 
	@ResponseBody HashMap<String, Object> selectMedical(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> medical = new HashMap<>();
		int idx = (int) petinfoService.selectByname(params).get("idx");
		List<HashMap<String, Object>> careList = medicalService.selectAllShotDate(idx);
		
		HashMap<String, Object> response = new HashMap<>();
		response.put("careList", careList);
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
	
	@RequestMapping("uploadMedical.do")
	public 
	@ResponseBody HashMap<String, Object> uploadMedical(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> medical = new HashMap<>();

		int idx = (int) petinfoService.selectByname(params).get("idx");
		int vaccineCode = Integer.parseInt((String) params.get("vaccineCode"));

		medical.put(Constant.MedicalManage.VACCINECODE, vaccineCode);
		medical.put(Constant.MedicalManage.IDX, idx);
		medical.put(Constant.MedicalManage.REALSHOTDATE, params.get("shotday"));
		medical.put(Constant.MedicalManage.DDAY, params.get("dDay"));			
		medical.put(Constant.MedicalManage.NEXTDAY, params.get("nextShotday"));
		
		System.out.println("씨앙!!");
		System.out.println("인덱스:"+idx);
		System.out.println("백신코드:"+vaccineCode);
		
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
		System.out.println("씨앙!!");
		System.out.println("인덱스:"+idx);
		System.out.println("백신코드:"+vaccineCode);
		

		medical.put(Constant.MedicalManage.VACCINECODE, vaccineCode);
		medical.put(Constant.MedicalManage.IDX, idx);
		medical.put(Constant.MedicalManage.REALSHOTDATE, params.get("shotday"));
		medical.put(Constant.MedicalManage.NEXTDAY, params.get("nextShotday"));
		medical.put(Constant.MedicalManage.DDAY, params.get("dDay"));
		
		HashMap<String, Object> response = new HashMap<>();
		
		if(medicalService.updateRealShotDate(medical)){
			response.put("result", true);
		}else {
			response.put("result", false);
		}
		return response;
	}
	
	@RequestMapping("chkDupl2.do")
	public 
	@ResponseBody HashMap<String, Object> chkDupl(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> tmp = new HashMap<>();
		int idx = (int)petinfoService.selectByname(params).get("idx");
		String vaccineCode = (String) params.get("vaccineCode");
		tmp.put("vaccineCode", vaccineCode);

		HashMap<String, Object> response = new HashMap<>();
		if(medicalService.selectVc(tmp) != null){
		 //중복
			response.put("result", true);
		}else {
			response.put("result", false);
		}
		return response;
	}
}
