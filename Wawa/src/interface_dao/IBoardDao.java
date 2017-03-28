package interface_dao;

import java.util.HashMap;
import java.util.List;

import model.Board;

public interface IBoardDao {
	public int insertBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);	
	public int deleteBoard(int board_idx);
	public HashMap<String, Object> selectOneBoard(int board_idx);
	public List<HashMap<String, Object>> selectBoardList(int board_code);
	public List<HashMap<String, Object>> selectAllBoard();
	public List<HashMap<String, Object>> select_by_name(HashMap<String, Object> params);
	public List<HashMap<String, Object>> select_by_title(HashMap<String, Object> params);
	public List<HashMap<String, Object>> select_by_keyword(HashMap<String, Object> params);
	public List<HashMap<String, Object>> select_by_boastnum();
}
