package interface_service;

import java.util.HashMap;
import java.util.List;

import model.Management;

public interface IManagementService {
	public boolean insertManagement(Management model);
	public boolean updateManagement(Management model);
	public boolean deleteManagement(int managementIdx);
	public Management selectOne(int managementIdx);
	public List<Management> selectList(String id);
}
