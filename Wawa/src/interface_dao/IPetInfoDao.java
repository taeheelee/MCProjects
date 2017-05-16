package interface_dao;

import java.util.HashMap;
import java.util.List;

import org.codehaus.jackson.node.NodeCursor.Object;


public interface IPetInfoDao {
	public int insertPetInfo(HashMap<String, Object> params);
	public int updatePetInfo(HashMap<String, Object> params);
	public int updateWeight(HashMap<String, Object> params);
	public int deletePetInfo(int idx);
	public HashMap<String, Object> selectOne(int idx);
	public List<HashMap<String, Object>> selectPetList(String id);
	public List<HashMap<String, Object>> selectAll();
	public HashMap<String, Object> selectByName(HashMap<String, Object> params);
}