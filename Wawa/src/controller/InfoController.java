package controller;

import java.util.HashMap;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import interface_service.IBoardService;
import interface_service.IMemberService;
import interface_service.IRepleService;
import model.Board;

@Controller
public class InfoController {
		@Autowired
		private IBoardService boardService;
		@Autowired
		private IRepleService repleService;
		@Autowired
		private IMemberService memberService;
	
		//애견정보 게시판 메인
		@RequestMapping("infoMain.do")
		public ModelAndView infoMain(@RequestParam(defaultValue="1") int page, 
				@RequestParam(defaultValue="1") int boardCode){
			ModelAndView mav = new ModelAndView();
			mav.addAllObjects(boardService.getBoardList(page, boardCode));
			mav.setViewName("info.tiles"); 
			return mav;
		}
		
		//애견정보 게시글 검색
		@RequestMapping("infoSearch.do")
		public ModelAndView infoSearch(String category, int type, String keyword, @RequestParam(defaultValue="1")int page){
			ModelAndView mav = new ModelAndView();
			if(category.equals("1"))
				category = "애견상식";
			else if(category.equals("2"))
				category = "훈련정보";
			else if(category.equals("3"))
				category = "애견간식레시피";
			else if(category.equals("4"))
				category = "기타";
			else if(category.equals("0"))
				category = "";

			mav.addAllObjects(boardService.searchBoard(category, type, keyword, page, 1));
			mav.setViewName("info.tiles");
			return mav;
		}
		
		@RequestMapping("checkAdmin.do")
		public 
		@ResponseBody HashMap<String, Object> checkAdmin(HttpServletResponse resp,
				@RequestParam HashMap<String, Object> params){
			String id = (String) params.get("id");
			

			System.out.println(id + "들어왔음"); 
			HashMap<String, Object> response = new HashMap<>();
			if(memberService.adminCheck(id) == 1){
				System.out.println("관리자네");
				response.put("result", true);
			}else {
				System.out.println("관리자아니네");
				response.put("result", false);
			}
			return response;
		}

		//애견정보 게시판 글쓰기 폼
		@RequestMapping("infoWriteForm.do")
		public String infoWriteForm(){
			return "infoWriteForm.tiles";
		}
		
		//애견정보 게시글 상세보기
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
		
		//애견정보 게시판 글쓰기
		@RequestMapping("infoWrite.do")
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
				return "redirect:infoMain.do";
		}
		
		//애견정보 게시글 수정 폼
		@RequestMapping("infoUpdateForm.do")
		public ModelAndView infoUpdateForm(int boardIdx){
			ModelAndView mav = new ModelAndView();
			HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
			mav.addObject("board", board);
			mav.setViewName("infoUpdateForm.tiles");
			return mav;
		}
		
		//애견정보 게시글 수정하기
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
		
		//애견정보 게시글 삭제
		@RequestMapping("infoDelete.do")
		public String infoDelete(int boardIdx){
			boardService.deleteBoard(boardIdx);
			return "redirect:infoMain.do";
		}
		
}
