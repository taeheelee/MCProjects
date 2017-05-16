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
	public ModelAndView myPetInfo(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> petList = petInfoService.selectPetList(id);
		mav.addObject("petList", petList);
		mav.setViewName("myPetInfo.tiles");
		return mav;
	}
	@RequestMapping("addPetForm.do")
	public ModelAndView addPetForm(){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> kindList = dogKindService.selectAllDogKind();
		mav.addObject("kindList", kindList);
		mav.setViewName("addPetForm.tiles");
		return mav;
	}
	/*@RequestMapping("addPetForm.do")
	public String addPetForm(){
		return "addPetForm.tiles";
	}*/
	
	@RequestMapping("addPet.do")
	public String addPet(String resist, String id, String name, String kind, 
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
		boolean result = petInfoService.insertPetInfo(0, resist, id,
				name, kind, tobirth, neutral, weight, 
				sex, toGs, groomingPeriod, mainPet, ufile);
		if(result){
			//만약 세션이 비어있다면 addPet하고 세션에 등록
			if(session.getAttribute("petName") == null){
				session.setAttribute("petName", name);
				session.setAttribute("petSex", sex);	
				session.setAttribute("petBirth", fromBirth);
				session.setAttribute("groomingStart", groomingStart);	
				session.setAttribute("groomingPeriod", groomingPeriod);
			}
			return "redirect:main.do";			
		}else {
			return "redirect:addPetForm.do";
		}
	}
	
	@RequestMapping("updatePetForm.do")
	   public ModelAndView updatePetForm(int idx){
	      ModelAndView mav = new ModelAndView();
	      //일단 펫리스트를 가져와
	      System.out.println("updateForm에서의 idx : "+ idx);
	      HashMap<String, Object> petInfo = petInfoService.selectOne(idx);
	      mav.addAllObjects(petInfo);
	      System.out.println("petInfo : "+petInfo);
	      
	      List<HashMap<String, Object>> kindList = dogKindService.selectAllDogKind();
	      mav.addObject("kindList", kindList);
	      mav.setViewName("updatePetForm.tiles");
	      
	      return mav;
	   }
	   
		
	   @RequestMapping("updatePet.do")
	   public String updatePet(int idx, String resist, String id, String name, String kind, 
	         String birthday, String neutral, double weight, String sex, 
	         String groomingStart, String groomingPeriod, HttpSession session,
	         @RequestParam(defaultValue="0")int mainPet ,@RequestParam("ufile") MultipartFile ufile){
	      System.out.println("여기에서 idx받아오는지 확인해야 함 : "+ idx);
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
	      
//	      int idxInt = Integer.parseInt(idx);
	      
	      boolean result = petInfoService.updatePetInfo(idx, resist, id, name, kind, 
	            tobirth, neutral, weight, sex, toGs, groomingPeriod, mainPet, ufile);
	      if(result){
	         //만약 세션이 비어있다면 addPet하고 세션에 등록
	         if(session.getAttribute("petName") == null){
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
	public
	@ResponseBody HashMap<String, Object> selectPet(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> response = new HashMap<>();
		HashMap<String, Object> pet = petInfoService.selectByname(params);
		response.put("pet", pet);
		return response;
	}
	
	@RequestMapping("getAge.do")
	public 
	@ResponseBody HashMap<String, Object> getAge(HttpServletResponse resp,
			@RequestParam HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		HashMap<String, Object> petAge = petInfoService.getAge(params);
		return petAge;
	}
	@RequestMapping("deletePet.do")
	public ModelAndView deletePet(String id, int idx, String resist, HttpSession session, RedirectAttributes redirectAttr){
		ModelAndView mav = new ModelAndView();
		//등록번호가 일치하는지
		if(petInfoService.selectOne(idx).get("resist").equals(resist)){
			//일치하면 펫 삭제
			petInfoService.deletePetInfo(idx);
			redirectAttr.addFlashAttribute("isDel", "펫 정보가 삭제 되었습니다.");
			
		}else{
			redirectAttr.addFlashAttribute("isDel", "펫 정보 삭제 오류");
		}
		//펫 삭제 후 일단 펫리스트가 있나없나 확인
		List<HashMap<String, Object>> petList = petInfoService.selectPetList(id);
		if(petList.isEmpty()){
			//펫리스트가 비어있다면 펫 관련 세션 삭제
			session.removeAttribute("petName");
			session.removeAttribute("petSex");	
			session.removeAttribute("petBirth");
			session.removeAttribute("groomingStart");	
			session.removeAttribute("groomingPeriod");	
		}
		//삭제 후 다시 마이펫인포로 리다이렉트
		RedirectView rv = new RedirectView("myPetInfo.do?id=" + id);
		rv.setExposeModelAttributes(true);
		return new ModelAndView(rv);
	}
	
	@RequestMapping(value = "/PetInfoImage/{fileId}.do", method = {RequestMethod.GET})
	public void imageShow(@PathVariable("fileId") int fileId, HttpServletResponse response) throws IOException, SerialException, SQLException {
	
		HashMap<String, Object> boardfile = petInfoService.selectFile(fileId);
		
		response.setContentType("images/jpg; utf-8");
		String originFile = (String)boardfile.get("originFileName");
		String filename = new String(originFile.getBytes("UTF-8"),"ISO-8859-1");
		response.setHeader("Content-Disposition", "inline;filename=\"" + filename + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream outputStream = response.getOutputStream();
	
		File file = new File((String)boardfile.get("uri"));
	
		FileInputStream inputStream = new FileInputStream(file);
	
		IOUtils.copy(inputStream, outputStream);
	
		outputStream.flush();
		outputStream.close();
	}
	
	@RequestMapping("mainPetUpdate.do")
	public String mainPetUpdate(){
			
		return "redirect:myPetInfo.do?";
	}
	
}