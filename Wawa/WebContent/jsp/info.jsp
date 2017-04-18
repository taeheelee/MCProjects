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
    
    <!--   JQuery -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	<!-- summernote -->
	<link rel="stylesheet" href="summernote/dist/summernote.css">
    <script src="summernote/dist/summernote.js"></script>
	<script src="summernote/dist/summernote.min.js"></script>
	<script src="summernote/dist/lang/summernote-ko-KR.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
      <script>
	    $(document).ready(function() {
	        $('#summernote').summernote();
	    });
  </script>
  
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
                        <li><a href="/Wawa/infoMain.do?boardCode=1">애견정보/상식</a></li>
                        <li><a href="/Wawa/reviewMain.do?boardCode=2">제품리뷰</a></li>
                        <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티 <b class="caret"></b></a>
	                        <ul class="dropdown-menu">
	                            <li><a href="/Wawa/boastMain.do?boardCode=3">뽐내기</a></li>
	                            <li><a href="/Wawa/lostMain.do?boardCode=4">유기견찾기</a></li>
	                            <li><a href="/Wawa/partnerMain.do?boardCode=5">짝꿍찾기</a></li>
	                            <li><a href="/Wawa/freeboardMain.do?boardCode=6">자유게시판</a></li>	                            
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
                        <h2>애견정보/상식</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- 여기부터 안에 들어가면 안되는 이유찾기 -->
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
<!--             <div class="row"> -->
                
                <div class="col-md-55">
     
<!--                     <div class="product-content-right"> -->
<!--                         <div class="woocommerce" > -->
                         
                     

                            <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">


                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">글 목록</h2>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
    
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
                        <td>[훈련정보]</td>
                        <td><a href="#">훈련법</a></td>
                        <td>개장수</td>
    					<td>0</td>
                        <td>2017-03-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>2</td>
                        <td>[애견상식]</td>
                        <td><a href="#">3대 지랄견 소개</a></td>
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
                  
                     
          
           
				</tbody>
			</table>
        </form>
                                    
                                    
                                    
                                    
                                              <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">카테고리 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                
                                                
                                    <form action="/Wawa/infoSearch.do">
                                                <select class="country_to_state country_select" id="category" name="category">
                                                    <option selected="selected" value="GB">애견상식</option>
                                                    <option value="DE">훈련정보</option>
                                                    <option value="DE">애견간식레시피</option>
                                                    <option value="DE">기타</option>
                                                </select>
                                            </p>
                                            <br>
                                    
                             		<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">검색<abbr title="required" class="required">*</abbr></label>
                                                <input type="text" id="keyword" name="keyword" placeholder="" value="" class="input-text ">
                        
                                            </p>
                                            <br>
                                	<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="SEARCH" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
								</form>
										      
											</div>   
												<div class="form-row place-order" style="float: right">
												<input type="button" id="write" onclick="location.href='/Wawa/infoWrite.do'" value="WRITE" />
											</div>        
                                            
                                            
                                    </div>

                                   

                                </div>




 									















                              

                                   
                                </div>
                            </form>

<!--                         </div>                        -->
<!--                     </div>                     -->
                </div>
<!--             </div> -->
        </div>
                </div>
   
<!-- 여기부터 안에 들어가면 안되는 이유찾기  end-->     



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
    </div><!-- footer-top-area end -->
    
    
    
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
   
    <!-- Latest jQuery form server -->
<!--     <script src="https://code.jquery.com/jquery.min.js"></script> -->
    
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