package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.crypto.interfaces.PBEKey;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import interface_service.IDogKindService;
import interface_service.IMedicalService;
import interface_service.IPetinfoService;
import model.PetInfo;

@Controller
public class PetinfoController {

	@Autowired
	private IPetinfoService petInfoService;
	@Autowired
	private IMedicalService medicalService;
	@Autowired
	private IDogKindService dogKindService;

	@RequestMapping("myPetInfo.do")
	public ModelAndView myPetInfo(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(id.equals(session.getAttribute("id"))){
			List<HashMap<String, Object>> petList = petInfoService.selectPetList(id);
			mav.addObject("petList", petList);
			
			
			
			mav.setViewName("myPetInfo.tiles");
			return mav;
		}else{
			String user = (String)session.getAttribute("id");
			List<HashMap<String, Object>> petList = petInfoService.selectPetList(user);
			mav.addObject("petList", petList);
			mav.addObject("accessErr", "접근금지");
			mav.setViewName("myPetInfo.tiles");
			return mav;
		}
		
	}
//	@RequestMapping("calendar.do")
//	@ResponseBody List<HashMap<String, Object>> calendar(String id) {
//		List<HashMap<String, Object>> petList = petInfoService.selectPetList(id);
////		System.out.println(petList.get(0).get("groomingStart"));
////		System.out.println(petList.get(0).get("groomingPeroid"));
////		for (int i = 0; i < petList.size(); i++){
////			String gDay="";
////			
////			petList.get(0).get("groomingStart");
////			petList.get(0).get("groomingPeroid");
////			
////			HashMap<String, Object> temp = new HashMap<>();
////			temp.put("gDay", gDay);
////			petList.set(i,temp );
////		}
//		
//		return petList;
//	}
	
	@RequestMapping("calendar.do")
	@ResponseBody List<HashMap<String, Object>> calendar(String id) {
		List<HashMap<String, Object>> petList = petInfoService.calendarEvent(id);
		
		return petList;
	}

	@RequestMapping("addPetForm.do")
	public ModelAndView addPetForm() {
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> kindList = dogKindService.selectAllDogKind();
		mav.addObject("kindList", kindList);
		mav.setViewName("addPetForm.tiles");
		return mav;
	}
	/*
	 * @RequestMapping("addPetForm.do") public String addPetForm(){ return
	 * "addPetForm.tiles"; }
	 */

