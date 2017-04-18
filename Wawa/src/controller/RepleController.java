package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import interface_service.IRepleService;
@Controller
public class RepleController {

	@Autowired
	private IRepleService service;
	
	@RequestMapping("repleWrite.do")
	public String repleWrite(int boardIdx, String nickname, String content, int pIdx){
		service.writeReple(boardIdx, nickname, content, pIdx);
		return "redirect:freeboardDetail.do?boardIdx="+boardIdx;
	}
}
