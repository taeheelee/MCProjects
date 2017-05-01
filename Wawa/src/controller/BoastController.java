package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import interface_service.IBoardFileService;
import interface_service.IBoardService;
import interface_service.IPetinfoService;
import interface_service.IRepleService;

@Controller
public class BoastController {
	@Autowired
	private IBoardService boardService;
	@Autowired
	private IRepleService repleService;
	@Autowired
	private IPetinfoService petService;
	@Autowired
	private IBoardFileService fileService;
	
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
		mav.addObject("load", idx);
		if(idx != 0){
			mav.addObject("pet", boardService.selectPetinfo(idx));
		}
		mav.setViewName("boastWriteForm.tiles");
		return mav;
	}
	
	@RequestMapping("boastWrite.do")
	public String boastWrite(int boardCode, String name, int age, String kind, String sex, 
			String title, String content, String writer, @RequestParam("ufile") MultipartFile ufile){
		
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
		boardService.writeBoastBoard(boardCode, name, age, kind, sex, title, content, writer, ufile);
		return "redirect:boastMain.do";
	}
	
	@RequestMapping("boastUpdateForm.do")
	public ModelAndView boastUpdateForm(int boardIdx, @RequestParam(defaultValue="0") int idx){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> board = boardService.getBoardByBoardIdx(boardIdx);
		mav.addObject("board", board);
		mav.addObject("load", idx);
		if(idx != 0){
			mav.addObject("pet", boardService.selectPetinfo(idx));
		}
		mav.setViewName("boastUpdateForm.tiles");
		return mav;	
	}
	
	@RequestMapping("boastUpdate.do")
	public String boastUpdate(int boardIdx, String name, String kind, int age, String sex, String title, String content, String writer, int likeCount,
			 @RequestParam("ufile") MultipartFile ufile){
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
		
		boardService.updateBoastBoard(boardIdx, name, kind, age, sex, title, content, writer, likeCount, ufile);
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
	
	@RequestMapping("boastGetPetinfo.do")
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

//	@RequestMapping("boardImageView.do")
//	public ModelAndView boardImageView(int boardCode){
//		ModelAndView mav = new ModelAndView();
//		List<HashMap<String, Object>> params = (List)boardService.getBoardList(1, boardCode).get("boardList");
//		int fileId = (int)params.get(0).get("fileId");
//		HashMap<String, Object> image = fileService.selectOne(fileId);
//		mav.addObject("image", image);
//		return mav;
//		
//		
//	}
	
	@RequestMapping(value = "/imageShow/{fileId}.do", method = {RequestMethod.GET})
	public void imageShow(@PathVariable("fileId") int fileId, HttpServletResponse response) throws IOException, SerialException, SQLException {
	
	HashMap<String, Object> boardfile = fileService.selectOne(fileId);
	
	response.setContentType("images/jpg; utf-8");
	String originFile = (String)boardfile.get("originFileName");
	String filename = new String(originFile.getBytes("UTF-8"),"ISO-8859-1");
	response.setHeader("Content-Disposition", "inline;filename=\"" + filename + "\";");
	response.setHeader("Content-Transfer-Encoding", "binary");
	
	OutputStream outputStream = response.getOutputStream();

	File file = new File((String)boardfile.get("uri"));
//	SerialBlob blob = new SerialBlob(board.getContent());
	FileInputStream inputStream = new FileInputStream(file);

	IOUtils.copy(inputStream, outputStream);
	
	outputStream.flush();
	outputStream.close();
	}

}
