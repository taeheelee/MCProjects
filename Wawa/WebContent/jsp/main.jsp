<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>

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
    
    
        <!--   JQuery -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
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
                
                <div class="col-sm-6" style="margin: 0">
                    <div class="shopping-item">
                        <a href="cart.html">
                        <table id="mini" style="margin-left: 5px;width:330px; height: 100px;">
	<tr>
		<td rowspan="4" style="width: 90px;"><img src="img/dog_12.jpg" alt=""style="width: 80px;height: 80px"></td>
		<td colspan="3">username</td>
	</tr>
	<tr style="font-size: small;">
		<td>강아지이름</td>
		<td>성별</td>
		<td>0년00개월</td>
	</tr>
	<tr style="font-size: small;">
		<td colspan="2">다음 예방접종</td>
		<td id="dday" style="text-align: center;">D-00</td>
	</tr>
	<tr style="font-size: small;">
		<td colspan="2">다음 미용예정</td>
		<td id="" style="text-align: center;">D-00</td>
	</tr>
</table>
                        </a>
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
    
    <div class="slider-area">
        <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">
            
            <div class="slide-bulletz">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ol class="carousel-indicators slide-indicators">
                                <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                                <li data-target="#slide-list" data-slide-to="1"></li>
                                <li data-target="#slide-list" data-slide-to="2"></li>
                            </ol>                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="single-slide">
                        <div class="slide-bg slide-one"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>We are awesome</h2>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur, dolorem, excepturi. Dolore aliquam quibusdam ut quae iure vero exercitationem ratione!</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi ab molestiae minus reiciendis! Pariatur ab rerum, sapiente ex nostrum laudantium.</p>
                                                <a href="" class="readmore">Learn more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-two"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>We are great</h2>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe aspernatur, dolorum harum molestias tempora deserunt voluptas possimus quos eveniet, vitae voluptatem accusantium atque deleniti inventore. Enim quam placeat expedita! Quibusdam!</p>
                                                <a href="" class="readmore">Learn more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-three"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>We are superb</h2>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores, eius?</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deleniti voluptates necessitatibus dicta recusandae quae amet nobis sapiente explicabo voluptatibus rerum nihil quas saepe, tempore error odio quam obcaecati suscipit sequi.</p>
                                                <a href="" class="readmore">Learn more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>        
    </div> <!-- End slider area -->
  
    
    <div class="product-widget-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">자유게시판 최신글</h2>
                        <a href="" class="wid-view-more">View All</a>
                        <form method="post" action="#">
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th>글번호</th>
                        <th>카테고리</th>
                        <th>글제목</th>
                        <th>글쓴이</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                
                    <tr class="cart_item">
                        <td>3</td>
                        <td>[주저리주저리]</td>
                        <td><a href="#">강아지 때문에 고민입니다</a></td>
                        <td>개장수</td>
    					<td>0</td>
                        <td>2017-03-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>2</td>
                        <td>[중고거래]</td>
                        <td><a href="#">안쓰는 물건 양도합니다</a></td>
                        <td>핫도그</td>
    					<td>0</td>
                        <td>2017-02-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>1</td>
                        <td>[애견간식레시피]</td>
                        <td><a href="#">몸에좋은 수제간식</a></td>
                        <td>도그맘</td>
    					<td>0</td>
                        <td>2017-01-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>1</td>
                        <td>[애견간식레시피]</td>
                        <td><a href="#">몸에좋은 수제간식</a></td>
                        <td>도그맘</td>
    					<td>0</td>
                        <td>2017-01-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>1</td>
                        <td>[애견간식레시피]</td>
                        <td><a href="#">몸에좋은 수제간식</a></td>
                        <td>도그맘</td>
    					<td>0</td>
                        <td>2017-01-01</td>
                    </tr>
                  
                     
          
           
				</tbody>
			</table>
        </form>
                        
               
                         
                    </div>
                    
                   <div class="single-product-widget">
                        <h2 class="product-wid-title">제품리뷰 BEST</h2>
                        <a href="#" class="wid-view-more">View All</a>
