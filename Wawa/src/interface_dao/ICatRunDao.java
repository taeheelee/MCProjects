package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface ICatRunDao {
	public int insertCat(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectAll();
}
