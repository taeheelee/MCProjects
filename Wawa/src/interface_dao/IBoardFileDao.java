package interface_dao;

import java.util.HashMap;
import java.util.List;


public interface IBoardFileDao {
	public int insertBoardFile(HashMap<String, Object> params);
	public int updateBoardFile(HashMap<String, Object> params);
	public int deleteBoardFile(int id);
	public HashMap<String, Object> selectOne(int id);
	public List<HashMap<String, Object>> selectAll();
}
