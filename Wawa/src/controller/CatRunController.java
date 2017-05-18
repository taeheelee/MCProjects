package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import interface_service.ICatRunService;

@Controller
public class CatRunController {

	@Autowired
	private ICatRunService catService;
	
	@RequestMapping("catRunMain.do")
	public ModelAndView catRunMain(){
		List<HashMap<String, Object>> list = catService.selectAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("catRun.cat");
		return mav;
	}
	
	@RequestMapping("createCat.do")
	public String createScore(String name, int score){
		catService.insertCat(name, score);
		return "redirect:catRunMain.do";
	}
}
