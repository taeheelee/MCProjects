package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IBoardDao {
	public int insertBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);	
	public int deleteBoard(int boardIdx);
	public HashMap<String, Object> selectOneBoard(int boardIdx);
	public List<HashMap<String, Object>> selectBoardById(String writer);
	public List<HashMap<String, Object>> selectBoardList(int boardCode);
	public List<HashMap<String, Object>> selectAllBoard();
	public List<HashMap<String, Object>> searchBoard(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectByBoastnum(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBoardLimit(HashMap<String, Object> params);
	public int getBoardCount(int boardCode);
	public int getSearchCount(HashMap<String, Object> params);
	public int increaseLikeCount(int boardIdx);
	public HashMap<String, Object> selectPetinfo(int idx);
	public String getUserPwd(String id);
}
