package interface_dao;

import java.util.HashMap;
import java.util.List;

import model.UserInfo;

public interface IUserInfoDao {
	public int insertUserInfo(HashMap<String, Object> params);
	public int updateUserInfo(HashMap<String, Object> params);
	public int deleteUserInfo(String id);
	public UserInfo selectOneUserInfo(String id);
	public List<HashMap<String, Object>> selectAllUserInfo();
	public List<HashMap<String, Object>> selectBoardList();
	public String idCheck(String id);
	public String nicknameCheck(String nickname);
	public HashMap<String, Object> phonenumCheck(String phone);
	public HashMap<String, Object> emailCheck(String email);
	public int adminCheck(String id);
	public String selectByEmailAndName(HashMap<String, Object> params);
	public String selectByPhoneAndName(HashMap<String, Object> params);
	public HashMap<String, Object> Questioncheck(HashMap<String, Object> params);
	public HashMap<String, Object> selectByNickname(String nickname);
}
