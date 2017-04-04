package interface_service;

import java.util.HashMap;
import java.util.List;

public interface IDogKindService {
	
	public boolean insertDogKind(String kind, String dogSize, double adultWeight);
	public boolean updateDogKind(String kind, String dogSize, double adultWeight);
	public boolean deleteDogKind(String kind);
	public HashMap<String, Object> selectOneDogKind(String kind);
	public List<HashMap<String, Object>> selectAllDogKind();
}
