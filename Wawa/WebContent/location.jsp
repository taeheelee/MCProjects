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
    <link href="/tabstyle.css" rel="stylesheet">
    
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
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>위치정보</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>



	<div class="single-product-area">
		

		<div class="container">
		                                 
			<h3 class="sidebar-title">위치정보 검색</h3>
		</div>
		
		<div class="container">

				<form action="/Wawa/map.do">		
				<select name="type">
					<option selected="selected">전체선택</option>
					<option value="동물병원">동물병원</option>
					<option>애견미용실</option>
					<option>애견카페</option>
				</select>

				<input type="text" placeholder="Seach..">
				<select name="local">
					<option selected="selected">전체선택</option>
				    <option value="서울">서울</option>
                    <option value="경기">경기</option>
                    <option value="전라도">전라도</option>
                    <option value="경상도">경상도</option>
                    <option value="강원도">강원도</option>
                    <option value="충청도">충청도</option>
                    <option value="제주도">제주도</option>
					<option>...</option>
				</select>
				<select name="addr">
					<option selected="selected">전체선택</option>
					<option value="강남구">강남구</option>
					<option>땡땡구</option>
					<option>땡땡구</option>
					<option>...</option>
				</select>
				<input type="submit" value="검색">

				
		</form>		
		</div>

		<div class="container" id="">


			<div class="col-md-6">
			
				<div class="col-md-11">
					<form method="post" action="#">
						<table cellspacing="0" class="shop_table cart">
							<thead>
								<tr>
									<th>종류</th>
									<th>이름</th>
			                        <th>전화번호</th>
			                        <th>주소</th>
			                        <th>기타</th>
			                    </tr>
			                </thead>
			                <tbody>
			                
			                    <tr class="cart_item">
			                        <td>[동물병원]</td>
			                        <td><a href="#">VIP동물병원</a></td>
			                        <td>02-0000-0000</td>
			                        <td>서울시 어쩌고 저쩌고</td>
			    					<td>미용가능</td>
			                    </tr>
			                    <tr class="cart_item">
			                        <td>[동물병원]</td>
			                        <td><a href="#">바우와우 동물병원</a></td>
			                        <td>02-0000-0000</td>
			                        <td>서울시 어쩌고 저쩌고</td>
			    					<td>-</td>
			                    </tr>
			                    <tr class="cart_item">
			                        <td>[애견카페]</td>
			                        <td><a href="#">치쿠치쿠</a></td>
			                        <td>02-0000-0000</td>
			                        <td>서울시 어쩌고 저쩌고</td>
			    					<td>-</td>
			                    </tr>
			                  
			                     
			          
			           
							</tbody>
						</table>
		       	 </form>
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
			<div class="col-md-6">
				<div id="map" style="width:100%;height:350px;"></div>
				
				<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c32ae918e9d23fdef57268cd2825a898&libraries=services"></script>
				<script>
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new daum.maps.InfoWindow({zIndex:1});
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption); 
				
				// 장소 검색 객체를 생성합니다
				var ps = new daum.maps.services.Places(); 
				
				// 키워드로 장소를 검색합니다
				ps.keywordSearch("분당 동물병원", placesSearchCB); 
				
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (status, data, pagination) {
				    if (status === daum.maps.services.Status.OK) {
				
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new daum.maps.LatLngBounds();
				
				        for (var i=0; i<data.places.length; i++) {
				            displayMarker(data.places[i]);    
				            bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
				        }       
				
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}
				
				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
				    
				    // 마커를 생성하고 지도에 표시합니다
				    var marker = new daum.maps.Marker({
				        map: map,
				        position: new daum.maps.LatLng(place.latitude, place.longitude) 
				    });
				
				    // 마커에 클릭이벤트를 등록합니다
				    daum.maps.event.addListener(marker, 'click', function() {
				        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
				        infowindow.open(map, marker);
				    });
				}
				</script> 
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