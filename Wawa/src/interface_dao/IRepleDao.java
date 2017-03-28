package interface_dao;

import java.util.List;

public interface IRepleDao {
	public boolean insertReple(IRepleDao reple);
	public boolean updateReple(IRepleDao reple);
	public boolean deleteReple(int board_code);
	public IRepleDao selectOne(String nickname);
	public List<IRepleDao> selectAll();
	public List<IRepleDao> select_by_nickname();
}
