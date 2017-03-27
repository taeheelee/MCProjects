package interface_dao;

import java.util.List;

public interface UserInfo {
	public boolean insertUserInfo(UserInfo userinfo);
	public boolean updateUserInfo(UserInfo userinfo);
	public boolean deleteUserInfo(String id);
	public UserInfo selectOneUserInfo(String id);
	public List<UserInfo> selectAllUserInfo();
}
