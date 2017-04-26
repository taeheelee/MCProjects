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
import interface_service.IPetinfoService;
import interface_service.IRepleService;

@Controller
public class LostController {

	@Autowired
	private IBoardService boardService;
	@Autowired
	private IRepleService repleService;
	@Autowired
	private IPetinfoService petService;
	
	@RequestMapping("lostMain.do")
	public ModelAndView lostMain(@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="4") int boardCode){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardList(page, boardCode));
		mav.setViewName("lost.tiles");
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
	public ModelAndView lostDetails(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		List<HashMap<String, Object>> reple = repleService.selectRepleList(boardIdx);
		mav.addObject("board", board);
		mav.addObject("reple", reple);
		mav.setViewName("lostDetails.tiles");
		return mav;
	}
	
	@RequestMapping("lostWriteForm.do")
	public ModelAndView lostWriteForm(@RequestParam(defaultValue="0") int idx){
		ModelAndView mav = new ModelAndView();
		mav.addObject("load", idx);
		if(idx != 0){
			mav.addObject("pet", boardService.selectPetinfo(idx));
		}
		mav.setViewName("lostWriteForm.tiles");
		return mav;
	}
	
	@RequestMapping("lostWrite.do")
	public String lostWrite(int boardCode, String category, String name,
			String resist, String lostdate, String lostplace, String kind, String sex, int age, double weight,
			String phone, String email, String title, String content, String writer){
		if(category.equals("find"))
			category = "찾고있어요";
		else if(category.equals("protect"))
			category = "보호중입니다";
		
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
		
		boardService.writeDogFindBoard(boardCode, category, name, resist, lostdate, lostplace, 
				kind, sex, age, weight, phone, email, content, title, writer);
				return "redirect:lostMain.do";
	}
	
	@RequestMapping("lostUpdateForm.do")
	public ModelAndView lostUpdateForm(int boardIdx, @RequestParam(defaultValue="0") int idx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("board", board);
		mav.addObject("load", idx);
		if(idx != 0){
			mav.addObject("pet", boardService.selectPetinfo(idx));
		}
		mav.setViewName("lostUpdateForm.tiles");
		return mav;
	} 
	
	@RequestMapping("lostUpdate.do")
	public String lostUpdate(int boardIdx, String category, String name, String resist, 
			String lostdate, String lostplace, String kind, String sex, int age, double weight, String phone,
			String email, String title, String content, String writer){ // 등록번호 추가 petname으로 수정 + petidx추가
		if(category.equals("find"))
			category = "찾고있어요";
		else if(category.equals("protect"))
			category = "보호중입니다";
		
		if(sex.equals("male"))
			sex = "수컷";
		else if(sex.equals("female"))
			sex = "암컷";
		
		if(kind.equals("1"))
			kind = "치와와";
		else if(kind.equals("2"))
			kind = "요크셔테리어";
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
			kind = "기타소형견";
		else if(kind.equals("10"))
			kind = "기타중형견";
		else if(kind.equals("11"))
			kind = "기타대형견";
		
		boardService.updateDogFindBoard(boardIdx, category, name, resist, lostdate,  lostplace,
				kind, sex, age, weight, phone, email, title, content , writer);
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
	
	@RequestMapping("lostGetPetinfoForm.do")
	public ModelAndView boastGetPetinfoForm(String id, int boardCode, int boardIdx, String type){
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> list = petService.selectPetList(id);
		mav.addObject("petList", list);
		mav.addObject("boardCode", boardCode);
		mav.addObject("boardIdx", boardIdx);
		mav.addObject("type", type);
		mav.setViewName("empty/petInfoList.jsp");
		return mav;
	}
	
	@RequestMapping("lostGetPetinfo.do")
	public ModelAndView boastGetPetinfo(int idx, int boardCode, int boardIdx, String type){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> petinfo = boardService.selectPetinfo(idx);
		mav.addObject("pet",petinfo);
		mav.addObject("boardCode", boardCode);
		mav.addObject("boardIdx", boardIdx);
		mav.addObject("type", type);
		mav.setViewName("boardPetInfoLoad.tiles");
		return mav;
	}
	
}
