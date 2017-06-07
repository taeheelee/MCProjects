package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IMedicalDao {
	public int insertRealShotDate(HashMap<String, Object> params);
	public int updateRealShotDate(HashMap<String, Object> params);
	public int deleteRealShotDate(HashMap<String, Object> params);
	public HashMap<String, Object> selectRealShotDate(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectAllShotDate(int idx);
	public HashMap<String, Object> selectDate(HashMap<String, Object> params);
	public HashMap<String, Object> selectVc(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectShotdayByDate(int idx);
	
	////////////////////////////////////////////////////////////////
	public int insertMedicalcare(HashMap<String, Object> params);
//	public int updateMedicalcare(HashMap<String, Object> params);
	public int deleteMedicalcare(int idx);
	public HashMap<String, Object> selectOne(int idx);
	public List<HashMap<String, Object>> selectAdditionalVaccine(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectNextSchedules(HashMap<String, Object> params);	
	public HashMap<String, Object> selectLastSchedules(HashMap<String, Object> params);
	public HashMap<String, Object> selectLastSchedulesOfAll(HashMap<String, Object> params);

	public List<HashMap<String, Object>> selectPetMedicalcare(int idx);
	public List<HashMap<String, Object>> selectVaccine(int idx);
//	public List<HashMap<String, Object>> select(int idx);
//	public List<HashMap<String, Object>> selectAll(int idx);
}
