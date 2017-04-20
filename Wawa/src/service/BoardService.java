package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import commons.Constant;
import interface_dao.IBoardDao;
import interface_service.IBoardService;


@Component
public class BoardService implements IBoardService{
	@Autowired
	IBoardDao dao;
	
	//================================게시글 쓰기========================================================
	@Override
	public boolean writeBoastBoard(int boardCode, String name, int age, String sex, String title, String content, String writer) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDCODE, boardCode);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.SEX, sex);
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
			String kind, String sex, int age, double weight, String phone, String email, String content, String title, String writer) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
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
			String phone, String email, String title, String content, String writer) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDCODE, boardCode);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.KIND, kind);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.WEIGHT, weight);
		params.put(Constant.Board.PHONE, phone);
		params.put(Constant.Board.EMAIL, email);
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
	public boolean updateBoastBoard(int boardIdx, String name, int age, String sex, String content, String writer) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		int result = dao.updateBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateFreeBoard(int boardIdx, String title, String category, String content, String writer) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CATEGORY, category);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
		int result = dao.updateBoard(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateDogFindBoard(int boardIdx, String category, String name, String resist, String lostdate,
			String kind, String sex, int age, double weight, String phone, String email, String content,
			String writer) { 
		// TODO Auto-generated method stub 
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.CATEGORY, category);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.RESIST, resist);
		params.put(Constant.Board.LOSTDATE, lostdate);
		params.put(Constant.Board.KIND, kind);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.WEIGHT, weight);
		params.put(Constant.Board.PHONE, phone);
		params.put(Constant.Board.EMAIL, email);
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
			String phone, String email, String content, String writer) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.NAME, name);
		params.put(Constant.Board.KIND, kind);
		params.put(Constant.Board.SEX, sex);
		params.put(Constant.Board.AGE, age);
		params.put(Constant.Board.WEIGHT, weight);
		params.put(Constant.Board.PHONE, phone);
		params.put(Constant.Board.EMAIL, email);
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
			String writer) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDIDX, boardIdx);
		params.put(Constant.Board.TITLE, title);
		params.put(Constant.Board.CATEGORY, category);
		params.put(Constant.Board.STARPOINT, starPoint);
		params.put(Constant.Board.CONTENT, content);
		params.put(Constant.Board.WRITER, writer);
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
		int result = dao.deleteBoard(boardIdx);
		if(result > 0)
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
		//첫페이지 -> 맨앞페이지
				int first = 1;
				//시작페이지 -> 현재 보이는 첫페이지
				int start = (page-1) / 10 * 10 + 1;
				//끝페이지 -> 현재 보이는 마지막페이지
				int end = ((page-1) / 10 + 1) *10;
				//마지막페이지 -> 맨마지막페이지
				int last = (dao.getBoardCount(boardCode)-1)/10 + 1;
				//마지막페이지가 끝페이지보다 작으면 end=last
				end = last < end ? last : end;
				//건너뛸 게시물 개수
				int skip = (page-1) * 10;
				//한페이지에 표시할 게시물 개수
				int count = 10;
				
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

	@Override
	public List<HashMap<String, Object>> getBoardByName(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.selectByName(params);
	}

	@Override
	public HashMap<String, Object> getBoardByTitle(int type, String keyword, int page, int boardCode) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Board.BOARDCODE, boardCode);
		params.put(Constant.Board.TITLE, keyword);
		if(type == 1)
			params.put(Constant.Board.CATEGORY, "애견상식");
		else if(type == 2)
			params.put(Constant.Board.CATEGORY, "훈련정보");
		else if(type == 3)
			params.put(Constant.Board.CATEGORY, "애견간식레시피");
		else if(type == 4)
			params.put(Constant.Board.CATEGORY, "기타");
		
		int first = 1;

		int start = (page-1) / 10 * 10 + 1;

		int end = ((page-1) / 10 + 1) *10;

		int last = (dao.getSearchCount(params)-1)/10 + 1;

		end = last < end ? last : end;

		int skip = (page-1) * 10;

		int count = 10;
		
		params.put("skip", skip);
		params.put("count", count);
		
		
		List<HashMap<String, Object>> list = dao.selectByTitle(params);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("first", first);
		result.put("start", start);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("boardList", list);
		result.put("type", type);
		result.put("keyword", keyword);
		
		return result;
	}

	@Override
	public List<HashMap<String, Object>> getBoardByKeyword(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.selectByKeyword(params);
	}
	
	@Override
	public HashMap<String, Object> getBoardByBoardIdx(int boardIdx) {
		// TODO Auto-generated method stub
		return dao.selectOneBoard(boardIdx);
	}

	@Override
	public List<HashMap<String, Object>> getPetInfo(String id) {
		// TODO Auto-generated method stub
		return dao.selectPetinfo(id);
	}

	@Override
	public boolean identifyUser(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		String id = (String) params.get("id");
		String password = (String) params.get("password");
		if(dao.getUserPwd(id).equals(password)) return true;
		return false;
	}

}
