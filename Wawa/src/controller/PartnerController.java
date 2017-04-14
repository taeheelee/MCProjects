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
public class PartnerController {

	@Autowired
	private IBoardService boardService;
	
	@RequestMapping("partnerMain.do")
	public ModelAndView partnerMain(@RequestParam(defaultValue="1") int page, int boardCode){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> list = boardService.getBoardList(page, boardCode);
		mav.addObject("result", list);
		mav.setViewName("partner");
		return mav;
	}
	
	@RequestMapping("search.do")
	public ModelAndView search(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("redirect:partnerMain.do");
		return mav;
	}
	
	@RequestMapping("viewDetail.do")
	public ModelAndView viewDetail(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("redirect:partnerMain.do");
		return mav;
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(){}
	
	@RequestMapping("write.do")
	public String write(int boardCode, String name, String kind, 
			String sex, int age, double weight, String phone, String email, 
			String content, String writer){
		ModelAndView mav = new ModelAndView();
		if(boardService.writePartnerFindBoard(boardCode, name, kind, sex, age, 
				weight, phone, email, content, writer)){
			return "redirect:partnerMain.do";
		}else {
			return "redirect:writeForm.do";
		}
	}
	
	@RequestMapping("conform.do")
	public ModelAndView conform(HashMap<String, Object> params){
	
	}
	
	@RequestMapping("getPetinfo.do")
	public ModelAndView getPetinfo(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = boardService.getPetInfo(id);
		mav.addObject("result", list);
		mav.setViewName("redirect:writeForm.do");
		return mav;
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
	public String updatePartner(int boardIdx, String name, String kind, String sex, 
			int age, double weight, String phone, String email, String content, String writer){
		boardService.updatePartnerFindBoard(boardIdx, name, kind, sex, 
				age, weight, phone, email, content, writer);
		return "redirect:partnerMain.do";
	}
	
	@RequestMapping("deletePartner.do")
	public String deletePartner(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:parnerMain.do";
	}
	
	@RequestMapping("uploadImage.do")
	public ModelAndView uploadImage(){
		
	}
	
}
