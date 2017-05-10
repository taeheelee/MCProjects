<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>


	<div class="product-big-title-area">
		<div class="container">
			<div class="col-md-12">
				<div class="product-bit-title text-left">
					<h2>로그인</h2>
				</div>
			</div>
		</div>
	</div>

	<div class="product-widget-area">
		<div class="container">
			<div>
				<div class="col-md-12" style="text-align: center;">
					<br>
					<form action="login.do" method="post">
						<input type="text" id="id" placeholder="ID"
							style="width: 400px; height: 50px;" name="id"><br> <br>
						<input type="password" id="pw" placeholder="Password"
							style="width: 400px; height: 50px;" name="pw"><br> <br>
						<input type="submit" value="LOGIN"
							style="width: 400px; height: 50px;">
					</form>
					<!-- 네이버아이디로로그인 버튼 노출 영역 -->
					<br>
					아직 계정이 없으신가요?? &nbsp; <a href="joinForm.do"> 회원가입하기 </a><br><br>
					<div id="naver_id_login"></div>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	<!-- End product widget area -->

	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("xeQmcW9xQTAgeEhBztgr","http://localhost:8080/Wawa/jsp/callback.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 50);
		naver_id_login.setDomain("http://localhost:8080/Wawa/");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>

</body>
</html>