<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th>글번호</th>
                        <th>카테고리</th>
                        <th>글제목</th>
                        <th>제품별점</th>
                        <th>글쓴이</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                
                    <tr class="cart_item">
                        <td>3</td>
                        <td>[사료]</td>
                        <td><a href="#">맛좋은사료 	</a></td>
                        <td>★★★★☆</td>
                        <td>와와아빠</td>
    					<td>0</td>
                        <td>2017-03-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>2</td>
                        <td>[목욕/미용]</td>
                        <td><a href="#">윤기나는 샴푸</a></td>
                        <td>★★★☆☆</td>
                        <td>핫도그</td>
    					<td>0</td>
                        <td>2017-02-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>1</td>
                        <td>[간식]</td>
                        <td><a href="#">영양 간식</a></td>
                        <td>★★★☆☆</td>
                        <td>도그맘</td>
    					<td>0</td>
                        <td>2017-01-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>1</td>
                        <td>[간식]</td>
                        <td><a href="#">영양 간식</a></td>
                        <td>★★★☆☆</td>
                        <td>도그맘</td>
    					<td>0</td>
                        <td>2017-01-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>1</td>
                        <td>[간식]</td>
                        <td><a href="#">영양 간식</a></td>
                        <td>★★★☆☆</td>
                        <td>도그맘</td>
    					<td>0</td>
                        <td>2017-01-01</td>
                    </tr>
                  
				</tbody>
			</table>
        </form>

                                
                    </div>
       
                    
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">유기견찾기</h2>
                        <a href="#" class="wid-view-more">View All</a>
				<div class="single-product " style=" padding: 5px;">
				<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
					<h4>찾고있어요</h4>
					<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
					<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue">
					
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_03.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					</div>
					<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;">
					<table border="1" style="width: 100%; font-size: small;	" >
						<tr><td>이름</td><td id="name">이름</td></tr>
						<tr><td>품종</td><td id="kind">품종</td></tr>
						<tr><td id="sex">성별</td><td id="age">몇개월</td></tr>
						<tr><td colspan="2">잃어버린 장소</td></tr>
						<tr><td colspan="2" id="place">OO동</td></tr>
						<tr><td colspan="2">잃어버린 날짜</td></tr>
						<tr><td colspan="2" id="lostdate">년월일</td></tr>
					</table>
					</div>
					<hr style="border-color: black; border: solid 1px;margin: 5px 0">
				</div>
			</div>
			<div class="single-product" style=" padding: 5px;">
				<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
					<h4>보호중입니다</h4>
					<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
					<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue">
					
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_02.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					</div>
					<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;">
					<table border="1" style="width: 100%; font-size: small;	" >
						<tr><td>이름</td><td id="name">이름</td></tr>
						<tr><td>품종</td><td id="kind">품종</td></tr>
						<tr><td id="sex">성별</td><td id="age">몇개월</td></tr>
						<tr><td colspan="2">잃어버린 장소</td></tr>
						<tr><td colspan="2" id="place">OO동</td></tr>
						<tr><td colspan="2">잃어버린 날짜</td></tr>
						<tr><td colspan="2" id="lostdate">년월일</td></tr>
					</table>
					</div>
					<hr style="border-color: black; border: solid 1px;margin: 5px 0">
				</div>
			</div>
			<div class="single-product" style=" padding: 5px;">
				<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
					<h4>찾고있어요</h4>
					<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
					<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue">
					
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_01.jpg" alt="">
							<div class="product-hover">
								<a href="" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					</div>
					<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;">
					<table border="1" style="width: 100%; font-size: small;	" >
						<tr><td>이름</td><td id="name">이름</td></tr>
						<tr><td>품종</td><td id="kind">품종</td></tr>
						<tr><td id="sex">성별</td><td id="age">몇개월</td></tr>
						<tr><td colspan="2">잃어버린 장소</td></tr>
						<tr><td colspan="2" id="place">OO동</td></tr>
						<tr><td colspan="2">잃어버린 날짜</td></tr>
						<tr><td colspan="2" id="lostdate">년월일</td></tr>
					</table>
					</div>
					<hr style="border-color: black; border: solid 1px;margin: 5px 0">
				</div>
			</div>

                    </div>
                </div>

            </div>
        </div>
    </div> <!-- End product widget area -->
    
    <div class="footer-top-area">
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
                            <li><a href="#">My account</a></li>
                            <li><a href="#">Order history</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Vendor contact</a></li>
                            <li><a href="#">Front page</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categories</h2>
                        <ul>
                            <li><a href="#">Mobile Phone</a></li>
                            <li><a href="#">Home accesseries</a></li>
                            <li><a href="#">LED TV</a></li>
                            <li><a href="#">Computer</a></li>
                            <li><a href="#">Gadets</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </form>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer top area -->
    
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
    </div> <!-- End footer bottom area -->
   

    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
    
  </body>
</html>