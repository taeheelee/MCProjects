package interface_dao;

import java.util.List;

public interface IUserInfoDao {
	public boolean insertUserInfo(IUserInfoDao userinfo);
	public boolean updateUserInfo(IUserInfoDao userinfo);
	public boolean deleteUserInfo(String id);
	public IUserInfoDao selectOneUserInfo(String id);
	public List<IUserInfoDao> selectAllUserInfo();
}
