package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IManagementDao {
	public int insertManagement(HashMap<String, Object> params);
	public int updateManagement(HashMap<String, Object> params);
	public int deleteManagement(int managementIdx);
	public HashMap<String, Object> selectOne(int managementIdx);
	public List<HashMap<String, Object>> selectList(int idx);
}
