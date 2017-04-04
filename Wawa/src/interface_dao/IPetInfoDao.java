package interface_dao;

import java.util.HashMap;
import java.util.List;


public interface IPetInfoDao {
	public int insertPetInfo(HashMap<String, Object> params);
	public int updatePetInfo(HashMap<String, Object> params);
	public int deletePetInfo(int idx);
	public HashMap<String, Object> selectOne(int idx);
	public List<HashMap<String, Object>> selectPetList(String id);
	public List<HashMap<String, Object>> selectAll();

}