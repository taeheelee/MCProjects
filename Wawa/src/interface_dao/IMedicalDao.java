package interface_dao;

import java.util.HashMap;

public interface IMedicalDao {
	public int insertRealShotDate(HashMap<String, Object> params);
	public int updateRealShotDate(HashMap<String, Object> params);
	public int deleteRealShotDate(HashMap<String, Object> params);
	public HashMap<String, Object> selectRealShotDate(HashMap<String, Object> params);

}
