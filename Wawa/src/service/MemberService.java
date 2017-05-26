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
			String sex, String phone, int adminCheck, String email,
			String question1, String answer1,
			String question2, String answer2) {
		// TODO Auto-generated method stub
		UserInfo chk = dao.selectOneUserInfo(id);
		if (chk == null){
			HashMap<String, Object> userinfo = new HashMap<>();
			userinfo.put("id", id);
			userinfo.put("password", password);
			userinfo.put("nickname", nickname);
			userinfo.put("sex", sex);
			userinfo.put("phone", phone);
			userinfo.put("adminCheck", adminCheck);
			userinfo.put("email", email);
			userinfo.put("question1", question1);
			userinfo.put("answer1", answer1);
			userinfo.put("question2", question2);
			userinfo.put("answer2", answer2);
			return dao.insertUserInfo(userinfo);
		}else{
			return 0;
		}
	}

	@Override
	public boolean modifyInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> params = new HashMap<>();
		params.put(commons.Constant.UserInfo.ID, userInfo.getId());
		params.put(commons.Constant.UserInfo.NICKNAME, userInfo.getNickname());
		params.put(commons.Constant.UserInfo.PASSWORD, userInfo.getPassword());
		params.put(commons.Constant.UserInfo.PHONE, userInfo.getPhone());
		params.put(commons.Constant.UserInfo.SEX, userInfo.getSex());
		params.put(commons.Constant.UserInfo.EMAIL, userInfo.getEmail());
		params.put(commons.Constant.UserInfo.QUESTION1, userInfo.getQuestion1());
		params.put(commons.Constant.UserInfo.ANSWER1, userInfo.getAnswer1());
		params.put(commons.Constant.UserInfo.QUESTION2, userInfo.getQuestion2());
		params.put(commons.Constant.UserInfo.ANSWER2, userInfo.getAnswer2());
		int result = dao.updateUserInfo(params);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteMember(String id) {
		// TODO Auto-generated method stub
		int result = dao.deleteUserInfo(id);
		if(result > 0)
			return true;
		else
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

	@Override
	public boolean phonenumCheck(String phone) {
		// TODO Auto-generated method stub
		if(dao.phonenumCheck(phone) == null)
			return true;
		else 
			return false;
	}
	
	@Override
	public boolean emailCheck(String email) {
		// TODO Auto-generated method stub
		if(dao.emailCheck(email) == null)
			return true;
		else 
			return false;
	}

	@Override
	public int adminCheck(String id) {
		// TODO Auto-generated method stub
		return dao.adminCheck(id);
	}

	@Override
	public String selectByEmailAndName(String nickname, String email) {
		// TODO Auto-generated method stub
		HashMap<String, Object> userinfo = new HashMap<>();
		userinfo.put("nickname", nickname);
		userinfo.put("email", email);
		return (String) dao.selectByEmailAndName(userinfo);
	}

	@Override
	public String selectByPhoneAndName(String nickname, String phone) {
		// TODO Auto-generated method stub
		HashMap<String, Object> userinfo = new HashMap<>();
		userinfo.put("nickname", nickname);
		userinfo.put("phone", phone);
		return (String) dao.selectByPhoneAndName(userinfo);
	}

	@Override
	public boolean Questioncheck(String question1, String answer1, String question2, String answer2) {
		// TODO Auto-generated method stub
		HashMap<String, Object> questions = new HashMap<>();
		questions.put("question1", question1);
		questions.put("answer1", answer1);
		questions.put("question2", question2);
		questions.put("answer2", answer2);
		if(dao.Questioncheck(questions) == null){
			//그런 문제가 없는거네
			return false;
		}else {
			return true;
		}
	}

}
