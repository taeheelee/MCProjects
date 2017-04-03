package interface_dao;

import java.util.HashMap;

public interface IMedicalDao {
	public int insertRealShotDate();
	public int updateRealShotDate();
	public int deleteRealShotDate();
	public HashMap<String, Object> selectRealShotDate(HashMap<String, Object> params);

}
