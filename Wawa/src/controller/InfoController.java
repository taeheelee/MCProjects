package controller;

import java.util.HashMap;
import java.util.List;

import javax.jws.WebParam.Mode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import interface_service.IBoardService;
import model.Board;

@Controller
public class InfoController {
		@Autowired
		private IBoardService boardService;
	
		@RequestMapping("infoMain.do")
		public ModelAndView infoMain(@RequestParam(defaultValue="1") int page, 
				@RequestParam(defaultValue="1") int boardCode){
			ModelAndView mav = new ModelAndView();
			mav.addAllObjects(boardService.getBoardList(page, boardCode));
			mav.setViewName("info"); // -> infoMain찾기
			return mav;
		}
		
		@RequestMapping("infoSearch.do")
		public ModelAndView infoSearch(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			List<HashMap<String, Object>> list = boardService.getBoardByKeyword(params);
			mav.addObject("result", list);
			mav.setViewName("redirect:infoMain.do");
			return mav;
		}
		
		@RequestMapping("infoDetails.do")
		public ModelAndView infoDetails(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
			mav.addObject("result", board);
			mav.setViewName("infoDetails");
			return mav;
		}
		
		@RequestMapping("infoWriteForm.do") // -> writeForm.jsp로 이동
		public void infoWriteForm(){}
		
		@RequestMapping("infoWrite.do") // --> infoWrite.jsp
		public String infoWrite(int boardCode, String title, String category, String content,
				String writer){
			ModelAndView mav = new ModelAndView();
			if(boardService.writeFreeBoard(boardCode, title, category, content, writer)){
				return "redirect:infoMain.do"; // 성공시 메인으로 이동
			}else {
				return "redirect:infoWriteForm.do"; //글쓰기 페이지에 머무름
			}
		}
		
		@RequestMapping("infoGetPetinfo.do")
		public ModelAndView infoGetPetinfo(String id){
			ModelAndView mav = new ModelAndView();
			List<HashMap<String, Object>> list = boardService.getPetInfo(id);
			mav.addObject("result", list);
			mav.setViewName("redirect:infoWriteForm.do");
			return mav;
		}
		
		@RequestMapping("infoUpdateForm.do") // --> 수정화면으로 이동
		public ModelAndView infoUpdateForm(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
			mav.addObject("result", board);
			mav.setViewName("infoUpdateForm");
			return mav;
		}
		
		@RequestMapping("infoUpdate.do")
		public String infoUpdate(int boardIdx, String title, String category, String content,
				String writer){
			boardService.updateFreeBoard(boardIdx, title, category, content, writer);
			return "redirect:infoDetails.do";
		}
		
		@RequestMapping("infoDelete.do")
		public String infoDelete(int boardIdx){
			boardService.deleteBoard(boardIdx);
			return "redirect:infoMain.do";
		}
		
//		@RequestMapping("infoUpdateImage.do")
//		public ModelAndView infoUpdateImage(){
//			
//		}
		
}
