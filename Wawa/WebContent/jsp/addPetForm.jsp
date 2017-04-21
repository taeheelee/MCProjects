<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eElectronics - HTML eCommerce Template</title>
     
    <script
  	src="https://code.jquery.com/jquery-2.2.4.min.js"
  	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
 	crossorigin="anonymous"></script>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		
    		var regResist = /^[0-9]*$/;
    		var regDate = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;;
    		var regWeight = /^[0-9]*$/;
    		
    		$('#resist').blur(function(){
    			if(!regResist.test($('#resist').val())){
    				$('#resistError').html('<font color="red">등록번호 오류(15자리 숫자)</font>');
    			}
    		});
    		
    		$('#birth').blur(function(){
    			if(!regDate.test($('#birth').val())){
    				$('#birthError').html('<font color="red">날짜입력 오류(ex) 2017-04-01)</font>');
    			}
    		});
    		
    		$('#weight').blur(function(){
    			if(!regWeight.test($('#weight').val())){
    				$('#weightError').html('<font color="red">몸무게입력 오류(ex) 2017-04-21);
    			}
    		});
    		
    		$('#gs').blur(function(){
    			if(!regDate.test($('#gs').val())){
    				$('#gsError').html('<font color="red">날짜입력 오류(ex) 2017-04-01)</font>');
    			}
    		});
    		
    
    		
    		
    	});
    </script>
     
     
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
    
	<!-- jQuery Datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	function getResult(){
  		
  		var param = $("#datePicker").val();
  		
  		if(param == ""){
  			alert("날짜를 선택해 주세요.");
  			return;
  		}

  	}
  	/* 달력 설정 */
  	$.datepicker.setDefaults({
        dateFormat: 'yy/mm/dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        showButtonPanel: true,
        changeMonth: true,
      	changeYear: true,
        autoSize: true,
//         showOn: "button",
//         buttonImage: "/images/team/calendar.png",
//         buttonImageOnly: true,
//         buttonText: "날짜 선택"
    });
	$( function() {
		$( "#datepicker" ).datepicker();
	} );
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
                
                <div class="col-sm-6" style="margin: 0">
                    <div class="shopping-item">
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
                        <h2>나의 펫 정보</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="single-product-area">
         
        <div class="container">
            <div class="row">
                
                <div class="col-md-55">
     
                    <div class="product-content-right">
                        <div class="woocommerce" >
                         
                     

                            <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">

                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">새로운 펫 정보 등록하기</h2>
                                        <div class="woocommerce-billing-fields">
                                            
<!--                                             <p id="billing_first_name_field" class="form-row form-row-first validate-required"> -->
												
                                                <label class="" for="billing_first_name">애견 프로필 사진 등록</label>

											<form action="addPet.do">
												<div class="file_input_div">
													<input type="button" value="파일 선택" class="file_input_button"/>
													<input type="file" class="file_input_hidden" onchange="javascript:document.getElementById('fileName').value = this.value" />
												</div>
												<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
												
                                                <label class="" for="billing_first_name">애견 이름 <abbr title="필수입력사항" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="name" name="name" class="input-text ">
                                            <br>

<!--                                             <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state"> -->
                                                <label class="" for="billing_state">등록번호</label>
                                                <input type="text" id="resist" name="resist" placeholder="15자리 숫자로 입력해주세요" value="" class="input-text ">
<!--                                             </p> -->
												<br>
												<span id="resistError"></span>
                                            <br>
                                            
                                            
                                            <!-- <div class="clear"></div> -->
<!--                                             <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated"> -->
                                                <label class="" for="billing_country">품종 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select class="country_to_state country_select" id="kind" name="kind">
                                                    <option selected="selected" value="GB">치와와</option>
                                                    <option value="DE">요크셔 테리어</option>
                                                    <option value="GH">말티즈</option>
                                                    <option value="SB">시츄</option>
                                                    <option value="SO">비글</option>
                                                    <option value="ZA">퍼그</option>
                                                    <option value="GS">페키니즈</option>
                                                    <option value="KR">미니어쳐 슈나우저</option>
                                                    <option value="GE">기타 소형견</option>
                                                    <option value="KR">기타 중형견</option>
                                                    <option value="KR">기타 대형견</option>
                                                </select>
