package interface_service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface IMedicalService {
	public boolean insertRealShotDate(HashMap<String, Object> params);
	public boolean updateRealShotDate(HashMap<String, Object> params);
	public boolean deleteRealShotDate(HashMap<String, Object> params);
	
	//실제접종일 보기
	public HashMap<String, Object> selectRealShotDate(HashMap<String, Object> params);
	
	//추천접종일 보기
	public HashMap<String, Object> selectDueShotDate(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectAllShotDate(int idx);
	public HashMap<String, Object> selectDate(HashMap<String, Object> params);
	public HashMap<String, Object> selectVc(HashMap<String, Object> params);
}
