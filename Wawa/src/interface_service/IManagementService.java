package interface_service;

import java.util.Date;
import java.util.List;

import model.Management;

public interface IManagementService {
	public boolean insertManagement(Management model);
	public boolean updateManagement(Management model);
	public boolean updateWeight(Management model);
	public boolean deleteManagement(int managementIdx);
	public Management selectOne(int managementIdx);
	public List<Management> selectList(String id);
	public int selectIdx(Management model);
	public List<Management> selectAllHealth(int idx);
	public List<Management> selectDate(Management model);
<<<<<<< HEAD
	public int selectLastIdx(int idx);
	public double selectRecentWeight(Date date);
	public Date selectRecentDate(int idx);
=======
	public String getToday(); // 오늘 날짜 받아오는애
>>>>>>> branch 'master' of https://github.com/taeheelee/MCProjects.git
}
