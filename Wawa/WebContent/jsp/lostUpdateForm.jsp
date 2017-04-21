<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	      	
	      	if(${board.kind == '치와와'})
	      		$('#kind > option[value=1]').attr('selected', true);
	      	else if(${board.kind == '요크셔테리어'})
	      		$('#kind > option[value=2]').attr('selected', true);
	      	else if(${board.kind == '말티즈'})
	      		$('#kind > option[value=3]').attr('selected', true);
	      	else if(${board.kind == '시츄'})
	      		$('#kind > option[value=4]').attr('selected', true);
	      	else if(${board.kind == '비글'})
	      		$('#kind > option[value=5]').attr('selected', true);
	      	else if(${board.kind == '퍼그'})
	      		$('#kind > option[value=6]').attr('selected', true);
	      	else if(${board.kind == '페키니즈'})
	      		$('#kind > option[value=7]').attr('selected', true);
	      	else if(${board.kind == '미니어쳐 슈나우저'})
	      		$('#kind > option[value=8]').attr('selected', true);
	      	else if(${board.kind == '기타소형견'})
	      		$('#kind > option[value=9]').attr('selected', true);
	      	else if(${board.kind == '기타중형견'})
	      		$('#kind > option[value=10]').attr('selected', true);
	      	else if(${board.kind == '기타대형견'})
	      		$('#kind > option[value=11]').attr('selected', true);
	  });
	</script>
  
  </head>
  <body>
     

    
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
                         
                     

                            <form action="lostUpdate.do" enctype="multipart/form-data" class="checkout" method="get" name="checkout">
								<input type="hidden" name="boardIdx" value="${board.boardIdx }">
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
                                                	<c:if test="${board.category == '찾고있어요'}">
	                                                    <option selected="selected" value="find">찾고있어요</option>
	                                                    <option value="protect">보호중입니다</option>
                                                    </c:if>
                                                    <c:if test="${board.category == '보호중입니다' }">
	                                                    <option value="find">찾고있어요</option>
	                                                    <option selected="selected" value="protect">보호중입니다</option>
                                                    </c:if>
                                                </select>
                                            </p>
                                            <br>
             
                                             <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">  잃어버린 날짜/ 발견된 날짜</label>
                                                <input type="text" id="lostdate" name="lostdate" placeholder="0000-00-00" value="${board.lostDate }" class="input-text ">
                                            </p>
                                            <br>
                                          	 <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">  잃어버린 장소/ 발견된 장소</label>
                                                <input type="text" id="lostplace" name="lostplace"  value="${board.lostPlace }" class="input-text ">
                                            </p>
                                            <br>
             
                                            
                                            <!-- <div class="clear"></div> -->
                                    
                                            
                                            <div class="form-row place-order" style="float: right">
												<input type="button" id="petinfo" onclick="location.href='/lostGetPetinfo.do'" value="애견정보 불러오기" />
											</div>
                                            
											<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">애견 이름</label>
                                                <input type="text" id="name" name="name" placeholder="" value="${board.name }" class="input-text ">
                                            </p>
                                            <br>
                                            
                                              <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">등록번호</label>
                                                <input type="text" id="resist" name="resist" placeholder="15자리 숫자로 입력해주세요" value="${board.resist }" class="input-text ">
                                            </p>
                                            <br>
                                       
                                             <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">품종 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select class="country_to_state country_select" id="kind" name="kind">
                                                    <option value="1">치와와</option>
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
															<c:if test="${board.sex == '수컷' }">
																<input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio" id="sex" checked="checked"> 수컷
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio" id="sex"> 암컷
															</c:if>
															<c:if test="${board.sex == '암컷' }">
																<input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio" id="sex"> 수컷
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio" id="sex" checked="checked"> 암컷
															</c:if>
														</li>
													</ul>
												</div>
                                            </p>
                                            <br>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">나이</label>
                                                <input type="text" id="age" name="age" placeholder="" value="${board.age }" class="input-text ">
                                            </p>
                                            <br>
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">몸무게(kg)</label>
                                                <input type="text" id="weight" name="weight" placeholder="" value="${board.weight }" class="input-text ">
                                            </p>
                                            <br>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">연락처</label>
                                                <input type="text" id="phone" name="phone" placeholder="" value="${board.phone }" class="input-text ">
                                            </p>
                                            <br>
                                            
                                          <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">e-mail</label>
                                                <input type="text" id="email" name="email" placeholder="" value="${board.email }" class="input-text ">
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
                                                <input type="text" id="title" name="title" placeholder="" value="${board.title }" class="input-text ">
                                            </p>
                                            <br>
                                      
                                        

				 
  <div style="width: 100%; margin: 0 auto;">
    <div id="summernote">${board.content }</div>
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