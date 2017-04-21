package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import interface_dao.IUserInfoDao;
import interface_service.IMemberService;
import model.UserInfo;
@Service
public class MemberService implements IMemberService{
	@Autowired
	private IUserInfoDao dao;
	@Override
	public int join(String id, String password, String nickname,
			String sex, String phoneNum, int adminCheck, String email) {
		// TODO Auto-generated method stub
		System.out.println(id  + "if 들어가기 전");
		UserInfo chk = dao.selectOneUserInfo(id);
		if (chk == null){
			HashMap<String, Object> userinfo = new HashMap<>();
			userinfo.put("id", id);
			userinfo.put("password", password);
			userinfo.put("nickname", nickname);
			userinfo.put("sex", sex);
			userinfo.put("phoneNum", phoneNum);
			userinfo.put("adminCheck", adminCheck);
			userinfo.put("email", email);
			System.out.println(userinfo + "해쉬맵은 정상?");
			return dao.insertUserInfo(userinfo);
		}else{
			return 0;
		}
	}

	@Override
	public boolean modifyInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMember(String id, String pw) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean loginMember(String id, String pw) {
		// TODO Auto-generated method stub
		UserInfo userInfo = dao.selectOneUserInfo(id);

		if(userInfo.getPassword().equals(pw)){
			return true;
		}
		return false;
	}

	@Override
	public UserInfo getMember(String id) {
		// TODO Auto-generated method stub
		UserInfo userInfo = dao.selectOneUserInfo(id);
		return userInfo;
	}

	@Override
	public boolean checkId(String id) {
		// TODO Auto-generated method stub
//		System.out.println(userinfoDao.idCheck(id) + "서비스");
		if(dao.idCheck(id) == null) 
			return true;
		else 
			return false;
	}

	@Override
	public boolean nicknameCheck(String nickname) {
		// TODO Auto-generated method stub
		if(dao.nicknameCheck(nickname) == null) 
			return true;
		else 
			return false;
	}
}
