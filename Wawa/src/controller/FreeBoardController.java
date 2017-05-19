package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	//자유게시판 메인
	@RequestMapping("freeboardMain.do")
	public ModelAndView freeboardList(@RequestParam(defaultValue="1")int page){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardList(page, 6));
		mav.setViewName("freeboard.tiles");
		return mav;
	}
	
	//자유게시판 게시글 검색
	@RequestMapping("freeboardSearch.do")
	public ModelAndView freeboardSearch(String category, int type, String keyword, @RequestParam(defaultValue="1")int page){
		ModelAndView mav = new ModelAndView();
		if(category.equals("1"))
			category = "애견상식";
		else if(category.equals("2"))
			category = "훈련정보";
		else if(category.equals("3"))
			category = "애견간식레시피";
		else if(category.equals("4"))
			category = "기타";
		else if(category.equals("0"))
			category = "";
		mav.addAllObjects(boardService.searchBoard(category, type, keyword, page, 6));
		mav.setViewName("freeboard.tiles");
		return mav;
	}
	
	//자유게시판 게시글 상세보기
	@RequestMapping("freeboardDetail.do")
	public ModelAndView freeboardDetails(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.readBoard(boardIdx);
		List<HashMap<String, Object>> reple = repleService.selectRepleList(boardIdx);
		mav.addObject("board", board);
		mav.addObject("reple", reple);
		mav.setViewName("freeboardDetails.tiles");
		return mav;
	}
	
	//자유게시판 글쓰기 폼
	@RequestMapping("freeboardWriteForm.do")
	public String freeboardWriteForm(){
		return "freeboardWrite.tiles";
	}
	
	//자유게시판 글쓰기
	@RequestMapping("freeboardWrite.do")
	public String freeboardWrite(int boardCode, String title, String category, String content, String writer){
		if(category.equals("1"))
			category = "애견상식";
		else if(category.equals("2"))
			category = "훈련정보";
		else if(category.equals("3"))
			category = "애견간식레시피";
		else if(category.equals("4"))
			category = "기타";
		boardService.writeFreeBoard(boardCode, title, category, content, writer);
		return "redirect:freeboardMain.do";
	}
	
	//자유게시판 게시글 수정 폼
	@RequestMapping("freeboardUpdateForm.do") 
	public ModelAndView infoUpdateForm(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("board", board);
		mav.setViewName("freeboardUpdateForm.tiles");
		return mav;
	}
	
	//자유게시판 게시글 수정하기
	@RequestMapping("freeboardUpdate.do")
	public String infoUpdate(int boardIdx, String title, String category, String content,
			String writer, int readCount){
		if(category.equals("1"))
			category = "애견상식";
		else if(category.equals("2"))
			category = "훈련정보";
		else if(category.equals("3"))
			category = "애견간식레시피";
		else if(category.equals("4"))
			category = "기타";
		
		boardService.updateFreeBoard(boardIdx, title, category, content, writer, readCount);
		return "redirect:freeboardMain.do";
	}
	
	//자유게시판 게시글 삭제
	@RequestMapping(value="freeboardDelete.do", method = {RequestMethod.POST})
	public String infoDelete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:freeboardMain.do";
	}
		
}
