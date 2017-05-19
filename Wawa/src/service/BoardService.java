package service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import commons.Constant;
import interface_dao.IBoardDao;
import interface_dao.IBoardFileDao;
import interface_dao.IRepleDao;
import interface_service.IBoardService;



@Component
public class BoardService implements IBoardService{
	@Autowired
	IBoardDao dao;
	@Autowired
	IBoardFileDao fileDao;
	@Autowired
	IRepleDao repleDao;
	
	//================================게시글 쓰기========================================================
	@Override
	public boolean writeBoastBoard(int boardCode, String name,  int age, String kind, String sex, 
			String title, String content, String writer, MultipartFile file) {
		// TODO Auto-generated method stub
		
		String path = "Upload/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		UUID uuid = UUID.randomUUID();
		//원본파일명
		String fileName = file.getOriginalFilename();
		//파일사이즈
		int fileSize = (int)file.getSize();
		//파일경로
//		String fileuri = path + fileName;
		String fileuri = path + uuid;
		
		HashMap<String, Object> boardFile = new HashMap<>();
		boardFile.put(Constant.BoardFile.ORIGINFILENAME, fileName);
		boardFile.put(Constant.BoardFile.SIZE, fileSize);
		boardFile.put(Constant.BoardFile.URI, fileuri);
		
		File localFile = new File(fileuri);
		try {
			file.transferTo(localFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fileDao.insertBoardFile(boardFile);
//		int fileid = Integer.parseInt((String)boardFile.get("id"));
		
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.FILEID, boardFile.get("id"));
		
		params.put(Constant.Board.BOARDCODE, boardCode);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.KIND, kind);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		int result = dao.insertBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean writeFreeBoard(int boardCode, String title, String category, String content, String writer) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDCODE, boardCode);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CATEGORY, category);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		int result = dao.insertBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean writeDogFindBoard(int boardCode, String category, String name, String resist, String lostdate, String lostplace,
			String kind, String sex, int age, double weight, String phone, String email, String content, String title, String writer,
			MultipartFile file) {
		// TODO Auto-generated method stub
		String path = "Upload/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		UUID uuid = UUID.randomUUID();
		//원본파일명
		String fileName = file.getOriginalFilename();
		//파일사이즈
		int fileSize = (int)file.getSize();
		//파일경로
//		String fileuri = path + fileName;
		String fileuri = path + uuid;
		
		HashMap<String, Object> boardFile = new HashMap<>();
		boardFile.put(Constant.BoardFile.ORIGINFILENAME, fileName);
		boardFile.put(Constant.BoardFile.SIZE, fileSize);
		boardFile.put(Constant.BoardFile.URI, fileuri);
		
		File localFile = new File(fileuri);
		try {
			file.transferTo(localFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fileDao.insertBoardFile(boardFile);
		
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.FILEID, boardFile.get("id"));
		
		params.put(Constant.Board.BOARDCODE, boardCode);
		params.put(Constant.Board.CATEGORY, category);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.RESIST, resist);
		params.put(Constant.Board.LOSTDATE, lostdate);
		params.put(Constant.Board.LOSTPLACE, lostplace);
		params.put(Constant.Board.KIND, kind);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.WEIGHT, weight);
		params.put(Constant.Board.PHONE, phone);
		params.put(Constant.Board.EMAIL, email);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.WRITER, writer);
		int result = dao.insertBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean writePartnerFindBoard(int boardCode, String name, String kind, String sex, int age, double weight,
			String phone, String email, String title, String content, String writer, MultipartFile file) {
		// TODO Auto-generated method stub
		String path = "Upload/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		UUID uuid = UUID.randomUUID();
		//원본파일명
		String fileName = file.getOriginalFilename();
		//파일사이즈
		int fileSize = (int)file.getSize();
		//파일경로
//		String fileuri = path + fileName;
		String fileuri = path + uuid;
		
		HashMap<String, Object> boardFile = new HashMap<>();
		boardFile.put(Constant.BoardFile.ORIGINFILENAME, fileName);
		boardFile.put(Constant.BoardFile.SIZE, fileSize);
		boardFile.put(Constant.BoardFile.URI, fileuri);
		
		File localFile = new File(fileuri);
		try {
			file.transferTo(localFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fileDao.insertBoardFile(boardFile);
		
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.FILEID, boardFile.get("id"));
		params.put(Constant.Board.BOARDCODE, boardCode);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.KIND, kind);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.WEIGHT, weight);
		params.put(Constant.Board.PHONE, phone);
		params.put(Constant.Board.EMAIL, email);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		int result = dao.insertBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean writeReviewBoard(int boardCode, String title, String category, int starPoint, String content, String writer) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDCODE, boardCode);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CATEGORY, category);
		params.put(Constant.Board.STARPOINT, starPoint);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		int result = dao.insertBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}
	
	
	//================================게시글 수정========================================================
	@Override
	public boolean updateBoastBoard(int boardIdx, String name, String kind, int age, String sex, String title, 
			String content, String writer, int likeCount, MultipartFile file) {
		// TODO Auto-generated method stub
		
		String path = "Upload/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		UUID uuid = UUID.randomUUID();
		//원본파일명
		String fileName = file.getOriginalFilename();
		//파일사이즈
		int fileSize = (int)file.getSize();
		//파일경로
//		String fileuri = path + fileName;
		String fileuri = path + uuid;
		int fileid = (int)dao.selectOneBoard(boardIdx).get(Constant.Board.FILEID);
		HashMap<String, Object> boardFile = new HashMap<>();
		boardFile.put(Constant.BoardFile.FILEID, fileid);
		boardFile.put(Constant.BoardFile.ORIGINFILENAME, fileName);
		boardFile.put(Constant.BoardFile.SIZE, fileSize);
		boardFile.put(Constant.BoardFile.URI, fileuri);
		
		File localFile = new File(fileuri);
		try {
			file.transferTo(localFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(!fileName.equals(""))
		fileDao.updateBoardFile(boardFile);
		
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.FILEID, fileid);
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.KIND, kind);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		params.put(Constant.Board.LIKECOUNT, likeCount);
		int result = dao.updateBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateFreeBoard(int boardIdx, String title, String category, String content, String writer, int readCount) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CATEGORY, category);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		params.put(Constant.Board.READCOUNT, readCount);
		int result = dao.updateBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateDogFindBoard(int boardIdx, String category, String name, String resist, String lostdate, String lostplace,
			String kind, String sex, int age, double weight, String phone, String email, String title, String content,
			String writer, MultipartFile file) { 
		// TODO Auto-generated method stub
		String path = "Upload/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		UUID uuid = UUID.randomUUID();
		//원본파일명
		String fileName = file.getOriginalFilename();
		//파일사이즈
		int fileSize = (int)file.getSize();
		//파일경로
//		String fileuri = path + fileName;
		String fileuri = path + uuid;
		int fileid = (int)dao.selectOneBoard(boardIdx).get(Constant.Board.FILEID);
		HashMap<String, Object> boardFile = new HashMap<>();
		boardFile.put(Constant.BoardFile.FILEID, fileid);
		boardFile.put(Constant.BoardFile.ORIGINFILENAME, fileName);
		boardFile.put(Constant.BoardFile.SIZE, fileSize);
		boardFile.put(Constant.BoardFile.URI, fileuri);
		
		File localFile = new File(fileuri);
		try {
			file.transferTo(localFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(!fileName.equals(""))
		fileDao.updateBoardFile(boardFile);
		
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.FILEID, fileid);
		
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.CATEGORY, category);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.RESIST, resist);
		params.put(Constant.Board.LOSTDATE, lostdate);
		params.put(Constant.Board.LOSTPLACE, lostplace);
		params.put(Constant.Board.KIND, kind);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.WEIGHT, weight);
		params.put(Constant.Board.PHONE, phone);
		params.put(Constant.Board.EMAIL, email);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		int result = dao.updateBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updatePartnerFindBoard(int boardIdx, String name, String kind, String sex, int age, double weight,
			String phone, String email, String title, String content, String writer, MultipartFile file) {
		// TODO Auto-generated method stub
		String path = "Upload/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		UUID uuid = UUID.randomUUID();
		//원본파일명
		String fileName = file.getOriginalFilename();
		//파일사이즈
		int fileSize = (int)file.getSize();
		//파일경로
//		String fileuri = path + fileName;
		String fileuri = path + uuid;
		int fileid = (int)dao.selectOneBoard(boardIdx).get(Constant.Board.FILEID);
		HashMap<String, Object> boardFile = new HashMap<>();
		boardFile.put(Constant.BoardFile.FILEID, fileid);
		boardFile.put(Constant.BoardFile.ORIGINFILENAME, fileName);
		boardFile.put(Constant.BoardFile.SIZE, fileSize);
		boardFile.put(Constant.BoardFile.URI, fileuri);
		
		File localFile = new File(fileuri);
		try {
			file.transferTo(localFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(!fileName.equals(""))
		fileDao.updateBoardFile(boardFile);
		
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.FILEID, fileid);
		
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.KIND, kind);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.WEIGHT, weight);
		params.put(Constant.Board.PHONE, phone);
		params.put(Constant.Board.EMAIL, email);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		int result = dao.updateBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateReviewBoard(int boardIdx, String title, String category, int starPoint, String content,
			String writer, int readCount) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CATEGORY, category);
		params.put(Constant.Board.STARPOINT, starPoint);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		params.put(Constant.Board.READCOUNT, readCount);
		int result = dao.updateBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}
	
	
	//================================게시글 삭제========================================================
	@Override
	public boolean deleteBoard(int boardIdx) {
		// TODO Auto-generated method stub
		int result2 = repleDao.deleteBoardReple(boardIdx);
		if(dao.selectOneBoard(boardIdx).get(Constant.Board.FILEID) != null){
			int fileid = (int)dao.selectOneBoard(boardIdx).get(Constant.Board.FILEID);
			fileDao.deleteBoardFile(fileid);			
		}
		int result = dao.deleteBoard(boardIdx);
		if(result > 0 && result2 > 0)
			return true;
		else
			return false;
	}
	

	//================================게시글 보기========================================================
	@Override
	public HashMap<String, Object> readBoard(int boardIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = dao.selectOneBoard(boardIdx);
		params.put(Constant.Board.READCOUNT, (int)params.get(Constant.Board.READCOUNT) +1);
		dao.updateBoard(params);
		return params;
	}

	
	//================================해당 게시판 게시물리스트, 페이징 처리========================================================	
	@Override
	public HashMap<String, Object> getBoardList(int page, int boardCode) {
		// TODO Auto-generated method stub

				int count = 0;	//한페이지에 표시할 게시물 개수
				int skip = 0;	//건너뛸 게시물 개수
				//뽐내기,짝꿍찾기
				if(boardCode == 3 || boardCode == 5){	
					count = 12;
					skip = (page-1) * count;
				}
				//유기견찾기
				else if(boardCode == 4){
					count = 9;
					skip = (page-1) * count;
				}
				//애견정보,리뷰,자유게시판
				else{
					count = 10;
					skip = (page-1) * count;
				}
				
				//첫페이지 -> 맨앞페이지
				int first = 1;
				//시작페이지 -> 현재 보이는 첫페이지
				int start = (page-1) / 10 * 10 + 1;
				//끝페이지 -> 현재 보이는 마지막페이지
				int end = ((page-1) / 10 + 1) *10;
				//마지막페이지 -> 맨마지막페이지
				int last = (dao.getBoardCount(boardCode)-1)/count + 1;
				//마지막페이지가 끝페이지보다 작으면 end=last
				end = last < end ? last : end;
				
				HashMap<String, Object> params = new HashMap<>();
				params.put(Constant.Board.BOARDCODE, boardCode);
				params.put("skip", skip);
				params.put("count", count);
				List<HashMap<String, Object>> list = dao.selectBoardLimit(params);
				
				HashMap<String, Object> result = new HashMap<>();
				result.put("first", first);
				result.put("start", start);
				result.put("end", end);
				result.put("last", last);
				result.put("current", page);
				result.put("boardList", list);
				
				return result;
	}
	
	//================================좋아요 수 증가========================================================	
	@Override
	public boolean increaseBoastNum(int boardIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = dao.selectOneBoard(boardIdx);
		int likeCount = (int)params.get(Constant.Board.LIKECOUNT) + 1;
		params.put("likeCount", likeCount);
			
		int result = dao.updateBoard(params);
		if(result > 0) 
			return true;
		else 
			return false;
	}
	
	//================================좋아요 수로 정렬========================================================	
	@Override
	public List<HashMap<String, Object>> selectBoastNum() {
		// TODO Auto-generated method stub
		return dao.selectByBoastnum();
	}
	
	//================================게시글 검색========================================================	
	@Override
	public HashMap<String, Object> searchBoard(String category, int type, String keyword, int page, int boardCode) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDCODE, boardCode);
		params.put(Constant.Board.CATEGORY, category);
		params.put("type", type);
		params.put("keyword", keyword);
		
		int first = 1;

		int start = (page-1) / 10 * 10 + 1;

		int end = ((page-1) / 10 + 1) *10;

		int last = (dao.getSearchCount(params)-1)/10 + 1;

		end = last < end ? last : end;

		int skip = (page-1) * 10;

		int count = 10;
		
		params.put("skip", skip);
		params.put("count", count);
		
		
		List<HashMap<String, Object>> list = dao.searchBoard(params);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("first", first);
		result.put("start", start);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("boardList", list);
		result.put("category", category);
		result.put("type", type);
		result.put("keyword", keyword);
		
		return result;
	}

	//================================게시글 정보 가져오기========================================================	
	@Override
	public HashMap<String, Object> getBoardByBoardIdx(int boardIdx) {
		// TODO Auto-generated method stub
		return dao.selectOneBoard(boardIdx);
	}

	//================================펫 정보 불러오기========================================================	
	@Override
	public HashMap<String, Object> selectPetinfo(int idx) {
		// TODO Auto-generated method stub
		return dao.selectPetinfo(idx);
	}
	//아이디로 게시글 리스트 검색
	@Override
	public List<HashMap<String, Object>> getBoardByWriter(String writer) {
		// TODO Auto-generated method stub
		return dao.selectBoardById(writer);
	}

	

}
