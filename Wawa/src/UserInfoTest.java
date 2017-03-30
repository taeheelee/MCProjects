import java.util.HashMap;

import dao.UserInfoDao;

public class UserInfoTest {
	public static void main(String[] args) {
		UserInfoDao dao = new UserInfoDao();
		
		for(HashMap<String, Object> u : dao.selectAllUserInfo()) {
			System.out.println(u);
		}
	}
}
