<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("xeQmcW9xQTAgeEhBztgr", "http://localhost:8080/Wawa/");
  // ���� ��ū �� ���
//   alert(naver_id_login.oauthParams.access_token);
  // ���̹� ����� ������ ��ȸ
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // ���̹� ����� ������ ��ȸ ���� ������ ������ ó���� callback function
//   window.location.href = "naverLogin.do?id="+naver_id_login.getProfileData('id')+"&nickname="+naver_id_login.getProfileData('nickname')";
  var id ="as";
  function naverSignInCallback() {
	id = naver_id_login.getProfileData('id');
	alert(naver_id_login.getProfileData('nickname'));
  }
// 	window.location.href = "../naverLogin.do?id="+id;
</script>
</body>
</html>