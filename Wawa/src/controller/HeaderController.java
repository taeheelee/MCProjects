package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HeaderController {
	@RequestMapping("header.do")
	public ModelAndView header(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("fileId", 3);
		mav.setViewName("header.header");
		return mav;
	}
	

}
