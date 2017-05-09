package interface_dao;

import java.util.Date;
import java.util.List;

import model.Management;

public interface IManagementDao {
	public int insertManagement(Management model);
	public int updateManagement(Management model);
	public int deleteManagement(int managementIdx);
	public Management selectOne(int managementIdx);
	public List<Management> selectList(String id);
	public int selectIdx(Management model);
}
