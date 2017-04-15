package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IBoardService;

@Controller
public class BoastController {
	@Autowired
	private IBoardService boardService;
	
	@RequestMapping("boastMain.do")
	public ModelAndView boastMain(@RequestParam(defaultValue="1") int page, int boardCode){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> list = boardService.getBoardList(page, boardCode);
		mav.addObject("result", list);
		mav.setViewName("boast");
		return mav;
	}
	
	@RequestMapping("boastSearch.do")
	public ModelAndView search(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("redirect:boastMain.do");
		return mav;
	}
	
	@RequestMapping("boastDetails.do")
	public ModelAndView boastDetails(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("boastDetails");
		return mav;
	}
	
	@RequestMapping("boastWriteForm.do") //writeForm.jsp로
	public void boastWriteForm(){}
	
	@RequestMapping("boastWrite.do")
	public String boastWrite(int boardCode, String petname, int petage, String petsex, 
			String title, String content, String writer){
		ModelAndView mav = new ModelAndView();
		if(boardService.writeBoastBoard(boardCode, petname, petage, petsex, title, content, writer)){
			return "redirect:boastMain.do";
		}else {
			return "redirect:boastWriteForm.do";
		}
	}
	
	@RequestMapping("boastUpdateForm.do")
	public ModelAndView boastUpdateForm(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("boastUpdateForm");
		return mav;
	}
	
	@RequestMapping("boastUpdate.do")
	public String boastUpdate(int boardIdx, String name, int age, String sex, String content, String writer){
		boardService.updateBoastBoard(boardIdx, name, age, sex, content, writer);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("boastDelete.do")
	public String boastDelete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("boastUploadImage.do")
	public ModelAndView boastUploadImage(){
		
	}
	
	@RequestMapping("boastGetPetinfo.do")
	public ModelAndView boastGetPetinfo(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = boardService.getPetInfo(id);
		mav.addObject("result", list);
		mav.setViewName("redirect:boastWriteForm.do");
		return mav;
	}
	
}
