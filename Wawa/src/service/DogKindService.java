package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import commons.Constant;
import interface_dao.IDogKindDao;
import interface_service.IDogKindService;

@Component
public class DogKindService implements IDogKindService{
	@Autowired
	IDogKindDao dao;

	@Override
	public boolean insertDogKind(String kind, String dogSize, double adultWeight) {
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.DogKind.KIND, kind);
		params.put(Constant.DogKind.DOGSIZE, dogSize);
		params.put(Constant.DogKind.ADULTWEIGHT, adultWeight);
		int result = dao.insertDogKind(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateDogKind(String kind, String dogSize, double adultWeight) {
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.DogKind.KIND, kind);
		params.put(Constant.DogKind.DOGSIZE, dogSize);
		params.put(Constant.DogKind.ADULTWEIGHT, adultWeight);
		int result = dao.updateDogKind(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteDogKind(String kind) {
		HashMap<String, Object> params = new HashMap<>();
		int result = dao.deleteDogKind(kind);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public HashMap<String, Object> selectOneDogKind(String kind) {
		HashMap<String, Object> params = dao.selectOneDogKind(kind);
		return params;
	}

	@Override
	public List<HashMap<String, Object>> selectAllDogKind() {
		List<HashMap<String, Object>> list = dao.selectAllDogKind();
		return list;
	}

}