	@RequestMapping("addPet.do")
	public String addPet(String resist, String id, String name, String kind, String birthday, String neutral,
			double weight, String sex, String groomingStart, String groomingPeriod, HttpSession session,
			@RequestParam(defaultValue = "0") int mainPet, @RequestParam("ufile") MultipartFile ufile) {

		String fromBirth = birthday;
		SimpleDateFormat transBirthFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date tobirth = null;
		try {
			tobirth = transBirthFormat.parse(fromBirth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String fromGs = groomingStart;
		SimpleDateFormat transGsFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date toGs = null;
		try {
			toGs = transGsFormat.parse(fromGs);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		boolean result = false;
		// 신규유저는 메인펫이 null이므로 null이면 mainPet으로 지정
		if (petInfoService.selectMainPet(id) == null) {
			result = petInfoService.insertPetInfo(0, resist, id, name, kind, tobirth, neutral, weight, sex, toGs,
					groomingPeriod, 1, ufile);
			HashMap<String, Object> mp = petInfoService.selectMainPet(id);
			session.setAttribute("petName", mp.get("name"));
			session.setAttribute("petSex", mp.get("sex"));
			session.setAttribute("petBirth", mp.get("birthday"));
			session.setAttribute("fileId", mp.get("fileId"));
			session.setAttribute("groomingStart", mp.get("groomingStart"));	
			session.setAttribute("groomingPeriod", mp.get("groomingPeriod"));
		} else {
			result = petInfoService.insertPetInfo(0, resist, id, name, kind, tobirth, neutral, weight, sex, toGs,
					groomingPeriod, mainPet, ufile);
		}

		if (result) {
			return "redirect:myPetInfo.do?id="+id;
		} else {
			return "redirect:addPetForm.do";
		}
	}
	
//	@RequestMapping("getMedicalInfo.do")
//	public 
//	@ResponseBody HashMap<String, Object> getMedicalInfo(HttpServletResponse resp,
//			@RequestParam HashMap<String, Object> params){
//		// 파라미터에 idx와 vGubun들어있음
//		long dDay = (long) medicalService.calcDday(params).get("dDay");
//		int vaccineCode = (int) medicalService.calcDday(params).get("vaccineCode");
//		
//		String vaccineName;
//		int vGubun = vaccineCode/100;
//		if(vGubun == 1){
//			vaccineName = "종합백신";
//		}else if(vGubun == 2){
//			vaccineName = "코로나";
//		}else if(vGubun == 3){
//			vaccineName = "켄넬코프 ";
//		}else {
//			vaccineName = "광견병 ";
//		}
//		
//		HashMap<String, Object> response = new HashMap<>();
//		response.put("dDay", dDay);
//		response.put("vaccineName", vaccineName);
//		return response;
//	}
	
	@RequestMapping("updatePetForm.do")
	   public ModelAndView updatePetForm(int idx){
	      ModelAndView mav = new ModelAndView();
	      //일단 펫리스트를 가져와      
	      HashMap<String, Object> petInfo = petInfoService.selectOne(idx);
	      mav.addAllObjects(petInfo);
	      
	      List<HashMap<String, Object>> kindList = dogKindService.selectAllDogKind();
	      mav.addObject("kindList", kindList);
	      
	      HashMap<String, Object> fileTemp = petInfoService.selectFile((int)petInfo.get("fileId"));
	      mav.addAllObjects(fileTemp);
	      
	      mav.setViewName("updatePetForm.tiles");
	      
	      return mav;
	   }
	   
		
	   @RequestMapping("updatePet.do")
	   public String updatePet(int idx, String resist, String id, String name, String kind, 
	         String birthday, String neutral, double weight, String sex, 
	         String groomingStart, String groomingPeriod, HttpSession session,
	         @RequestParam(defaultValue="0")int mainPet ,@RequestParam("ufile") MultipartFile ufile){
	      String fromBirth = birthday;
	      SimpleDateFormat transBirthFormat = new SimpleDateFormat("yyyy-MM-dd");
	      Date tobirth = null;
	      try {
	         tobirth = transBirthFormat.parse(fromBirth);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      String fromGs = groomingStart;
	      SimpleDateFormat transGsFormat = new SimpleDateFormat("yyyy-MM-dd");
	      Date toGs = null;
	      try {
	         toGs = transGsFormat.parse(fromGs);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      boolean result = petInfoService.updatePetInfo(idx, resist, id, name, kind, 
	            tobirth, neutral, weight, sex, toGs, groomingPeriod, mainPet, ufile);
	      if(result){
	    	  //메인펫을 업데이트 한거라면 session에 다시 셋팅
	    	  HashMap<String, Object> mp =  petInfoService.selectMainPet(id);
	         if((int)mp.get("idx") == idx){
	            session.setAttribute("petName", name);
	            session.setAttribute("petSex", sex);   
	            session.setAttribute("petBirth", fromBirth);  
	            session.setAttribute("groomingStart", groomingStart);	
				session.setAttribute("groomingPeriod", groomingPeriod);
	         }
	         return "redirect:myPetInfo.do?id="+id;         
	      }else {
	         return "redirect:updatePetForm.do";
	      }
	   }

	@RequestMapping("selectPet.do")
	public @ResponseBody HashMap<String, Object> selectPet(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params) {
		HashMap<String, Object> response = new HashMap<>();
		HashMap<String, Object> pet = petInfoService.selectByname(params);
		response.put("pet", pet);
		return response;
	}

	@RequestMapping("getAge.do")
	public @ResponseBody HashMap<String, Object> getAge(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		if(params.get("birthday").equals("undefined") || params.get("petIdx").equals("undefined")){
			HashMap<String, Object> petAge = new HashMap<>();		
			return petAge;
		}else{
			HashMap<String, Object> petAge = petInfoService.getAge(params);
			
			String petIdxString = (String)params.get("petIdx");
			int petIdx = Integer.parseInt(petIdxString);
			HashMap<String, Object> medi = medicalService.DDayForHeader(petIdx);
//			System.out.println("medi : "+ medi);
			petAge.put("vName", medi.get("vName"));
			petAge.put("minDDayString", medi.get("minDDayString"));
//			System.out.println("petAge : "+ petAge);
			return petAge;
		}
	}

	@RequestMapping("deletePet.do")
	public ModelAndView deletePet(String id, int idx, String petname, HttpSession session, RedirectAttributes redirectAttr){
		ModelAndView mav = new ModelAndView();
		//펫 이름이 일치하는지
		if(petInfoService.selectOne(idx).get("name").equals(petname)){
			//일치하면 펫 삭제
			petInfoService.deletePetInfo(idx);
			redirectAttr.addFlashAttribute("isDel", "펫 정보가 삭제 되었습니다.");
			
		}else{
			redirectAttr.addFlashAttribute("isDel", "펫 정보 삭제 오류");
		}
		//펫 삭제 후 일단 펫리스트가 있나없나 확인
		List<HashMap<String, Object>> petList = petInfoService.selectPetList(id);
		if (petList.isEmpty()) {
			// 펫리스트가 비어있다면 펫 관련 세션 삭제
			session.removeAttribute("petName");
			session.removeAttribute("petSex");	
			session.removeAttribute("petBirth");
			session.removeAttribute("groomingStart");	
			session.removeAttribute("groomingPeriod");	
		}else if (petInfoService.selectMainPet(id) == null) {
			// 메인펫을 삭제했을경우 첫번째 팻을 메인펫으로 지정
			HashMap<String, Object> params = petInfoService.selectPetList(id).get(0);
			int paramsIdx = (int) params.get("idx");
			RedirectView rv = new RedirectView("mainPetUpdate.do?id="+id+"&idx="+paramsIdx);
			rv.setExposeModelAttributes(true);
			return new ModelAndView(rv);
		}
		//삭제 후 다시 마이펫인포로 리다이렉트
		RedirectView rv = new RedirectView("myPetInfo.do?id=" + id);
		rv.setExposeModelAttributes(true);
		return new ModelAndView(rv);
	}

	@RequestMapping(value = "/PetInfoImage/{fileId}.do", method = { RequestMethod.GET })
	public void imageShow(@PathVariable("fileId") int fileId, HttpServletResponse response)
			throws IOException, SerialException, SQLException {

		HashMap<String, Object> boardfile = petInfoService.selectFile(fileId);

		response.setContentType("images/jpg; utf-8");
		String originFile = (String) boardfile.get("originFileName");
		String filename = new String(originFile.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "inline;filename=\"" + filename + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		OutputStream outputStream = response.getOutputStream();

		File file = new File((String) boardfile.get("uri"));

		FileInputStream inputStream = new FileInputStream(file);

		IOUtils.copy(inputStream, outputStream);

		outputStream.flush();
		outputStream.close();
	}

	@RequestMapping("mainPetUpdate.do")
	public String mainPetUpdate(String id, int idx, HttpSession session) {
		HashMap<String, Object> mainPetOrigin = petInfoService.selectMainPet(id);
		HashMap<String, Object> params = new HashMap<>();
		// 기존 mainPet 있다면 값을 0으로 바꾸고
		if (mainPetOrigin != null) {
			int originIdx = (int) mainPetOrigin.get("idx");
			params.put("idx", originIdx);
			params.put("mainPet", 0);
			petInfoService.updateMainPet(params);
		}
		// 현재 요청받은 idx 정보를 메인펫 1로 지정
		params.put("idx", idx);
		params.put("mainPet", 1);
		petInfoService.updateMainPet(params);
		HashMap<String, Object> mainPet = petInfoService.selectMainPet(id);
		session.setAttribute("petName", mainPet.get("name"));
		session.setAttribute("petSex", mainPet.get("sex"));
		session.setAttribute("petBirth", mainPet.get("birthday"));
		session.setAttribute("fileId", mainPet.get("fileId"));
		session.setAttribute("groomingStart", mainPet.get("groomingStart"));	
		session.setAttribute("groomingPeriod", mainPet.get("groomingPeriod"));
		return "redirect:myPetInfo.do?id="+id;
	}

}