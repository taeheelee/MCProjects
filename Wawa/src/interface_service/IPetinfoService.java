package interface_service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface IPetinfoService {
	public boolean insertPetInfo(int idx, String resist, String id, String name, String kind, 
			Date birthday, String neutral, double weight, String sex, 
			Date groomingStart, String groomingPeriod, int mainPet, MultipartFile file);
	public boolean updatePetInfo(int idx, String resist, String id, String name, String kind, Date birthday, String neutral,
			double weight, String sex, Date groomingStart, String groomingPeriod, int mainPet, MultipartFile file);
	public boolean updateWeight(double weight, int idx);
			//SDate groomingStart, String groomingPeriod, int mainPet, MultipartFile file);
	public boolean deletePetInfo(int idx);
	public List<HashMap<String, Object>> selectPetList(String id);
//	public HashMap<String, Object> selectOne(HashMap<String, Object> params);
	public HashMap<String, Object> selectOne(int idx);
	public HashMap<String, Object> selectByname(HashMap<String, Object> params);
	public HashMap<String, Object> getAge(HashMap<String, Object> params);
	public HashMap<String, Object> selectFile(int fileId);
	public HashMap<String, Object> selectMainPet(String id);
}
