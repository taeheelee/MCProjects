<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			FB.api('/me?fields=id, name, first_name, last_name, email, locale, gender, timezone', function(response) {
				alert(response.id);
				alert(response.name);
				alert(response.first_name);
				alert(response.last_name);
				alert(response.email);
				alert(response.locale);
				alert(response.gender);
				alert(response.timezone);
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

<a href="javascript:facebook_btn();">페이스북 로그인</a>
</body>
</html>