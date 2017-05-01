package model;

public class Management {
	private int managementIdx;
	private int idx;
	private String date;
	private int weight;
	
	public int getManagementIdx() {
		return managementIdx;
	}
	public void setManagementIdx(int managementIdx) {
		this.managementIdx = managementIdx;
	}
	public int getIdx() {
		return idx;
	}
	public void setCode(int idx) {
		this.idx = idx;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}

	@Override
	public String toString() {
		return "managementIdx=" + managementIdx
				+ ",\tidx=" + idx + ",\tdate=" + date + ",\tweight="
				+ weight;
	}
	// '{ "name":"John", "age":30, "city":"New York"}'
}
