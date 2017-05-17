package interface_service;

import java.util.HashMap;
import java.util.List;

public interface ILikeCountCheckService {
	public boolean insertLikeCountCheck(int userIdx, int boardIdx);
	public HashMap<String, Object> selectOneLikeCountCheck(int userIdx, int boardIdx);
	public List<HashMap<String, Object>> selectUserLikeCountCheck(int userIdx);
}
