package model;

public class Management {
	private int management_idx;
	private int code;
	private String date;
	private int weight;
	public int getManagement_idx() {
		return management_idx;
	}
	public void setManagement_idx(int management_idx) {
		this.management_idx = management_idx;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
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
		return "Management [management_idx=" + management_idx + ", code=" + code + ", date=" + date + ", weight="
				+ weight + "]";
	}
	
	
}
