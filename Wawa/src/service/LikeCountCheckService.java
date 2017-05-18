package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import interface_dao.ILikeCountCheckDao;
import interface_service.ILikeCountCheckService;

@Service
public class LikeCountCheckService implements ILikeCountCheckService{
	@Autowired
	private ILikeCountCheckDao likeDao;

	@Override
	public boolean insertLikeCountCheck(int userIdx, int boardIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("userIdx", userIdx);
		params.put("boardIdx", boardIdx);
		int result = likeDao.insertLikeCountCheck(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public HashMap<String, Object> selectOneLikeCountCheck(int userIdx, int boardIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("userIdx", userIdx);
		params.put("boardIdx", boardIdx);
		return likeDao.selectOneLikeCountCheck(params);
	}

	@Override
	public List<HashMap<String, Object>> selectUserLikeCountCheck(int userIdx) {
		// TODO Auto-generated method stub
		return likeDao.selectUserLikeCountCheck(userIdx);
	}

}
