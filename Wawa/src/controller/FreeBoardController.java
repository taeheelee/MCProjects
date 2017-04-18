package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IBoardService;
import interface_service.IRepleService;

@Controller
public class FreeBoardController {
	@Autowired
	private IBoardService boardService;
	@Autowired
	private IRepleService repleService;
	
	@RequestMapping("freeboardMain.do")
	public ModelAndView freeboardList(@RequestParam(defaultValue="1")int page){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardList(page, 6));
		mav.setViewName("freeboard");
		return mav;
	}
	
	@RequestMapping("freeboardWriteForm.do")
	public String freeboardWrite(){
		return "freeboardWrite";
	}
	
	@RequestMapping("freeboardDetail.do")
	public ModelAndView freeboardDetails(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.readBoard(boardIdx);
		List<HashMap<String, Object>> reple = repleService.selectRepleList(boardIdx);
		mav.addObject("board", board);
		mav.addObject("reple", reple);
		mav.setViewName("freeboardDetails");
		return mav;
	}
	
	@RequestMapping("freeboardSearch.do")
	public ModelAndView freeboardSearch(int type, String keyword, @RequestParam(defaultValue="1")int page){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardByTitle(type, keyword, page, 6));
		mav.setViewName("freeboard");
		return mav;
	}
}
