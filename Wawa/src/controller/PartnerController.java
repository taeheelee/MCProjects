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

@Controller
public class PartnerController {

	@Autowired
	private IBoardService boardService;
	@Autowired
	private IRepleService repleService;
	@Autowired
	private IPetinfoService petService;
	
	@RequestMapping("partnerMain.do")
	public ModelAndView partnerMain(@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="5") int boardCode){
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoardList(page, boardCode));
		mav.setViewName("partner.tiles");
		return mav;
	}
	
	@RequestMapping("partnerSearch.do") // 수컷/암컷(강아지성별) + 강아지 이름으로 검색  
	public ModelAndView partnerSearch(HashMap<String, Object> params){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(params);
		mav.addObject("result", board);
		mav.setViewName("redirect:partnerMain.do");
		return mav;
	}
	
	@RequestMapping("partnerDetails.do")
	public ModelAndView partnerDetails(int boardIdx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		List<HashMap<String, Object>> reple = repleService.selectRepleList(boardIdx);
		mav.addObject("board", board);
		mav.addObject("reple", reple);
		mav.setViewName("partnerDetails.tiles");
		return mav;
	}
	
	@RequestMapping("partnerWriteForm.do")
	public ModelAndView partnerWriteForm(@RequestParam(defaultValue="0") int idx){
		ModelAndView mav = new ModelAndView();
		mav.addObject("load", idx);
		if(idx != 0){
			mav.addObject("pet", boardService.selectPetinfo(idx));
		}
		mav.setViewName("partnerWriteForm.tiles");
		return mav;
	}
	
	@RequestMapping("partnerWrite.do")
	public String partnerWrite(int boardCode, String name, String kind, 
			String sex, int age, double weight, String phone, String email, 
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
		boardService.writePartnerFindBoard(boardCode, name, kind, sex, age, 
				weight, phone, email, title, content, writer);
		return "redirect:partnerMain.do";
		
		
	}
	
	@RequestMapping("partnerConform.do")
	public String partnerConform(HashMap<String, Object> params){
		if(boardService.identifyUser(params)){
			return ""; // 본인 맞음
		}else {
			return ""; //본인 아님
		}
	}
	
	@RequestMapping("partnerUpdateForm.do")
	public ModelAndView partnerUpdateForm(int boardIdx, @RequestParam(defaultValue="0") int idx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("board", board);
		mav.addObject("load", idx);
		if(idx != 0){
			mav.addObject("pet", boardService.selectPetinfo(idx));
		}
		mav.setViewName("partnerUpdateForm.tiles");
		return mav;
	}
	
	@RequestMapping("partnerUpdate.do")
	public String partnerUpdate(int boardIdx, String name, String kind, String sex, 
			int age, double weight, String phone, String email, String title, String content, String writer){
		
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
		
		boardService.updatePartnerFindBoard(boardIdx, name, kind, sex, 
				age, weight, phone, email, title, content, writer);
		return "redirect:partnerMain.do";
	}
	
	@RequestMapping("partnerDelete.do")
	public String partnerDelete(int boardIdx){
		boardService.deleteBoard(boardIdx);
		return "redirect:partnerMain.do";
	}
	
//	@RequestMapping("partnerUploadImage.do")
//	public ModelAndView partnerUploadImage(){
//		
//	}
	
	@RequestMapping("partnerGetPetinfoForm.do")
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
	
	@RequestMapping("partnerGetPetinfo.do")
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
