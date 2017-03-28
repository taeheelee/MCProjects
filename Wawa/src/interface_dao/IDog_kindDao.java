package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IDog_kindDao {
	public int insertDog_kind(HashMap<String, Object> params);
	public int updateDog_kind(HashMap<String, Object> params);
	public int deleteDog_kind(String kind);
	public HashMap<String, Object> selectOneDog_kind(String nickname);
	public List<HashMap<String, Object>> selectAllDog_kind();	
}
