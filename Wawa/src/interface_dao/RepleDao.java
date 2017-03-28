package interface_dao;

import java.util.List;

public interface RepleDao {
	public boolean insertReple(RepleDao reple);
	public boolean updateReple(RepleDao reple);
	public boolean deleteReple(int board_code);
	public RepleDao selectOne(String nickname);
	public List<RepleDao> selectAll();
	public List<RepleDao> select_by_nickname();
}
