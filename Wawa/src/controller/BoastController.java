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
import interface_service.IPetinfoService;
import interface_service.IRepleService;
import model.Board;

@Controller
public class BoastController {
	@Autowired
	private IBoardService boardService;
	@Autowired
	private IRepleService repleService;
	@Autowired
	private IPetinfoService petService;
	
	@RequestMapping("boastMain.do")
	public ModelAndView boastMain(@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="3") int boardCode){
		List<HashMap<String, Object>> best = boardService.selectBoastNum();
		ModelAndView mav = new ModelAndView();
		mav.addObject("best", best);
		mav.addAllObjects(boardService.getBoardList(page, boardCode));
		mav.setViewName("boast.tiles");
		return mav;
	}
	
	@RequestMapping("increaseLike.do")
	public String increaseLike(int boardIdx){
		boardService.increaseBoastNum(boardIdx);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("boastSearch.do")
	public ModelAndView boastSearch(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("result", board);
		mav.setViewName("redirect:boastMain.do");
		return mav;
	}
	
	@RequestMapping("boastDetails.do")
	public ModelAndView boastDetails(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		List<HashMap<String, Object>> reple = repleService.selectRepleList(boardIdx);
		mav.addObject("board", board);
		mav.addObject("reple", reple);
		mav.setViewName("boastDetails.tiles");
		return mav;
	}
	
	@RequestMapping("boastWriteForm.do") //writeForm.jsp로
	public ModelAndView boastWriteForm(@RequestParam(defaultValue="0") int idx){
		ModelAndView mav = new ModelAndView();
		if(idx != 0){
			mav.addObject("pet", boardService.selectPetinfo(idx));
		}
		mav.setViewName("boastWriteForm.tiles");
		return mav;
	}
	
	@RequestMapping("boastWrite.do")
	public String boastWrite(int boardCode, String name, int age, String kind, String sex, 
			String title, String content, String writer){
		if(sex.equals("male"))
			sex = "수컷";
		else if(sex.equals("female"))
			sex = "암컷";
		
		if(kind.equals("1"))
			kind = "치와와";
		else if(kind.equals("2"))
			kind = "요크셔 테리어";
		else if(kind.equals("3"))
			kind = "말티즈";
		else if(kind.equals("4"))
			kind = "시츄";
		else if(kind.equals("5"))
			kind = "비글";
		else if(kind.equals("6"))
			kind = "퍼그";
		else if(kind.equals("7"))
			kind = "페키니즈";
		else if(kind.equals("8"))
			kind = "미니어쳐 슈나우저";
		else if(kind.equals("9"))
			kind = "기타 소형견";
		else if(kind.equals("10"))
			kind = "기타 중형견";
		else if(kind.equals("11"))
			kind = "기타 대형견";
		boardService.writeBoastBoard(boardCode, name, age, kind, sex, title, content, writer);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("boastUpdateForm.do")
	public ModelAndView boastUpdateForm(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("board", board);
		mav.setViewName("boastUpdateForm.tiles");
		return mav;	
	}
	
	@RequestMapping("boastUpdate.do")
	public String boastUpdate(int boardIdx, String name, String kind, int age, String sex, String title, String content, String writer, int likeCount){
		if(sex.equals("male"))
			sex = "수컷";
		else if(sex.equals("female"))
			sex = "암컷";
		
		if(kind.equals("1"))
			kind = "치와와";
		else if(kind.equals("2"))
			kind = "요크셔 테리어";
		else if(kind.equals("3"))
			kind = "말티즈";
		else if(kind.equals("4"))
			kind = "시츄";
		else if(kind.equals("5"))
			kind = "비글";
		else if(kind.equals("6"))
			kind = "퍼그";
		else if(kind.equals("7"))
			kind = "페키니즈";
		else if(kind.equals("8"))
			kind = "미니어쳐 슈나우저";
		else if(kind.equals("9"))
			kind = "기타 소형견";
		else if(kind.equals("10"))
			kind = "기타 중형견";
		else if(kind.equals("11"))
			kind = "기타 대형견";
		
		boardService.updateBoastBoard(boardIdx, name, kind, age, sex, title, content, writer, likeCount);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("boastDelete.do")
	public String boastDelete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:boastMain.do";
	}
	
//	@RequestMapping("boastUploadImage.do")
//	public ModelAndView boastUploadImage(){
//		
//	}
	
	@RequestMapping("boastGetPetinfoForm.do")
	public ModelAndView boastGetPetinfoForm(String id){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = petService.selectPetList(id);
		mav.addObject("petList", list);
		mav.setViewName("empty/petInfoList.jsp");
		return mav;
	}
	
	@RequestMapping("boastGetPetinfo.do")
	public ModelAndView boastGetPetinfo(int idx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> petinfo = boardService.selectPetinfo(idx);
		mav.addObject("pet",petinfo);
		mav.setViewName("boardPetInfoLoad.tiles");
		return mav;
	}
	
}
