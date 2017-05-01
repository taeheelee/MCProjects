package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import interface_dao.IBoardFileDao;
import interface_service.IBoardFileService;

@Service
public class BoardFileService implements IBoardFileService{

	@Autowired
	private IBoardFileDao fileDao;
	@Override
	public HashMap<String, Object> selectOne(int fileId) {
		// TODO Auto-generated method stub
		return fileDao.selectOne(fileId);
	}

}
