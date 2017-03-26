package interface_dao;

import java.util.List;

public interface Image {
	public boolean insertImage(Image Image);
	public boolean updateImage(Image Image);
	public boolean deleteImage(int img_idx);
	public Image selectOne(int img_idx);
	public List<Image> selectAll();
}
