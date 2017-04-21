package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {
	@RequestMapping("map.do")
	public  ModelAndView hello(@RequestParam(defaultValue="동물병원")String type,
			@RequestParam(defaultValue="서울")String area, @RequestParam(defaultValue="강남구")String county ){
		ModelAndView mav = new ModelAndView();
		
		String result = area + county + type;
		System.out.println(result);
		mav.addObject("result", result); 
		
		mav.setViewName("map_location.tiles");
		return mav; 
	}
	
}
