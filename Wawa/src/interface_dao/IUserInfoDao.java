package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IUserInfoDao {
	public int insertUserInfo(HashMap<String, Object> params);
	public int updateUserInfo(HashMap<String, Object> params);
	public int deleteUserInfo(String id);
	public HashMap<String, Object> selectOneUserInfo(String id);
	public List<HashMap<String, Object>> selectAllUserInfo();
}
