package service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import commons.Constant;
import interface_dao.IMedicalDao;
import interface_dao.IPetInfoDao;
import interface_service.IPetinfoService;

@Component
public class PetInfoService implements IPetinfoService {
	
	@Autowired
	IPetInfoDao dao;
	
	@Autowired
	IMedicalDao mDao;
	
	@Override
	public boolean insertPetInfo(int idx, String resist, String id, String name, String kind, Date birthday, String neutral,
			double weight, String sex, Date groomingStart, String groomingPeriod) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.PetInfo.RESIST, resist);
		params.put(Constant.PetInfo.ID, id);
		params.put(Constant.PetInfo.NAME, name);
		params.put(Constant.PetInfo.KIND, kind);
		params.put(Constant.PetInfo.BIRTHDAY, birthday);
		params.put(Constant.PetInfo.NEUTRAL, neutral);
		params.put(Constant.PetInfo.WEIGHT, weight);
		params.put(Constant.PetInfo.SEX, sex);
		params.put(Constant.PetInfo.GROOMINGSTART, groomingStart);
		int gp = Integer.parseInt(groomingPeriod);
		params.put(Constant.PetInfo.GROOMINGPERIOD, gp);
		
		int result = dao.insertPetInfo(params);
		HashMap<String, Object> pet = dao.selectByName(params);
		int petIdx = (int)pet.get("idx");
		int arr[] = {101, 102, 103, 104, 105, 201, 202, 203, 204, 205, 301, 302, 303, 304, 305, 401, 402, 403, 404, 405};
		String defaultDate = "0000-00-00";
		for(int i = 0; i < arr.length; i ++){
			HashMap<String, Object> tmp = new HashMap<>();
			tmp.put("idx", petIdx);
			tmp.put("vaccineCode", arr[i]);
			tmp.put("realShotDate", defaultDate);
			mDao.insertRealShotDate(tmp);
		}
	
		if(result > 0)
			return true;
		else
			return false;
	}

	
	@Override
	public boolean updatePetInfo(int idx, String resist, String id, String name, String kind, Date birthday, String neutral,
			double weight, String sex, Date groomingStart, int groomingPeriod) {
		// TODO Auto-generated method stub
		//수정할 강아지 목록을 받아와서 출력해주고
		HashMap<String, Object> tmp = dao.selectOne(idx);
		//변경사항은 변경되면 새로운 params에 받고  변경되지 않은 내용들은 SelectOne의 내용 그대로
		HashMap<String, Object> params = new HashMap<>();
		
		params.put(Constant.PetInfo.RESIST, resist);
		params.put(Constant.PetInfo.ID, id);
		params.put(Constant.PetInfo.NAME, name);
		params.put(Constant.PetInfo.KIND, kind);
		params.put(Constant.PetInfo.BIRTHDAY, birthday);
		params.put(Constant.PetInfo.NEUTRAL, neutral);
		params.put(Constant.PetInfo.WEIGHT, weight);
		params.put(Constant.PetInfo.SEX, sex);
		params.put(Constant.PetInfo.GROOMINGSTART, groomingStart);
		params.put(Constant.PetInfo.GROOMINGPERIOD, groomingPeriod);
		
		int result = dao.updatePetInfo(params);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deletePetInfo(int idx) {
		// TODO Auto-generated method stub
		int result = dao.deletePetInfo(idx);
		if(result > 0)
			return true;
		else
			return false;
	}
	@Override
	public List<HashMap<String, Object>> selectPetList(String id) {
		// TODO Auto-generated method stub
		return dao.selectPetList(id);
	}

	@Override
	public HashMap<String, Object> selectOne(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.selectByName(params);
	}

	@Override
	public HashMap<String, Object> selectByname(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.selectByName(params);
	}

}
