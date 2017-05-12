package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IRepleDao {
	public int insertReple(HashMap<String, Object> params);
	public int updateReple(HashMap<String, Object> params);
	public int updateRepleDelete(int repleIdx);
	public int deleteReple(int groupCode);
	public int deleteBoardReple(int boardIdx);
	public List<HashMap<String, Object>> selectGroupCode(int groupCode);
	public HashMap<String, Object> selectOne(int repleIdx);
	public List<HashMap<String, Object>> selectRepleList(int boardIdx);
	public List<HashMap<String, Object>> select_by_nickname(String nickname);
	
	public int updateGroup(HashMap<String, Object> params);
	public int increaseGroupSeq(HashMap<String, Object> params);
	public int decreaseGroupSeq(HashMap<String, Object> params);
	public int selectMax(int groupCode);
	public int selectParent(int parentNum);
	public int selectMaxParent(int parentNum);
}