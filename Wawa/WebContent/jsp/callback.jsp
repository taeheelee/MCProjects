<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("xeQmcW9xQTAgeEhBztgr",
			"http://localhost:8080/Wawa/jsp/callback.jsp");
	// ���� ��ū �� ���
// 	alert(naver_id_login.oauthParams.access_token);
	// ���̹� ����� ������ ��ȸ
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// ���̹� ����� ������ ��ȸ ���� ������ ������ ó���� callback function
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
		form.target = "opener"; // Ÿ���� �θ�â���� ����
	    
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