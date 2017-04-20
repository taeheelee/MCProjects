<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="header-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="user-menu">
					<ul>
						<li><a href="join.html"><i class="fa fa-heart"></i> Join us</a></li>
						<li><a href="logout.html"><i class="fa fa-user"></i> Logout</a></li>
						<li><a href="login.html"><i class="fa fa-user"></i> Login</a></li>
					</ul>	
				</div>
			</div>
		</div>
	</div>
</div> <!-- End header area -->
    
    
    
<!-- 좌측 로고 및 우측 미니애견정보창 영역(하얀색 부분) -->
<div class="site-branding-area">
	<div class="container">
		<div class="row">
			<!--좌측 로고 -->
			<div class="col-sm-6">
				<div class="logo">
					<h1><a href="index.html"><img src="img/paw-print.png" id="paw-print"><span>WAWA!</span></a></h1>
				</div>
			</div>
			<!-- 우측 미니애견정보창 -->
			<div class="col-sm-6" style="margin: 0">
				<div class="shopping-item" >
					<a href="cart.html">
						<table id="mini" style="margin-left: 5px;width:330px; height: 100px;">
							<tr>
								<td rowspan="4" style="width: 90px;" id="petmainimage"><img src="img/dog_12.jpg" alt=""style="width: 80px;height: 80px"></td>
								<td colspan="3" id="nickname">username</td>
							</tr>
							<tr style="font-size: small;">
								<td id="petname">강아지이름</td>
								<td id="petsex">성별</td>
								<td id="petage">0년00개월</td>
							</tr>
							<tr style="font-size: small;">
								<td colspan="2">다음 예방접종</td>
								<td id="dday" style="text-align: center;">D-00</td>
							</tr>
							<tr style="font-size: small;">
								<td colspan="2">다음 미용예정</td>
								<td id="grooming" style="text-align: center;">D-00</td>
							</tr>
						</table>
					</a>
				</div>
			</div>
			
		</div>
	</div>
</div> <!-- End site branding area -->






<!-- 메뉴바   -->
<div class="mainmenu-area">
	<div class="container">
		<div class="row">
 			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div> 
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.html">HOME</a></li>
					<li><a href="userinfo.html">내정보</a></li>
					<li class="dropdown">
						<a href="single-product.html" class="dropdown-toggle" data-toggle="dropdown">나의펫 <b class="caret"></b></a>
	                    <ul class="dropdown-menu">
							<li><a href="mypetinfo.html">나의 펫 정보</a></li>
							<li><a href="healthcare.html">나의 펫 헬스케어</a></li>
							<li><a href="medicalcare.html">나의 펫 메디컬케어</a></li>
	                    </ul>
					</li>
					<li><a href="commonsense.html">애견정보/상식</a></li>
					<li><a href="review.html">제품리뷰</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="boast.html">뽐내기</a></li>
							<li><a href="wanted.html">유기견찾기</a></li>
							<li><a href="propose.html">짝꿍찾기</a></li>
							<li><a href="freeboard.html">자유게시판</a></li>	                            
						</ul>
					</li>                            
					<li><a href="location.html">위치정보</a></li>
				</ul>
			</div>  
		</div>
	</div>
</div> <!-- End mainmenu area -->


</body>
</html>