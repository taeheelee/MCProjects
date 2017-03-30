package model;

public class Image {
	private int imgIdx;
	private String physicalName;
	private String name;
	private String path;
	public int getImgIdx() {
		return imgIdx;
	}
	public void setImgIdx(int imgIdx) {
		this.imgIdx = imgIdx;
	}
	public String getPhysicalName() {
		return physicalName;
	}
	public void setPhysicalName(String physicalName) {
		this.physicalName = physicalName;
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
		return "Image [imgIdx=" + imgIdx + ", physicalName=" + physicalName + ", name=" + name + ", path=" + path + "]";
	}

	
}
