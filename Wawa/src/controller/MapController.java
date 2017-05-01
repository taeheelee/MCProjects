package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {
	@RequestMapping(method=RequestMethod.POST, value="search.do")
	public  ModelAndView search(String type, String area, String county, String search){
		ModelAndView mav = new ModelAndView();
		
		String result = area + " " + county + " " + type + " " + search;
		if(result.equals("null null null null"))
			result = "서울 강남구 동물병원";
			mav.addObject("result", result); 
		mav.setViewName("map_location.tiles");
		return mav; 
	}
	
}
