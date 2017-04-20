<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
      <script type="text/javascript">
	  $(document).ready(function() {
	      $('#summernote').summernote({
	    	  height : 500
	      });
	      	$('#ok').click(function() {
				var content = $('#summernote').summernote('code');
				$('#content').val(content);	
			});
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
                        <li><a href="/Wawa/infoMain.do">애견정보/상식</a></li>
                        <li><a href="/Wawa/reviewMain.do">제품리뷰</a></li>
                        <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티 <b class="caret"></b></a>
	                        <ul class="dropdown-menu">
	                            <li><a href="/Wawa/boastMain.do">뽐내기</a></li>
	                            <li><a href="/Wawa/lostMain.do">유기견찾기</a></li>
	                            <li><a href="/Wawa/partnerMain.do">짝꿍찾기</a></li>
	                            <li><a href="/Wawa/freeboardMain.do">자유게시판</a></li>	                            
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
                        <h2>유기견 찾기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- 여기부터 안에 들어가면 안되는 이유찾기 -->
    <div class="single-product-area">
<!--         <div class="zigzag-bottom"></div> -->
        <div class="container">
<!--             <div class="row"> -->
                
                <div class="col-md-55">
     
<!--                     <div class="product-content-right"> -->
<!--                         <div class="woocommerce" > -->
                         
                     

                            <form action="lostWrite.do" enctype="multipart/form-data" class="checkout" method="get" name="checkout">
								<input type="hidden" name="content" id="content">
								<input type="hidden" name="boardCode" value="4">
								<input type="hidden" name="writer" value="글쓴이">

                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">글쓰기</h2>
                                        <div class="woocommerce-billing-fields">
                                            
                                            <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">카테고리 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select class="country_to_state country_select" id="billing_country" name="category">
                                                    <option selected="selected" value="find">찾고있어요</option>
                                                    <option value="protect">보호중입니다</option>
                                                </select>
                                            </p>
                                            <br>
             
                                             <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">  잃어버린 날짜/ 발견된 날짜</label>
                                                <input type="text" id="lostdate" name="lostdate" placeholder="0000-00-00" value="" class="input-text ">
                                            </p>
                                            <br>
                                          	 <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">  잃어버린 장소/ 발견된 장소</label>
                                                <input type="text" id="lostplace" name="lostplace"  value="" class="input-text ">
                                            </p>
                                            <br>
             
                                            
                                            <!-- <div class="clear"></div> -->
                                    
                                            
                                            <div class="form-row place-order" style="float: right">
												<input type="button" id="petinfo" onclick="location.href='/lostGetPetinfo.do'" value="애견정보 불러오기" />
											</div>
                                            
											<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">애견 이름</label>
                                                <input type="text" id="name" name="name" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            
                                              <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">등록번호</label>
                                                <input type="text" id="resist" name="resist" placeholder="15자리 숫자로 입력해주세요" value="" class="input-text ">
                                            </p>
                                            <br>
                                       
                                             <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">품종 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select class="country_to_state country_select" id="kind" name="kind">
                                                    <option selected="selected" value="1">치와와</option>
                                                    <option value="2">요크셔 테리어</option>
                                                    <option value="3">말티즈</option>
                                                    <option value="4">시츄</option>
                                                    <option value="5">비글</option>
                                                    <option value="6">퍼그</option>
                                                    <option value="7">페키니즈</option>
                                                    <option value="8">미니어쳐 슈나우저</option>
                                                    <option value="9">기타 소형견</option>
                                                    <option value="10">기타 중형견</option>
                                                    <option value="11">기타 대형견</option>
                                                </select>
                                            </p>
                                            <br>
                                            
                                             <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">성별 <abbr title="required" class="required">*</abbr></label>
	                                            <div id="payment">
													<ul class="payment_methods methods">
														<li class="payment_method_paypal">
															<input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio" id="sex"> 수컷
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio" id="sex"> 암컷
														</li>
													</ul>
												</div>
                                            </p>
                                            <br>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">나이</label>
                                                <input type="text" id="age" name="age" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">몸무게(kg)</label>
                                                <input type="text" id="weight" name="weight" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">연락처</label>
                                                <input type="text" id="phone" name="phone" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            
                                          <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">e-mail</label>
                                                <input type="text" id="email" name="email" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                      
                                            
                                            	<p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">애견 프로필 사진 등록 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                
                                            <div class="form-row place-order">
												<input type="button" data-value="Place order" value="ADD PHOTO" id="place_order" name="woocommerce_checkout_place_order" class="button alt" >

											</div>
                                            </p>
     
                                         <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">글 제목</label>
                                                <input type="text" id="title" name="title" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                      
                                        

				 
  <div style="width: 100%; margin: 0 auto;">
    <div id="summernote"></div>
	</div>
<br>

<!--<div class="clear"></div> -->


											<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="WRITE" id="ok" name="woocommerce_checkout_place_order" class="button alt">
								</form>											
											</div>



										</div>
                                    </div>

                                   

                                </div>

                                   
                                </div>
                            

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