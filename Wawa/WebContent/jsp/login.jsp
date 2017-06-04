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
		if ('${isLogin}' != '')
			alert('${isLogin}');
		if ('${isJoin}' != '')
			alert('${isJoin}');
		$('#login_ck').click(function() {
			if ($('#id').val() == '' && $('#pw').val() == '') {
				alert('ID를 입력해주세요');

			} else if ($('#pw').val() == '') {
				alert('비밀번호를 입력해주세요');
			} else {
				$('#login_ck').attr('type', 'submit');
			}
		});

		$('#find_id').click(function(){
			location.href='findIdForm.do'; 
		});
		
		$('#find_pass').click(function(){
			location.href='findPassForm.do'; 
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
		FB.login(
			function(response) {
				if (response.authResponse) {
					console.log('Welcome!  Fetching your information.');
						FB.api(
							'/me?fields=id, name, email, gender',
							function(response) {
								var person = {
									id : response.id,
									nickname : response.name,
									email : response.email,
									sex : response.gender
								}
								var form = document.createElement("form");
								form.setAttribute("method", "post");
								form.setAttribute("action", "naverLogin.do");
								for ( var key in person) {
									var hiddenField = document.createElement("input");
									hiddenField.setAttribute("type", "hidden");
									hiddenField.setAttribute("value", person[key]);
									hiddenField.setAttribute("name",key);
									form.appendChild(hiddenField);
								}
								document.body.appendChild(form);
								form.submit();
						});
				} else {
					console.log('User cancelled login or did not fully authorize.');
				}
			}, {
				scope : 'public_profile, email',
				return_scopes : true
			});
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

<!-- 구글 로그인 스크립트 -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script>
	var googleUser = {};
	var startApp = function() {
		gapi.load('auth2',
			function() {
				// Retrieve the singleton for the GoogleAuth library and set up the client.
				auth2 = gapi.auth2.init({
					client_id : '283762508474-hqasfntcb8j5fr2cejmtn06ihd6j4j1f.apps.googleusercontent.com',
					cookiepolicy : 'single_host_origin',
					// Request scopes in addition to 'profile' and 'email'
					//scope: 'additional_scope'
				});
			attachSignin(document.getElementById('customBtn'));
		});
	};

	function attachSignin(element) {
		console.log(element.id);
		alert('attachSignin 진입' + element.id);
		auth2.attachClickHandler(element, {}, function(googleUser) {
			alert('attachClickHandler 진입');
			var id = googleUser.getBasicProfile().getId();
			var name = googleUser.getBasicProfile().getName();
			var img = googleUser.getBasicProfile().getImageUrl();
			var email = googleUser.getBasicProfile().getEmail();
			//           var user = {id : id,
			//                 name : name,
			//                 img : img,
			//                 email : email
			//              };
			//           var jsontext = JSON.stringify(user); 
			//           alert(jsontext);
			//           alert(user.name);
			//           alert(googleUser.getBasicProfile().getName());

			$.ajax({
				url : 'googleLogin.do',
				type : 'POST',
				dataType : 'text',
				data : {
					id : id,
					name : name,
					img : img,
					email : email
				},
				success : function(data) {
					window.location.href = data;
					//alert("ajax 성공!");
				},
				error : function() {
					alert("실패");
					//alert("ajax 실패!");
				}
			});

			//           document.getElementById('name').innerText = "Signed in: " +
			//               googleUser.getBasicProfile().getName();
		}, function(error) {
			alert('google login func err');
			//alert(JSON.stringify(error, undefined, 2));
		});
	}
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

						<input type="button" value="LOGIN" id="login_ck"
							style="width: 400px; height: 45px;">
					</form>
					<br> <input type="button" value="아이디찾기" id="find_id"
						style="width: 194px; height: 40px;"> &nbsp; <input
						type="button" value="비밀번호찾기" id="find_pass"
						style="width: 194px; height: 40px;">
					<!-- 네이버아이디로로그인 버튼 노출 영역 -->
					<br> <br> 아직 계정이 없으신가요?? &nbsp; <a href="joinForm.do">
						회원가입하기 </a><br> <br> <br> <a
						href="javascript:facebook_btn();"><img
						src="img/facebook_loginBtn.png"></a> <br>
					<div id="naver_id_login" style="display: none"></div>
					<span
						onclick="document.getElementById('naver_id_login_anchor').click();")>
						<img style="margin-top: 10px; cursor: pointer"
						src="img/naver_loginBtn.png">
					</span> <br>
					
					<!-- 구글 로그인 영역 -->
               <!-- In the callback, you would hide the gSignInWrapper element on a
                 successful sign in -->
                 <div id="gSignInWrapper">
                   <div id="customBtn" class="customGPlusSignIn">
                     <a href="javascript:startApp()"><img src="img/googleLoginBtn.png" style="margin-top: 10px; width: 330px; height: 47px; cursor:pointer"></a>
<!--                      <a href="javascript:startApp()">Google Login test</a> -->
                   </div>
                 </div>
               <br>
               
				</div>
			</div>
		</div>
	</div>
	<!-- End product widget area -->

	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("xeQmcW9xQTAgeEhBztgr",
				"http://70.12.109.58:8080/Wawa/jsp/callback.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 50);
		naver_id_login.setDomain("http://70.12.109.58:8080/Wawa/");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>

</body>
</html>