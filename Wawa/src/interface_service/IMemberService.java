package interface_service;

import model.UserInfo;

public interface IMemberService {
	public int join(String id, String password, String nickname,
			String sex, String phone, int adminCheck, String email,
			String question1, String answer1,
			String question2, String answer2);
	public boolean modifyInfo(UserInfo userInfo);
	public boolean deleteMember(String id);
	public boolean loginMember(String id, String pw);
	public UserInfo getMember(String id);
	public boolean checkId(String id);
	public boolean nicknameCheck(String nickname);
	public int adminCheck(String id);
}
