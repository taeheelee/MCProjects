package interface_dao;

import java.util.List;

public interface ImageDao {
	public boolean insertImage(ImageDao Image);
	public boolean updateImage(ImageDao Image);
	public boolean deleteImage(int img_idx);
	public ImageDao selectOne(int img_idx);
	public List<ImageDao> selectAll();
}
