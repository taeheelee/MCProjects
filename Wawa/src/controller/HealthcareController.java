package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IManagementService;
import interface_service.IPetinfoService;

@RestController
public class HealthcareController {

	@Autowired
	private IPetinfoService petinfoService;
	@Autowired
	private IManagementService managementService;
	
//	@RequestMapping("healthcare.do")
//	public ModelAndView healthcare(HttpSession session){
//		ModelAndView mav = new ModelAndView();
//		String id = session.getAttribute("id").toString();
//		HashMap<String, Object> idxList = new HashMap<>();
//		HashMap<String, Object> weightList = new HashMap<>();
////		System.out.println(id);
//		List<HashMap<String, Object>> petinfo = petinfoService.selectPetList(id);
//		int i = 1;
//		for(HashMap<String, Object> params : petinfo) {
////			System.out.println((int)params.get("idx"));
//			idxList.put(("pet"+i), (int) params.get("idx"));
//			i++;
//		}
////		System.out.println("idxSize : " + idxList.size());
//		for(int j = 1; j <= idxList.size(); j++) {
//			weightList.put("pet" + j, managementService.selectList((int)idxList.get("pet"+j)));
//		} //managementService.selectList는 management 객체 리스트를 반환함
//		
//		for(int j = 1; j <= weightList.size(); j++) {
//			System.out.println(weightList.get("pet" + j).toString());
//		}
//		mav.addObject("weightList", weightList);
//		mav.setViewName("healthcare.tiles");
//		return mav;
//	}
	
	@RequestMapping("healthcare.do")
	public ModelAndView healthcare(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String id = session.getAttribute("id").toString();
		
//		mav.addObject("weightList", weightList);
//		mav.setViewName("healthcare.tiles");
//		return mav;
	}
}
