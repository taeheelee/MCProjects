package interface_service;

import java.util.HashMap;

public interface IManagementService {
	public boolean insertManagement(HashMap<String, Object> params);
	public boolean updateManagement(HashMap<String, Object> params);
	public int deleteManagement(int managementIdx);

}
