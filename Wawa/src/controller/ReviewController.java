package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import interface_service.IBoardService;

@Controller
public class ReviewController {

	@Autowired
	private IBoardService boardService;
	
	@RequestMapping("reviewMain.do")
	public ModelAndView reviewMain(@RequestParam(defaultValue="1") int page, 
			@RequestParam(defaultValue="2") int boardCode){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardList(page, boardCode));
		mav.addObject("boardCode", boardCode);
		mav.setViewName("review.tiles");
		return mav;
	}
	
	@RequestMapping("reviewSearch.do")
	public ModelAndView reviewSearch(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = boardService.getBoardByKeyword(params);
		mav.addObject("result", list);
		mav.setViewName("redirect:reviewMain.do");
		return mav;
	}
	
	@RequestMapping("reviewDetails.do")
	public ModelAndView reviewDetails(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("reviewDetails.tiles");
		return mav;
	}
	
	@RequestMapping("reviewWriteForm.do")
	public String reviewWriteForm(){
		return "reviewWriteForm.tiles";
	}
	
	@RequestMapping("reviewWrite.do")
	public String reviewWrite(int boardCode, String title, String category, 
			int starPoint, String content, String writer){
		ModelAndView mav = new ModelAndView();
		if(boardService.writeReviewBoard(boardCode, title, category, starPoint, content, writer)){
			return "redirect:reviewMain.do";
		}else {
			return "redirect:reviewWriteForm.do";
		}
	}
	
	@RequestMapping("reviewUpdateForm.do")
	public ModelAndView reviewUpdateForm(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("reviewUpdateForm.tiles");
		return mav;
	}
	
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate(int boardIdx, String title, String category, int starPoint, String content, String writer){
		boardService.updateReviewBoard(boardIdx, title, category, starPoint, content, writer);
		return "redirect:reviewMain.do";
	}
	
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:reviewMain.do";
	}
	
//	@RequestMapping("reviewUploadImage.do")
//	public ModelAndView reviewUploadImage(){
//		
//	}
	
	@RequestMapping("reviewGetPetinfo.do")
	public ModelAndView reviewGetPetinfo(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = boardService.getPetInfo(id);
		mav.addObject("result", list);
		mav.setViewName("redirect:reviewWriteForm.do");
		return mav;
	}
	
	@RequestMapping("reviewConform") //본인확인
	public String reviewConform(HashMap<String, Object> params){
		if(boardService.identifyUser(params)){
			return ""; // 본인 맞음
		}else {
			return ""; //본인 아님
		}
	}

}
