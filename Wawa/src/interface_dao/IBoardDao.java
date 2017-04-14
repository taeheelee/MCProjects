package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IBoardDao {
	public int insertBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);	
	public int deleteBoard(int boardIdx);
	public HashMap<String, Object> selectOneBoard(int boardIdx);
	public HashMap<String, Object> selectBoardById(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBoardList(int boardCode);
	public List<HashMap<String, Object>> selectAllBoard();
	public List<HashMap<String, Object>> selectByName(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectByTitle(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectByKeyword(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectByBoastnum();
	public List<HashMap<String, Object>> selectBoardLimit(HashMap<String, Object> params);
	public int getBoardCount();
	public int increaseLikeCount(int boardIdx);
	public List<HashMap<String, Object>> selectPetinfo(String id);
	
}
