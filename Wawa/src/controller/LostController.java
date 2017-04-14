package controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;

import interface_service.IBoardService;

@Controller
public class LostController {

	@Autowired
	private IBoardService boardService;
	
	@RequestMapping("lostMain.do")
	public ModelAndView lostMain(@RequestParam(defaultValue="1") int page, int boardCode){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> list = boardService.getBoardList(page, boardCode);
		mav.addObject("result", list);
		mav.setViewName("lost");
		return mav;
	}
	
	@RequestMapping("search.do")
	public ModelAndView search(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("lostMain.do");
		return mav;
	}
	
	@RequestMapping("viewDetail.do")
	public ModelAndView viewDetail(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("redirect:lostMain.do");
		return mav;
	}
	
	@RequestMapping("writeForm.do")
	public void WriteForm(){}
	
	@RequestMapping("write.do")
	public String write(int boardCode, String category, String name,
			String resist, String lostdate, String kind, String sex, int age, double weight,
			String phone, String email, String content, String writer){
		ModelAndView mav = new ModelAndView();
		if(boardService.writeDogFindBoard(boardCode, category, name, resist, lostdate, 
				kind, sex, age, weight, phone, email, content, writer)){
				return "redirect:lostMain.do";
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
	public String update(int boardIdx, String category, String name, String resist, 
			String lostdate, String kind, String sex, int age, double weight, String phone,
			String email, String content, String writer){
		boardService.updateDogFindBoard(boardIdx, category, name, resist, lostdate, 
				kind, sex, age, weight, phone, email, content, writer);
		return "redirect:lostMain.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:lostMain.do";	
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
