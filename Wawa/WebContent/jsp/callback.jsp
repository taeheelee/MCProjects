<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("xeQmcW9xQTAgeEhBztgr",
			"http://70.12.109.58:8080/Wawa/jsp/callback.jsp");
	// 접근 토큰 값 출력
// 	alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		var id = naver_id_login.getProfileData('id');
		var nickname = naver_id_login.getProfileData('nickname');
		var email = naver_id_login.getProfileData('email');
		var gender = naver_id_login.getProfileData('gender');
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("name", "myform");
		form.setAttribute("action", "../naverLogin.do");
		opener.window.name = "opener";
		form.target = "opener"; // 타켓을 부모창으로 설정
	    
		var inputId = document.createElement("input");
		inputId.setAttribute("type", "hidden");
		inputId.setAttribute("name", "id");
		inputId.setAttribute("value", id);
		form.appendChild(inputId);
		var inputNick = document.createElement("input");
		inputNick.setAttribute("type", "hidden");
		inputNick.setAttribute("name", "nickname");
		inputNick.setAttribute("value", nickname);
		form.appendChild(inputNick);
		var inputEmail = document.createElement("input");
		inputEmail.setAttribute("type", "hidden");
		inputEmail.setAttribute("name", "email");
		inputEmail.setAttribute("value", email);
		form.appendChild(inputEmail);
		var inputGender = document.createElement("input");
		inputGender.setAttribute("type", "hidden");
		inputGender.setAttribute("name", "sex");
		inputGender.setAttribute("value", gender);
		form.appendChild(inputGender);
		
		document.body.appendChild(form);
		form.submit();
		self.close();
	}
</script>
</head>
<body>
</body>
</html>