package interface_dao;

import java.util.List;

public interface Reple {
	public boolean insertReple(Reple reple);
	public boolean updateReple(Reple reple);
	public boolean deleteReple(int board_code);
	public Reple selectOne(String nickname);
	public List<Reple> selectAll();
	public List<Reple> select_by_nickname();
}
