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
public class PartnerController {

	@Autowired
	private IBoardService boardService;
	
	@RequestMapping("partnerMain.do")
	public ModelAndView partnerMain(@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="5") int boardCode){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardList(page, boardCode));
		mav.setViewName("partner");
		return mav;
	}
	
	@RequestMapping("partnerSearch.do") // 수컷/암컷(강아지성별) + 강아지 이름으로 검색  
	public ModelAndView partnerSearch(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("redirect:partnerMain.do");
		return mav;
	}
	
	@RequestMapping("partnerDetails.do")
	public ModelAndView partnerDetails(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("boastDetails");
		return mav;
	}
	
	@RequestMapping("partnerWriteForm.do")
	public void partnerWriteForm(){}
	
	@RequestMapping("partnerWrite.do")
	public String partnerWrite(int boardCode, String name, String kind, 
			String sex, int age, double weight, String phone, String email, 
			String title, String content, String writer){
		ModelAndView mav = new ModelAndView();
		if(boardService.writePartnerFindBoard(boardCode, name, kind, sex, age, 
				weight, phone, email, title, content, writer)){
			return "redirect:partnerMain.do";
		}else {
			return "redirect:partnerWriteForm.do";
		}
	}
	
	@RequestMapping("partnerConform.do")
	public String partnerConform(HashMap<String, Object> params){
		if(boardService.identifyUser(params)){
			return ""; // 본인 맞음
		}else {
			return ""; //본인 아님
		}
	}
	
	@RequestMapping("partnerGetPetinfo.do")
	public ModelAndView partnerGetPetinfo(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = boardService.getPetInfo(id);
		mav.addObject("result", list);
		mav.setViewName("redirect:partnerWriteForm.do");
		return mav;
	}
	
	@RequestMapping("partnerUpdateForm.do")
	public ModelAndView partnerUpdateForm(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("partnerUpdateForm");
		return mav;
	}
	
	@RequestMapping("partnerUpdate.do")
	public String partnerUpdate(int boardIdx, String name, String kind, String sex, 
			int age, double weight, String phone, String email, String content, String writer){
		boardService.updatePartnerFindBoard(boardIdx, name, kind, sex, 
				age, weight, phone, email, content, writer);
		return "redirect:partnerMain.do";
	}
	
	@RequestMapping("partnerDelete.do")
	public String partnerDelete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:parnerMain.do";
	}
	
//	@RequestMapping("partnerUploadImage.do")
//	public ModelAndView partnerUploadImage(){
//		
//	}
	
}
