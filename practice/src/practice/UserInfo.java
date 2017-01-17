package practice;

public class UserInfo {
	private String id;
	private String password;
	
	public UserInfo() {
		id = new String();
		password = new String();	
	}
	public String getId() {	return id;	}
	public void setId(String id) {	this.id = id;	}
	public String getPassword() {	return password;	}
	public void setPassword(String password) {	this.password = password;	}
}
