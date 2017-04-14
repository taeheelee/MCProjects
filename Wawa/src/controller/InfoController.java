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

import interface_service.IBoardService;
import model.Board;

@Controller
public class InfoController {
		@Autowired
		private IBoardService boardService;
	
		@RequestMapping("infoMain.do")
		public ModelAndView infoMain(@RequestParam(defaultValue="1") int page, int boardCode){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> list = boardService.getBoardList(page, boardCode);
			mav.addObject("result", list);
			mav.setViewName("info"); // -> infoMain찾기
			return mav;
		}
		
		@RequestMapping("search.do")
		public ModelAndView search(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
			mav.addObject("result", board);
			mav.setViewName("redirect:infoMain.do");
			return mav;
		}
		
		@RequestMapping("viewDetail.do")
		public ModelAndView viewDetail(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
			mav.addObject("result", board);
			mav.setViewName("redirect:infoMain.do");
			return mav;
		}
		
		@RequestMapping("writeForm.do") // -> writeForm.jsp로 이동
		public void writeForm(){}
		
		@RequestMapping("write.do") // --> infoWrite.jsp
		public String write(int boardCode, String title, String category, String content,
				String writer){
			ModelAndView mav = new ModelAndView();
			if(boardService.writeFreeBoard(boardCode, title, category, content, writer)){
				return "redirect:infoMain.do"; // 성공시 메인으로 이동
			}else {
				return "redirect:writeForm.do"; //글쓰기 페이지에 머무름
			}
		}
		
		@RequestMapping("getPetinfo.do")
		public ModelAndView getPetinfo(String id){
			ModelAndView mav = new ModelAndView();
			List<HashMap<String, Object>> list = boardService.getPetInfo(id);
			mav.addObject("result", list);
			mav.setViewName("redirect:writeForm.do");
			return mav;
		}
		
		@RequestMapping("updateForm.do") // --> 수정화면으로 이동
		public ModelAndView updateForm(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
			mav.addObject("result", board);
			mav.setViewName("updateForm");
			return mav;
		}
		
		@RequestMapping("update.do")
		public String update(int boardIdx, String title, String category, String content,
				String writer){
			boardService.updateFreeBoard(boardIdx, title, category, content, writer);
			return "redirect:infoDetail.do";
		}
		
		@RequestMapping("delete.do")
		public String delete(int boardIdx){
			boardService.deleteBoard(boardIdx);
			return "redirect:infoMain.do";
		}
		
		@RequestMapping("updateImage.do")
		public ModelAndView updateImage(){
			
		}
		
}
