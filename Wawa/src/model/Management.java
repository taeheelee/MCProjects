package model;

import java.util.Date;

public class Management {
	private int managementIdx;
	private int idx;
	private Date date;
	private double weight;
	
	public int getManagementIdx() {
		return managementIdx;
	}
	public void setManagementIdx(int managementIdx) {
		this.managementIdx = managementIdx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
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
