package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import commons.Constant.Management;
import interface_dao.IManagementDao;
import interface_service.IManagementService;

@Service
public class ManagementService implements IManagementService {

	@Autowired
	private IManagementDao dao;
	
	@Override
	public boolean insertManagement(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		HashMap<String, Object> date = new HashMap<>();

		date.put(Management.IDX, params.get("idx"));
		date.put(Management.DATE, params.get("date"));
		date.put(Management.WEIGHT, params.get("weight"));
		int result = dao.insertManagement(date);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateManagement(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		HashMap<String, Object> date = new HashMap<>();

		date.put("managementIdx", params.get("managementIdx"));
		date.put(Management.DATE, params.get("date"));
		date.put(Management.WEIGHT, params.get("weight"));
		int result = dao.updateManagement(date);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteManagement(int managementIdx) {
		// TODO Auto-generated method stub

		int result = dao.deleteManagement(managementIdx);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public HashMap<String, Object> selectOne(int managementIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params = dao.selectOne(managementIdx);
		
		return params;
	}

	@Override
	public List<HashMap<String, Object>> selectList(int idx) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.selectList(idx);
		
		return list;
	}

}
