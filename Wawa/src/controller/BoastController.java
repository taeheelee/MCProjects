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
	
	@RequestMapping("search.do")
	public ModelAndView search(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("redirect:boastMain.do");
		return mav;
	}
	
	@RequestMapping("viewDetail.do")
	public ModelAndView viewDetail(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("redirect:boastMain.do");
		return mav;
	}
	
	@RequestMapping("writeForm.do") //writeForm.jsp로
	public void writeForm(){}
	
	@RequestMapping("write.do")
	public String write(int boardCode, String name, int age, String sex, 
			String content, String writer){
		ModelAndView mav = new ModelAndView();
		if(boardService.writeBoastBoard(boardCode, name, age, sex, content, writer)){
			return "redirect:boastMain.do";
		}else {
			return "redirect:writeForm.do";
		}
	}
	
	@RequestMapping("updateForm.do")
	public ModelAndView updateForm(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("updateForm");
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(int boardIdx, String name, int age, String sex, String content, String writer){
		boardService.updateBoastBoard(boardIdx, name, age, sex, content, writer);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("uploadImage.do")
	public ModelAndView uploadImage(){
		
	}
	
	@RequestMapping("getPetinfo.do")
	public ModelAndView getPetinfo(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = boardService.getPetInfo(id);
		mav.addObject("result", list);
		mav.setViewName("redirect:writeForm.do");
		return mav;
	}
	
}
