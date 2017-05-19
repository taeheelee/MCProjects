package interface_dao;

import java.util.Date;
import java.util.List;

import model.Management;
import model.PetInfo;

public interface IManagementDao {
	public int insertManagement(Management model);
	public int updateManagement(Management model);
	public int updateWeight(Management model);
	public int deleteManagement(int managementIdx);
	public Management selectOne(int managementIdx);
	public List<Management> selectList(String id);
	public List<Management> selectListByIdx(PetInfo model);
	public int selectIdx(Management model);
	public int selectLastIdx(int idx);
	public double selectRecentWeight(Date date);
	public Date selectRecentDate(int idx);
	public List<Management> selectAllHealth(int idx);
	public Management selectDate(Management model);	
}
