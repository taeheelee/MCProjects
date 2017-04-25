package model;

public class UserInfo {
	private int idx;
	private String id;
	private String password;
	private String nickname;
	private String sex;
	private String phone;
	private int adminCheck;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAdminCheck() {
		return adminCheck;
	}
	public void setAdminCheck(int adminCheck) {
		this.adminCheck = adminCheck;
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
				+ sex + ", phone=" + phone + ", adminCheck=" + adminCheck + ", email=" + email + "]";
	}
}
