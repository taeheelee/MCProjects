package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IRepleDao {
	public int insertReple(HashMap<String, Object> params);
	public int updateReple(HashMap<String, Object> params);
	public int deleteReple(int repleIdx);
	public HashMap<String, Object> selectOne(int repleIdx);
	public List<HashMap<String, Object>> selectAll();
	public List<HashMap<String, Object>> select_by_nickname(String nickname);
}