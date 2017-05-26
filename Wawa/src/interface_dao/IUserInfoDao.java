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
	public String phonenumCheck(String phone);
	public String emailCheck(String email);
	public int adminCheck(String id);
}
