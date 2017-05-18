package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import interface_dao.ICatRunDao;
import interface_service.ICatRunService;

@Service
public class CatRunService implements ICatRunService{

	@Autowired
	private ICatRunDao catDao;
	
	@Override
	public boolean insertCat(String name, int score) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("name", name);
		params.put("score", score);
		int result = catDao.insertCat(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public List<HashMap<String, Object>> selectAll() {
		// TODO Auto-generated method stub
		return catDao.selectAll();
	}

}
