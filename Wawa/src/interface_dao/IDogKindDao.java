package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IDogKindDao {
	public int insertDogKind(HashMap<String, Object> params);
	public int updateDogKind(HashMap<String, Object> params);
	public int deleteDogKind(String kind);
	public HashMap<String, Object> selectOneDogKind(String nickname);
	public List<HashMap<String, Object>> selectAllDogKind();	
}
