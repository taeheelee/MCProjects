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
<script type="text/javascript">
	$(document).ready(function() {
		$('#login_ck').click(function() {
			$.ajax({
				url : "idCheck.do",
				type : "GET",
				data : 'nickname=' + inputNickname,
				dataType : 'json',
				success : function(data) {
					if (data.result) {
						$('#nickError').html('<font color="green">사용가능</font>');
						statusOfNickname = true;
					} else {
						$('#nickError').html('<font color="red">중복</font>');
						statusOfNickname = false;
					}
				},
				error : function() {
					statusOfNickname = false;
					alert('에러발생');
				}
			});
		});
	});
</script>

<script>
window.fbAsyncInit = function() {
	FB.init({
		appId : '826473040851490',
		xfbml : true,
		version : 'v2.9'
	});
	FB.AppEvents.logPageView();
};

function facebook_btn() {
	FB.login(function(response) {
		if (response.authResponse) {
			console.log('Welcome!  Fetching your information.');
			FB.api('/me?fields=id, name, email, gender', function(response) {
				var person = {
						id : response.id,
						nickname : response.name,
						email : response.email,
						sex : response.gender
				}
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "naverLogin.do");
				for(var key in person) {
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("value", person[key]);
					hiddenField.setAttribute("name", key);
					form.appendChild(hiddenField);
				}
				document.body.appendChild(form);
				form.submit();
			});
		} else {
			console.log('User cancelled login or did not fully authorize.');
		}
	}, { scope : 'public_profile, email', return_scopes : true });
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>


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
						<input type="submit" value="LOGIN" id="login_ck"
							style="width: 400px; height: 50px;">
					</form>
					<!-- 네이버아이디로로그인 버튼 노출 영역 -->
					<br> 아직 계정이 없으신가요?? &nbsp; <a href="joinForm.do"> 회원가입하기 </a><br>
					<br>
					<br>
					<a href="javascript:facebook_btn();"><img src="img/facebook_loginBtn.png"></a>
					<br>
					<div id="naver_id_login" style="display: none"></div>
					<span onclick="document.getElementById('naver_id_login_anchor').click();")>
					<img style="margin-top: 10px; cursor:pointer" src="img/naver_loginBtn.png">
					</span>
					<br> 
				</div>
			</div>
		</div>
	</div>
	<!-- End product widget area -->

	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("xeQmcW9xQTAgeEhBztgr",
				"http://localhost:8080/Wawa/jsp/callback.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 50);
		naver_id_login.setDomain("http://localhost:8080/Wawa/");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>

</body>
</html>