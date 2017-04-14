package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {
	@RequestMapping("map.do")
	public ModelAndView hello(String type, String local, String addr ){
		
		ModelAndView mav = new ModelAndView();
		String result = local + addr + type;
		mav.addObject("result", result);
		mav.setViewName("map_result");
		return mav;
	}
}