package interface_service;

import model.UserInfo;

public interface IJoinService {

	public int join(String id, String password, String nickname,
			String sex, String phoneNum, int adminCheck, String email);
	
}