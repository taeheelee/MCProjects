package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IBoardDao {
	public int insertBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);	
	public int deleteBoard(int boardIdx);
	public HashMap<String, Object> selectOneBoard(int boardIdx);
	public List<HashMap<String, Object>> selectBoardList(int boardCode);
	public List<HashMap<String, Object>> selectAllBoard();
	public List<HashMap<String, Object>> select_by_name(HashMap<String, Object> params);
	public List<HashMap<String, Object>> select_by_title(HashMap<String, Object> params);
	public List<HashMap<String, Object>> select_by_keyword(HashMap<String, Object> params);
	public List<HashMap<String, Object>> select_by_boastnum();
	public List<HashMap<String, Object>> selectBoardLimit(HashMap<String, Object> params);
	public int getBoardCount();
}
