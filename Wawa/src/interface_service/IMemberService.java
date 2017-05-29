package interface_service;

import java.util.HashMap;

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
	public boolean phonenumCheck(String phone);
	public boolean emailCheck(String email);
	public int adminCheck(String id);
	public String selectByEmailAndName(String nickname, String email);
	public String selectByPhoneAndName(String nickname, String phone);
	public boolean Questioncheck(String question1, String answer1, 
			String question2, String answer2, String id);
	public HashMap<String, Object> selectByNickname(String nickname);
	public int getIntFromQuestion(String str);
	public HashMap<String, Object> selectByNameId(String id, String nickname);
}
