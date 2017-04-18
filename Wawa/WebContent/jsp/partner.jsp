<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eElectronics - HTML eCommerce Template</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
<!--     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- <script src="./tab.js?version=2"></script> -->
<!-- <script type="text/javascript"> -->
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script> 
    <link href="tabstyle.css" rel="stylesheet">
    
<!--     <script type="text/javascript" src="./tab.js?version=2"></script> -->
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
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="index.html"><img src="img/paw-print.png" id="paw-print"><span>WAWA</span></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
                    <div class="shopping-item">
                        <a href="cart.html">UserInfo - <span class="cart-amunt"> | PetName | age | ♂ or ♀<br>예방 접종 알림 D-?? 미용 주기 알림 D-??</span>  </a>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
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
                        <li><a href="/infoMain.do">애견정보/상식</a></li>
                        <li><a href="/reviewMain.do">제품리뷰</a></li>
                        <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티 <b class="caret"></b></a>
	                        <ul class="dropdown-menu">
	                            <li><a href="/boastMain.do">뽐내기</a></li>
	                            <li><a href="/lostMain.do">유기견찾기</a></li>
	                            <li><a href="/partnerMain.do">짝꿍찾기</a></li>
	                            <li><a href="freeboard.html">자유게시판</a></li>	                            
	                        </ul>
	                    </li>                            
                        <li><a href="location.html">위치정보</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>짝꿍찾기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>



	<div class="single-product-area">
		

		<div class="container">
		                                 
			<h3 class="sidebar-title">목록</h3>
		</div>
		
		<div class="container">

				<div class="container" style="width :100% ;float: right;">

				<form action="/partnerSearch.do">

					<input type="radio" name="petsex" value="male"> 수컷
					<input type="radio" name="petsex" value="female"> 암컷
								
					<input type="text" name="petname" placeholder="Search..">
					<input type="submit" value="검색">
				</form>
								
				<input type="button" value="짝꿍찾기 등록" onclick="location.href='/partnerWriteForm.do'">
				</div>
		
		</div>

		<div class="container" id="">



			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_14.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_13.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_12.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_11.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_10.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_09.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_08.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_07.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_06.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_05.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_04.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_03.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_02.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_01.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_14.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_13.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_12.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 15px;">
				<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_11.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table border="1" style="width: 100%; font-size: small;text-align:center; " >
						<tr><td colspan="2" id="petname">이름</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
					</table>
	
				</div>
			</div>	
			
			
			<div class="row">
				<div class="col-md-12">
					<div class="product-pagination text-center">
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">6</a></li>
								<li><a href="#">7</a></li>
								<li><a href="#">8</a></li>
								<li><a href="#">9</a></li>
								<li><a href="#">10</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			
			

		</div>
	</div>





	<div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2>e<span>Electronics</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">User Navigation </h2>
                        <ul>
                            <li><a href="">My account</a></li>
                            <li><a href="">Order history</a></li>
                            <li><a href="">Wishlist</a></li>
                            <li><a href="">Vendor contact</a></li>
                            <li><a href="">Front page</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categories</h2>
                        <ul>
                            <li><a href="">Mobile Phone</a></li>
                            <li><a href="">Home accesseries</a></li>
                            <li><a href="">LED TV</a></li>
                            <li><a href="">Computer</a></li>
                            <li><a href="">Gadets</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <input type="email" placeholder="Type your email">
                            <input type="submit" value="Subscribe">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>&copy; 2015 eElectronics. All Rights Reserved. Coded with <i class="fa fa-heart"></i> by <a href="http://wpexpand.com" target="_blank">WP Expand</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <!-- Latest jQuery form server-->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
    
<!-- tab form make sy -->
    <script src="tab.js"></script>
  </body>
</html>