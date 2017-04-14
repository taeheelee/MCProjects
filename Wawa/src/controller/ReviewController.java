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
public class ReviewController {

	@Autowired
	private IBoardService boardService;
	
	@RequestMapping("reviewMain.do")
	public ModelAndView reviewMain(@RequestParam(defaultValue="1") int page, int boardCode){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> list = boardService.getBoardList(page, boardCode);
		mav.addObject("result", list);
		mav.setViewName("review");
		return mav;
	}
	
	@RequestMapping("search.do")
	public ModelAndView search(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = boardService.getBoardByKeyword(params);
		mav.addObject("result", list);
		mav.setViewName("redirect:reviewMain.do");
		return mav;
	}
	
	@RequestMapping("viewDetail.do")
	public ModelAndView viewDetail(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("redirect:reviewMain.do");
		return mav;
	}
	
	@RequestMapping("writeForm.do")
	public void writeForm(){}
	
	@RequestMapping("write.do")
	public String write(int boardCode, String title, String category, 
			int starPoint, String content, String writer){
		ModelAndView mav = new ModelAndView();
		if(boardService.writeReviewBoard(boardCode, title, category, starPoint, content, writer)){
			return "redirect:reviewMain.do";
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
	public String update(int boardIdx, String title, String category, String starPoint, content, writer){
		boardService.updateReviewBoard(boardIdx, title, category, starPoint, content, writer);
		return "redirect:reviewMain.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:reviewMain.do";
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
	
//	@RequestMapping("conform") //본인확인
//	public ModelAndView conform(HashMap<String, Object> params){
//	
//	}

}
