package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class footerController {

	
	@RequestMapping("wawaLocation.do")
	public String wawaLocation() {
		return "wawaLocation.tiles";
	}
}
