package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import interface_dao.IUserInfoDao;
import interface_service.IJoinService;
import model.UserInfo;

public class JoinService implements IJoinService{

	@Autowired
	private IUserInfoDao dao;
	@Override
	public int join(String id, String password, String nickname,
			String sex, String phoneNum, int adminCheck, String email) {
		// TODO Auto-generated method stub
		HashMap<String, Object> userinfo = new HashMap<>();
		userinfo.put("id", id);
		userinfo.put("password", password);
		userinfo.put("nickname", nickname);
		userinfo.put("sex", sex);
		userinfo.put("phoneNum", phoneNum);
		userinfo.put("adminCheck", adminCheck);
		userinfo.put("email", email);
		return dao.insertUserInfo(userinfo);
	}

	
	
}