<!--                                             </p> -->
                                            <br>
                                            
                                            
<!--                                             <p id="billing_first_name_field" class="form-row form-row-first validate-required"> -->
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
                                            <br>
                                            
                                         
                                            
<!--                                             <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state"> -->
                                                <label class="" for="billing_state">중성화 여부</label>
                                                 <div id="payment">
													<ul class="payment_methods methods">
														<li class="payment_method_paypal">
															<input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="neutral" class="input-radio" id="neutral"> 미중성
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="neutral" class="input-radio" id="neutral"> 중성화
														</li>
													</ul>
												</div>
<!--                                             </p> -->
                                            <br>
                                            
<!-- 											<p id="billing_first_name_field" class="form-row form-row-first validate-required"> -->
                                                <label class="" for="billing_first_name">생일<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <p><input type="text" id="birth" name="birth" placeholder="정확한 날짜를 모르더라도 대략적으로 입력해주세요"></p>
												<br>
												<span id="birthError"></span>
                                            <br>
                                            
                                            
<!-- 											<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state"> -->
                                                <label class="" for="billing_state">몸무게(kg)</label>
                                                <input type="text" id="weight" name="weight" placeholder="" value="" class="input-text ">
<!--                                             </p> -->
												<br>
												<span id="weightError"></span>
                                            <br>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">미용시작일</label>
                                                <input type="text" id="gs" name="gs" placeholder="" value="" class="input-text " placeholder="정확한 날짜를 모르더라도 대략적으로 입력해주세요">
											<br>
											<span id="gsError"></span>
                                            <br>
                                            

<!-- 											<p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated"> -->
                                                <label class="" for="billing_country">미용 주기 알림</label>
                                                
                                                <select class="country_to_state country_select" id="groomingPeriod" name="groomingPeriod">
                                                    <option selected="selected" value="GB">미설정</option>
                                                    <option value="DE">1달마다</option>
                                                    <option value="DE">2달마다</option>
                                                    <option value="GH">3달마다</option>
                                                    <option value="SB">4달마다</option>
                                                    <option value="SO">5섯달마다</option>
                                                    <option value="ZA">6섯달마다</option>
                                                    <option value="GS">7달마다</option>
                                                    <option value="GS">8달마다</option>
                                                    <option value="GS">9달마다</option>
                                                    <option value="GS">10달마다</option>
                                                    <option value="GS">11달마다</option>
                                                    <option value="GS">일년마다</option>
                                                </select>
                                                
                                               <div>
                                               	<!--<div class="create-account"> -->
                                               	 <p>*미용주기를 설정하면 애완동물의 미용시기를 D-day로 알려드립니다.</p>
												 <p>*알림을 원하지 않으시면 '미설정'으로 선택해주세요.</p>
                                            	</div>
<br>

											<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="ADD PET" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
											</div>
										</form>
										
										</div>
                                    </div>


                                </div>




 									















                              

                                   
                                </div>
                            </form>

                        </div>                       
                    </div>                    
                </div>
            </div>
        </div>
    </div>


    <div class="footer-top-area">
        <div class="container">
            <div class="row">
            
            
            
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                     <h1><img src="img/paw-print.png" id="paw-print"><span>WAWA</span></h1>
<!--                         <h2>e<span>Electronics</span></h2> -->
                        <p>애완견 통합관리 커뮤니티</p>
                    </div>
                </div>
                
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Explore WAWA</h2>
                        <ul>
                            <li><a href="#">찾아오시는 길</a></li>
                            <li><a href="#">이벤트</a></li>
                            <li><a href="#">개인정보취급방침</a></li>
                            <li><a href="#">회원약관</a></li>
                            <li><a href="#">사이트 문의 : 02-000-0000</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">News Letter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </form>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                     	 <h2 class="footer-wid-title">SNS</h2>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-pinterest"></i></a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
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
                        <p>&copy; 2017 WAWA. All Rights Reserved.</p>
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