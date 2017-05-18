package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class footerController {

	
	@RequestMapping("wawaLocation.do")
	public String wawaLocation() {
		return "wawaLocation.tiles";
	}
	@RequestMapping("wawaMembership.do")
	public String wawawawaMembership() {
		return "wawaMembershipClause.tiles";
	}
	@RequestMapping("wawaPersonalInformation.do")
	public String wawaPersonalInformation() {
		return "wawaPersonalInformation.tiles";
	}
	@RequestMapping("wawaTeamMember.do")
	public String wawaTeamMember() {
		return "wawaTeamMember.tiles";
	}
}     