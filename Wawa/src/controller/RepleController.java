package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import interface_service.IRepleService;
@Controller
public class RepleController {

	@Autowired
	private IRepleService service;
	
	@RequestMapping("boardSelect.do")
	public String boardSelect(int boardCode, int boardIdx){
		String result = null;
		if(boardCode == 1)
			result = "redirect:infoDetails.do?boardIdx="+boardIdx;
		else if(boardCode == 2)
			result = "redirect:reviewDetails.do?boardIdx="+boardIdx;
		else if(boardCode == 3)
			result = "redirect:boastDetails.do?boardIdx="+boardIdx;
		else if(boardCode == 4)
			result = "redirect:lostDetails.do?boardIdx="+boardIdx;
		else if(boardCode == 5)
			result = "redirect:partnerDetails.do?boardIdx="+boardIdx;
		else if(boardCode == 6)
			result = "redirect:freeboardDetail.do?boardIdx="+boardIdx;
		
		return result;
	}
	@RequestMapping("repleWrite.do")
	public String repleWrite(int boardIdx, int boardCode, String nickname, String content, int pIdx){
		service.writeReple(boardIdx, nickname, content, pIdx);
		return "redirect:boardSelect.do?boardIdx="+boardIdx+"&boardCode="+boardCode;
	}
	
	@RequestMapping("repleUpdate.do")
	public String repleUpdate(int boardIdx, int boardCode, int repleIdx, String content){
		service.updateReple(repleIdx, content);
		return "redirect:boardSelect.do?boardIdx="+boardIdx+"&boardCode="+boardCode;
	}
}
