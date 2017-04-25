package interface_service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface IPetinfoService {
	public boolean insertPetInfo(int idx, String resist, String id, String name, String kind, 
			Date birthday, String neutral, double weight, String sex, 
			Date groomingStart, String groomingPeriod);
	public boolean updatePetInfo(int idx, String resist, String id, String name, String kind, 
			Date birthday, String neutral, double weight, String sex, 
			Date groomingStart, int groomingPeriod);
	public boolean deletePetInfo(int idx);
	public List<HashMap<String, Object>> selectPetList(String id);


}
