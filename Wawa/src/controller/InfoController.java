package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IBoardService;

@Controller
public class InfoController {
		@Autowired
		private IBoardService boardService;
	
		@RequestMapping("infoMain.do")
		public ModelAndView infoMain(int page, int boardCode){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> list
				= boardService.getBoardList(page, boardCode);
			mav.addObject("result", list);
			mav.setViewName("infoMain"); // -> infoMain찾기
			return mav;
		}
		
		@RequestMapping("search.do")
		public ModelAndView search(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
			mav.addObject("result", board);
			mav.setViewName("infoMain.do");
			return mav;
		}
		
		@RequestMapping("viewDetail.do")
		public ModelAndView viewDetail(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
			mav.addObject("result", board);
			mav.setViewName("infoMain.do");
			return mav;
		}
		
		@RequestMapping("write.do")
		public ModelAndView write(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			boolean result = boardService.up
		}
		
		// ========== 게시판 메인
		
		@RequestMapping("infoDetail.do")
		public ModelAndView infoDetail(HashMap<String, Object> params){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
			mav.addObject("result", board);
			mav.setViewName("infoDetail"); //infoDetail html 생성
			return mav;
		}
		
		public ModelAndView update(){
			ModelAndView mav = new ModelAndView();
		}
		
		public ModelAndView delete(){
			
		}
		
	
		// =============== 게시판 상세보기
		
		@RequestMapping("infowrite.do")
		public ModelAndView infoWrite(){
			
		}
		
		@RequestMapping("submit.do")
		public ModelAndView submit(){
			
		}
		
		@RequestMapping("uploadImage.do")
		public ModelAndView uploadImage(){
			
		}
		
		@RequestMapping("getInfo.do")
		public ModelAndView getInfo(){
			
		}
		
		
		// ============== 글쓰기
		
		@RequestMapping("infoUpdate.do")
		public ModelAndView infoUpdate(){
			
		}
	
		
		@RequestMapping("updateImage.do")
		public ModelAndView updateImage(){
			
		}
		
		
	
		// ===== 글수정
}
