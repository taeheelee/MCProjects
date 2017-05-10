package interface_service;

import java.util.HashMap;
import java.util.List;

public interface IRepleService {
	public boolean writeReple(int boardIdx, String nickname, String content, int pIdx);
	public boolean updateReple(int repleIdx, String content);
	public boolean updateRepleDelete(int repleIdx);
	public boolean deleteReple(int repleIdx);
	public List<HashMap<String, Object>> selectGroupCode(int groupCode);
	public HashMap<String, Object> selectOne(int repleIdx);
	public List<HashMap<String, Object>> selectRepleList(int boardIdx);
	public List<HashMap<String, Object>> select_by_nickname(String nickname);
}
