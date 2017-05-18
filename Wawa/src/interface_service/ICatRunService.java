package interface_service;

import java.util.HashMap;
import java.util.List;

public interface ICatRunService {
	public boolean insertCat(String name, int score);
	public List<HashMap<String, Object>> selectAll();
}
