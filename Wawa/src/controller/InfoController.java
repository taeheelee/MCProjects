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
import interface_service.IRepleService;
import model.Board;

@Controller
public class InfoController {
		@Autowired
		private IBoardService boardService;
		@Autowired
		private IRepleService repleService;
	
		@RequestMapping("infoMain.do")
		public ModelAndView infoMain(@RequestParam(defaultValue="1") int page, 
				@RequestParam(defaultValue="1") int boardCode){
			ModelAndView mav = new ModelAndView();
			mav.addAllObjects(boardService.getBoardList(page, boardCode));
			mav.setViewName("info.tiles"); // -> infoMain찾기
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
		public ModelAndView infoDetails(int boardIdx){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.readBoard(boardIdx);
			List<HashMap<String, Object>> reple = repleService.selectRepleList(boardIdx);
			mav.addObject("board", board);
			mav.addObject("reple", reple);
			mav.setViewName("infoDetails.tiles");
			return mav;
		}
		
		@RequestMapping("infoWriteForm.do") // -> writeForm.jsp로 이동
		public String infoWriteForm(){
			return "infoWriteForm.tiles";
		}
		
		@RequestMapping("infoWrite.do") // --> infoWrite.jsp
		public String infoWrite(int boardCode, String title, String category, String content,
				String writer){
			if(category.equals("1"))
				category = "애견상식";
			else if(category.equals("2"))
				category = "훈련정보";
			else if(category.equals("3"))
				category = "애견간식레시피";
			else if(category.equals("4"))
				category = "기타";
			boardService.writeFreeBoard(boardCode, title, category, content, writer);
				return "redirect:infoMain.do"; // 성공시 메인으로 이동
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
		public ModelAndView infoUpdateForm(int boardIdx){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
			mav.addObject("board", board);
			mav.setViewName("infoUpdateForm.tiles");
			return mav;
		}
		
		@RequestMapping("infoUpdate.do")
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
			return "redirect:infoMain.do";
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
