package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface ImageDao {
	public int insertImage(HashMap<String, Object> params);
	public int updateImage(HashMap<String, Object> params);
	public int deleteImage(int img_idx);
	public HashMap<String, Object> selectOne(int img_idx);
	public List<HashMap<String, Object>> selectAll();
}
