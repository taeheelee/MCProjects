<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
				<center>
					<div class="col-md-12" style="text-align: center;">
						<br>
						<form action="login.do" method="post">
							<input type="text" id="id" placeholder="ID"
								style="width: 70%; height: 50px;" name="id"><br> <br>
							<input type="password" id="pw" placeholder="Password"
								style="width: 70%; height: 50px;" name="pw"><br> <br>
							<input type="submit" value="LOGIN"
								style="width: 70%; height: 50px;">
						</form>
						<br><br>
					</div>
				</center>
			</div>
		</div>
	</div>
	<!-- End product widget area -->

  </body>
</html>