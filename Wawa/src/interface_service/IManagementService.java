package interface_service;

import java.util.HashMap;
import java.util.List;

public interface IManagementService {
	public boolean insertManagement(HashMap<String, Object> params);
	public boolean updateManagement(HashMap<String, Object> params);
	public boolean deleteManagement(int managementIdx);

	public HashMap<String, Object> selectOne(int managementIdx);
	
	public List<HashMap<String, Object>> selectList(int idx);
}
