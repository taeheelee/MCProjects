package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import interface_dao.IManagementDao;
import interface_service.IManagementService;
import model.Management;

@Service
public class ManagementService implements IManagementService {

	@Autowired
	private IManagementDao dao;
	
	@Override
	public boolean insertManagement(model.Management model) {
//		HashMap<String, Object> date = new HashMap<>();

//		date.put(Management.IDX, params.get("idx"));
//		date.put(Management.DATE, params.get("date"));
//		date.put(Management.WEIGHT, params.get("weight"));
		int result = dao.insertManagement(model);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateWeight(model.Management model) {
		// TODO Auto-generated method stub
		int result = dao.updateWeight(model);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateManagement(model.Management model) {
//		HashMap<String, Object> date = new HashMap<>();

//		date.put("managementIdx", params.get("managementIdx"));
//		date.put(Management.DATE, params.get("date"));
//		date.put(Management.WEIGHT, params.get("weight"));
		int result = dao.updateManagement(model);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteManagement(int managementIdx) {
		int result = dao.deleteManagement(managementIdx);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public model.Management selectOne(int managementIdx) {
//		HashMap<String, Object> params = new HashMap<>();
		model.Management model = new model.Management();
		model = dao.selectOne(managementIdx);
		return model;
	}

	@Override
	public List<model.Management> selectList(String id) {
		List<model.Management> list = dao.selectList(id);
		return list;
	}

	@Override
	public int selectIdx(Management model) {
		// TODO Auto-generated method stub
		int managementIdx = dao.selectIdx(model);
		return managementIdx;
	}

	@Override
	public List<Management> selectAllHealth(int idx) {
		// TODO Auto-generated method stub
		//강아지 인덱스 받아서 모든 관리 리스트 가져오기
		List<Management> list = dao.selectAllHealth(idx);
		List<Management> recentList = new ArrayList<>();
		int lastIdx = list.size();
		if(lastIdx <= 5){
			for(Management m : list){
				recentList.add(m);
			}
		}else {
			for(int i = lastIdx-5; i < lastIdx; i ++){
				recentList.add(list.get(i));
			}			
		}
		return recentList;
	}

	@Override
	public List<Management> selectDate(Management model) {
		// TODO Auto-generated method stub
		return dao.selectDate(model);
	}

	@Override
	public int selectLastIdx(int idx) {
		// TODO Auto-generated method stub
		return dao.selectLastIdx(idx);
	}

	//public double selectRecentWeight(Date date);
	@Override
	public double selectRecentWeight(Date date) {
		// TODO Auto-generated method stub
		return dao.selectRecentWeight(date);
	}

	@Override
	public Date selectRecentDate(int idx) {
		// TODO Auto-generated method stub
		return dao.selectRecentDate(idx);
	}
	
	public String getToday() { // 현재 날짜 리턴
		// TODO Auto-generated method stub
		SimpleDateFormat fm1 = new SimpleDateFormat("yyyy년MM월dd일");
		String date = fm1.format(new Date());
		return date;
	}

}
