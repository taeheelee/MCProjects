package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import commons.Constant;
import interface_service.IBoardService;
import model.Board;

@Controller
public class ReviewController {

	@Autowired
	private IBoardService boardService;
	
	@RequestMapping("reviewMain.do")
	public ModelAndView reviewMain(int page, int boardCode){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> list
			= boardService.getBoardList(page, boardCode);
		mav.addObject("result", list);
		mav.setViewName("review");
		return mav;
	}
	
	// ---------- reviewMain.do의 세부기능
	@RequestMapping("search.do")
	public ModelAndView search(String keyword){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<>();
		// -> 카테고리 params.put(key, value);
		params.put("keyword", keyword);
		List<HashMap<String, Object>> list = boardService.getBoardByKeyword(params);
		mav.addObject("result", list);
		mav.setViewName("redirect:reviewMain.do");
		return mav;
	}
	
	@RequestMapping("detail.do")
	public ModelAndView detail(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = boardService.readBoard(boardIdx);
		mav.addObject("result", params);
		mav.setViewName("redirect:reviewMain.do");
		return mav;
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(
			int boardCode, String title, String category, int starPoint, String content, String writer){
		ModelAndView mav = new ModelAndView();
		int result;
		if(boardService.writeReviewBoard(boardCode, title, category, starPoint, content, writer)){
			result = 1; // 썼음
		}else {
			result = 2; // 못썼음
		}
		mav.addObject("result", result);
		mav.setViewName("redirect:reviewMain.do");
		return mav;
	}
	
//	@RequestMapping("conform") //본인확인
//	public ModelAndView conform(HashMap<String, Object> params){
//	
//	}
	
	@RequestMapping("reviewDetail.do")
	public ModelAndView reviewDetail(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.readBoard(boardIdx);
		mav.addObject("result", board);
		mav.setViewName("reviewDetails");
		return mav;
	}
	
	// ------------ reviewDetail.do의 세부기능
	
//	@RequestMapping("back.do")
//	public String back(int page){
//		
//	}
// -> 뒤로가기는 jsp에서
	
	@RequestMapping("submit")
	public ModelAndView submit(String boardCode, String boardIdx, String title,
			String writer, String content, String readcount, String writeDate,
			String starPoint){
		 ModelAndView mav = new ModelAndView();
		 HashMap<String, Object> params = new HashMap<>();
		 params.put("boardCode", boardCode);
		 params.put("boardIdx", boardIdx);
		 params.put("title", title);
		 params.put("writer", writer);
		 params.put("content", content);
		 params.put("readcount", readcount);
		 params.put("writeDate", writeDate);
		 params.put("starPoint", starPoint);
		 mav.addObject("result", params);
		 mav.setViewName("redirect:reviewDetail.do");
		 return mav;
	}
	
	@RequestMapping("reviewWrite.do")
	public ModelAndView review_write(
		int boardCode, String title, String category, int starPoint, String content, String writer){
			ModelAndView mav = new ModelAndView();
			int result;
			if(boardService.writeReviewBoard(boardCode, title, category, starPoint, content, writer)){
				result = 1; // 썼음
			}else {
				result = 2; // 못썼음
			}
			mav.addObject("result", result);
			mav.setViewName("redirect:reviewDetail.do");
			return mav;
	}
	
	// ------------ review_write.do의 세부기능
	@RequestMapping("reviewUpdate.do")
	public ModelAndView review_update(int boardIdx, String title, String category, int starPoint, String content,
			String writer){
		ModelAndView mav = new ModelAndView();
		int result;
		if(boardService.updateReviewBoard(boardIdx, title, category, starPoint, content, writer){
			result = 1; //업로드 되었음
		}else {
			result = 2; //업로드 되지 않았음
		}
		mav.addObject("result", result);
		mav.setViewName("reviewWrite.do");
		return mav;
	}
	
	@RequestMapping("reviewDelete.do")
	public String review_delete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "reviewWrite.do";
	}
	
}
