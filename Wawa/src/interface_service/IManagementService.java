package interface_service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import model.Management;
import model.PetInfo;

public interface IManagementService {
	public boolean insertManagement(Management model);
	public boolean updateManagement(Management model);
	public boolean updateWeight(Management model);
	public boolean deleteManagement(int managementIdx);
	public Management selectOne(int managementIdx);
	public List<Management> selectList(String id);
	public List<HashMap<String, Object>> selectListByIdx(PetInfo model);
	public int selectIdx(Management model);
	public List<Management> selectAllHealth(int idx);
	public Management selectDate(Management model);
	public int selectLastIdx(int idx);
	public double selectRecentWeight(Date date);
	public Date selectRecentDate(int idx);
	public String getToday(); // 오늘 날짜 받아오는애
}
