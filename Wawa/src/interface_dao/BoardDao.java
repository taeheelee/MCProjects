package interface_dao;

import java.util.HashMap;
import java.util.List;

import model.Board;

public interface BoardDao {
	public int insertBoard(HashMap<String, Object> params);
	public int updateBoard(HashMap<String, Object> params);	
	public int deleteBoard(int board_idx);
	public HashMap<String, Object> selectOneBoard(int board_idx);
	public List<HashMap<String, Object>> selectBoardList(int board_code);
	public List<HashMap<String, Object>> selectAllBoard();
	public List<HashMap<String, Object>> select_by_name(String name);
	public List<HashMap<String, Object>> select_by_title(String title);
	public List<HashMap<String, Object>> select_by_keyword(String keyword);
	public List<HashMap<String, Object>> select_by_boastnum();
}
