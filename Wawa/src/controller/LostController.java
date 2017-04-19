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
	public ModelAndView lostMain(@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="4") int boardCode){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardList(page, boardCode));
		mav.addObject("boardCode", boardCode);
		mav.setViewName("lost");
		return mav;
	}
	
	@RequestMapping("lostSearch.do")
	public ModelAndView lostSearch(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("lostMain.do");
		return mav;
	}
	
	@RequestMapping("lostDetails.do")
	public ModelAndView lostDetails(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("lostDetails");
		return mav;
	}
	
	@RequestMapping("lostWriteForm.do")
	public void lostWriteForm(){}
	
	@RequestMapping("lostWrite.do")
	public String lostWrite(int boardCode, String category, String name,
			String resist, String lostdate, String kind, String sex, int age, double weight,
			String phone, String email, String title, String content, String writer){
		ModelAndView mav = new ModelAndView();
		if(boardService.writeDogFindBoard(boardCode, category, name, resist, lostdate, 
				kind, sex, age, weight, phone, email, title, content, writer)){
				return "redirect:lostMain.do";
		}else {
			return "redirect:lostWriteForm.do";
		}
	}
	
	@RequestMapping("lostUpdateForm.do")
	public ModelAndView lostUpdateForm(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("lostUpdateForm");
		return mav;
	} 
	
	@RequestMapping("lostUpdate.do")
	public String lostUpdate(int boardIdx, String category, String name, String resist, 
			String lostdate, String kind, String sex, int age, double weight, String phone,
			String email, String content, String writer){ // 등록번호 추가 petname으로 수정 + petidx추가
		boardService.updateDogFindBoard(boardIdx, category, name, resist, lostdate, 
				kind, sex, age, weight, phone, email, content, writer);
		return "redirect:lostMain.do";
	}
	
	@RequestMapping("lostDelete.do")
	public String lostDelete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:lostMain.do";	
	}

//	@RequestMapping("lostUploadImage.do")
//	public ModelAndView lostUploadImage(){
//		
//	}
	
	@RequestMapping("lostGetPetinfo.do")
	public ModelAndView lostGetPetinfo(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = boardService.getPetInfo(id);
		mav.addObject("result", list);
		mav.setViewName("redirect:lostWriteForm.do");
		return mav;
	}
	
}
