package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface ILikeCountCheckDao {
	public int insertLikeCountCheck(HashMap<String, Object> params);
	public HashMap<String, Object> selectOneLikeCountCheck(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectUserLikeCountCheck(int userIdx);
}
