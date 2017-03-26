package model;

public class UserInfo {
	private int idx;
	private String id;
	private String password;
	private String nickname;
	private String sex;
	private String phoneNum;
	private int admin_check;
	private String email;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public int getAdmin_check() {
		return admin_check;
	}
	public void setAdmin_check(int admin_check) {
		this.admin_check = admin_check;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "UserInfo [idx=" + idx + ", id=" + id + ", password=" + password + ", nickname=" + nickname + ", sex="
				+ sex + ", phoneNum=" + phoneNum + ", admin_check=" + admin_check + ", email=" + email + "]";
	}
}
