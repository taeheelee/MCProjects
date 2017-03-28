package interface_dao;

import java.util.List;

import model.Board;

public interface BoardDao {
	public int insertBoard(Board board);
	public int updateBoard(Board board);	
	public int deleteBoard(int board_idx);
	public Board selectOne(int board_idx);
	public List<Board> selectBoardList(int board_code);
	public List<Board> selectAll();
	public List<Board> select_by_name(String name);
	public List<Board> select_by_title(String title);
	public List<Board> select_by_keyword(String keyword);
	public List<Board> select_by_boastnum();
}
