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
import interface_service.IRepleService;

@Controller
public class ReviewController {

	@Autowired
	private IBoardService boardService;
	@Autowired
	private IRepleService repleService;
	
	@RequestMapping("reviewMain.do")
	public ModelAndView reviewMain(@RequestParam(defaultValue="1") int page, 
			@RequestParam(defaultValue="2") int boardCode){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardList(page, boardCode));
		mav.setViewName("review.tiles");
		return mav;
	}
	
	@RequestMapping("reviewSearch.do")
	public ModelAndView reviewSearch(String category, int type, String keyword, @RequestParam(defaultValue="1")int page){
		ModelAndView mav = new ModelAndView();
		if(category.equals("1"))
			category = "사료";
		else if(category.equals("2"))
			category = "간식";
		else if(category.equals("3"))
			category = "영양제/건강/위생";
		else if(category.equals("4"))
			category = "목욕/미용";
		else if(category.equals("5"))
			category = "식기/배변";
		else if(category.equals("6"))
			category = "장난감/하우스/이동장";
		else if(category.equals("7"))
			category = "패션/줄/인식표";
		else if(category.equals("8"))
			category = "기타";
		else if(category.equals("0"))
			category = "";
		
		mav.addAllObjects(boardService.searchBoard(category, type, keyword, page, 2));
		mav.setViewName("review.tiles");
		return mav;
	}
	
	@RequestMapping("reviewDetails.do")
	public ModelAndView reviewDetails(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.readBoard(boardIdx);
		List<HashMap<String, Object>> reple = repleService.selectRepleList(boardIdx);
		mav.addObject("board", board);
		mav.addObject("reple", reple);
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
		if(category.equals("1"))
			category = "사료";
		else if(category.equals("2"))
			category = "간식";
		else if(category.equals("3"))
			category = "영양제/건강/위생";
		else if(category.equals("4"))
			category = "목욕/미용";
		else if(category.equals("5"))
			category = "식기/배변";
		else if(category.equals("6"))
			category = "장난감/하우스/이동장";
		else if(category.equals("7"))
			category = "패션/줄/인식표";
		else if(category.equals("8"))
			category = "기타";
		boardService.writeReviewBoard(boardCode, title, category, starPoint, content, writer);
			return "redirect:reviewMain.do";
		
	}
	
	@RequestMapping("reviewUpdateForm.do")
	public ModelAndView reviewUpdateForm(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("board", board);
		mav.setViewName("reviewUpdateForm.tiles");
		return mav;
	}
	
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate(int boardIdx, String title, String category, int starPoint, String content, String writer, int readCount){
		if(category.equals("1"))
			category = "사료";
		else if(category.equals("2"))
			category = "간식";
		else if(category.equals("3"))
			category = "영양제/건강/위생";
		else if(category.equals("4"))
			category = "목욕/미용";
		else if(category.equals("5"))
			category = "식기/배변";
		else if(category.equals("6"))
			category = "장난감/하우스/이동장";
		else if(category.equals("7"))
			category = "패션/줄/인식표";
		else if(category.equals("8"))
			category = "기타";
		
		boardService.updateReviewBoard(boardIdx, title, category, starPoint, content, writer, readCount);
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
		
	@RequestMapping("reviewConform") //본인확인
	public String reviewConform(HashMap<String, Object> params){
		if(boardService.identifyUser(params)){
			return ""; // 본인 맞음
		}else {
			return ""; //본인 아님
		}
	}

}
