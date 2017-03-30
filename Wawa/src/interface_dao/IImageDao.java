package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IImageDao {
	public int insertImage(HashMap<String, Object> params);
	public int updateImage(HashMap<String, Object> params);
	public int deleteImage(int imgIdx);
	public HashMap<String, Object> selectOneImage(int imgIdx);
	public List<HashMap<String, Object>> selectAllImage();
}
