package interface_dao;

import java.util.List;

public interface UserInfoDao {
	public boolean insertUserInfo(UserInfoDao userinfo);
	public boolean updateUserInfo(UserInfoDao userinfo);
	public boolean deleteUserInfo(String id);
	public UserInfoDao selectOneUserInfo(String id);
	public List<UserInfoDao> selectAllUserInfo();
}
