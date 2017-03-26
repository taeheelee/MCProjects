package interface_dao;

import java.util.List;

public interface Board {
	public boolean insertBoard(Board board);
	public boolean updateBoard(Board board);	
	public boolean deleteBoard(int num);
	public Board selectOne(int board_idx);
	public List<Board> selectBoardList(int board_code);
	public List<Board> selectAll();
	public List<Board> select_by_name(String name);
	public List<Board> select_by_title(String title);
	public List<Board> select_by_keyword(String keyword);
	public List<Board> select_by_boastnum();
}
