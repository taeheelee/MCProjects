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
import model.Board;

@Controller
public class BoastController {
	@Autowired
	private IBoardService boardService;
	
	@RequestMapping("boastMain.do")
	public ModelAndView boastMain(@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="3") int boardCode){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardList(page, boardCode));
		mav.addObject("boardCode", boardCode);
		mav.setViewName("boast");
		return mav;
	}
	
	@RequestMapping("increaseLike.do")
	public String increaseLike(int boardIdx){
		boardService.increaseBoastNum(boardIdx);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("boastSearch.do")
	public ModelAndView boastSearch(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("result", board);
		mav.setViewName("redirect:boastMain.do");
		return mav;
	}
	
	@RequestMapping("boastDetails.do")
	public ModelAndView boastDetails(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("result", board);
		mav.setViewName("boastDetails");
		return mav;
	}
	
	@RequestMapping("boastWriteForm.do") //writeForm.jsp로
	public ModelAndView boastWriteForm(@RequestParam(defaultValue="3") int boardCode){
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardCode", boardCode);
		return mav;
	}
	
	@RequestMapping("boastWrite.do")
	public String boastWrite(@RequestParam(defaultValue="3") int boardCode, String name, int age, String sex, 
			String title, String summernote, String writer){
		ModelAndView mav = new ModelAndView();
		if(boardService.writeBoastBoard(boardCode, name, age, sex, title, summernote, writer)){
			return "redirect:boastMain.do";
		}else {
			return "redirect:boastWriteForm.do";
		}
	}
	
	@RequestMapping("boastUpdateForm.do")
	public ModelAndView boastUpdateForm(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("result", board);
		mav.setViewName("boastUpdateForm");
		return mav;	
	}
	
	@RequestMapping("boastUpdate.do")
	public String boastUpdate(int boardIdx, String name, int age, String sex, String summernote, String writer){
		boardService.updateBoastBoard(boardIdx, name, age, sex, summernote, writer);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("boastDelete.do")
	public String boastDelete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:boastMain.do";
	}
	
//	@RequestMapping("boastUploadImage.do")
//	public ModelAndView boastUploadImage(){
//		
//	}
	
	@RequestMapping("boastGetPetinfo.do")
	public ModelAndView boastGetPetinfo(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = boardService.getPetInfo(id);
		mav.addObject("result", list);
		mav.setViewName("redirect:boastWriteForm.do");
		return mav;
	}
	
}
