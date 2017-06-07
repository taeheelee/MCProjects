package interface_service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import model.MedicalManagement;

public interface IMedicalService {
//	public boolean insertRealShotDate(HashMap<String, Object> params);
//	public boolean updateRealShotDate(HashMap<String, Object> params);
//	public boolean deleteRealShotDate(HashMap<String, Object> params);
//	
//	//실제접종일 보기
//	public HashMap<String, Object> selectRealShotDate(HashMap<String, Object> params);
//	
//	//추천접종일 보기
//	public HashMap<String, Object> selectDueShotDate(HashMap<String, Object> params);
//	public List<HashMap<String, Object>> selectAllShotDate(int idx);
//	public HashMap<String, Object> selectDate(HashMap<String, Object> params);
//	public HashMap<String, Object> selectVc(HashMap<String, Object> params);
//	public HashMap<String, Object> calcDday(HashMap<String, Object> params);
//	public List<HashMap<String, Object>> selectShotdayByDate(int idx);
	
	
	
	
	
	////////////////////////////////////////////////////////////////
	public boolean insertMedicalcare(HashMap<String, Object> params);
//	public boolean updateMedicalcare(int petIdx, int vaccineCode, String vaccineType, int degree, Date realShotDate);
	public boolean deleteMedicalcare(int idx);
//	public HashMap<String, Object> selectOne(int idx);
//	public HashMap<String, Object> selectAdditionalVaccine(int petIdx, int vaccineCode, int degree);
	public List<HashMap<String, Object>> selectAdditionalVaccine(int petIdx, int vaccineCode, int degree);
	public List<HashMap<String, Object>> selectNextSchedules(int petIdx, int vaccineCode);
	public HashMap<String, Object> selectLastSchedules(int petIdx, int vaccineCode);
	public HashMap<String, Object> DDay(int petIdx);
	public HashMap<String, Object> DDayForHeader(int petIdx);
	public List<HashMap<String, Object>> selectPetMedicalcare(int petIdx);
	public HashMap<String, Object> selectVaccine(int petIdx);
	public HashMap<String, Object> calculateNextSchedules(int petIdx);
	public HashMap<String, Object> calculateNextSchedulesAdditional(int petIdx);
	
}

