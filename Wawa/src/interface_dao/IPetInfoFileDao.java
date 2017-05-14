package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IPetInfoFileDao {
	public int insertPetInfoFile(HashMap<String, Object> params);
	public int updatePetInfoFile(HashMap<String, Object> params);
	public int deletePetInfoFile(int id);
	public HashMap<String, Object> selectOne(int id);
	public List<HashMap<String, Object>> selectAll();
}
