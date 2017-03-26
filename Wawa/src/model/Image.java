package model;

public class Image {
	private int img_idx;
	private String physical_name;
	private String name;
	private String path;
	public int getImg_idx() {
		return img_idx;
	}
	public void setImg_idx(int img_idx) {
		this.img_idx = img_idx;
	}
	public String getPhysical_name() {
		return physical_name;
	}
	public void setPhysical_name(String physical_name) {
		this.physical_name = physical_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Image [img_idx=" + img_idx + ", physical_name=" + physical_name
				+ ", name=" + name + ", path=" + path +"]";
	}
}
