package model;

import java.util.Date;

public class PetInfo {
	private int idx;
	private String resist;
	private String id;
	private String name;
	private String kind;
	private Date birthday;
	private String neutral;
	private double weight;
	private String sex;
	private Date groomingStart;
	private int groomingPeriod;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getResist() {
		return resist;
	}
	public void setResist(String resist) {
		this.resist = resist;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getNeutral() {
		return neutral;
	}
	public void setNeutral(String neutral) {
		this.neutral = neutral;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getGroomingStart() {
		return groomingStart;
	}
	public void setGroomingStart(Date groomingStart) {
		this.groomingStart = groomingStart;
	}
	public int getGroomingPeriod() {
		return groomingPeriod;
	}
	public void setGroomingPeriod(int groomingPeriod) {
		this.groomingPeriod = groomingPeriod;
	}
	@Override
	public String toString() {
		return "PetInfo [idx=" + idx + ", resist=" + resist + ", id=" + id + ", name=" + name + ", kind=" + kind
				+ ", birthday=" + birthday + ", neutral=" + neutral + ", weight=" + weight + ", sex=" + sex
				+ ", groomingStart=" + groomingStart + ", groomingPeriod=" + groomingPeriod + "]";
	}
	
	
}
