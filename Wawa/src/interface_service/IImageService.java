package interface_service;

import java.util.HashMap;
import java.util.List;

public interface IImageService {
	public boolean insertImage(HashMap<String, Object> params);
	public boolean updateImage(HashMap<String, Object> params);
	public boolean deleteImage(int imgIdx);
	public HashMap<String, Object> selectOneImage(int imgIdx);
	public List<HashMap<String, Object>> selectAllImage();
}
