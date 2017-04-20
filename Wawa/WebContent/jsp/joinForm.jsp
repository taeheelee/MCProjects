<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eElectronics - HTML eCommerce Template</title>
    
	<!-- ----- -->
	
    <script
  	src="https://code.jquery.com/jquery-2.2.4.min.js"
  	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
 	crossorigin="anonymous"></script>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		
    		var regId =  /^[a-z]+[a-z0-9]{5,19}$/g;
    		var regPassword = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
 			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    		var regPhoneNum =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
 			
    		$('#id').blur(function(){
    			
    			if(!regId.test($('#id').val())){
    				$('#idError').html('<font color="red">아이디 오류 (영문자로 시작하는 6~20자 영문자 또는 숫자)</font>');
    			}
    			
    		});
//     			var inputid = $('#id').val();
//    				$.ajax({
//    			     url : "idCheck.do",
//    			     type : 'GET',
//    			     data : 'id=' + inputid,
//    			     dataType: 'json',
//    			     success : function (data) {
//    			        if(data.result)
//    			        	alert('중복');
//    			        else 
//    			        	alert('사용가능'); 
//    			     },
//    			     error:function(){
//    			    	 alert('에러발생');
//    			     }
//    			 	});
//     		});
    		
//     		$('#nickname').on('blur', function(){
//     			var inputNickname = $('#nickname').val();
// 				$.ajax({
// 					url : "nicknameCheck.do",
// 					type : "GET",
// 					data : 'nickname=' + inputNickname,
// 					dataType : 'json',
// 					success : function (data){
// 						if(data.result)
// 							alert('중복');
// 						else
// 							alert('사용가능');
// 					},
// 					error : function(){
// 						alert('에러발생');
// 					}
// 				});
//     		});

		    $('#password').blur(function(){
  				if(!regPassword.test($('#password').val())){
//   					alert('비밀번호 형식이 잘못되었습니다.\n' 
//   	                        +'(영문,숫자를 혼합하여 6~20자 이내)'); 
  					$('#pwError').html('<font color="red">비밀번호 오류 (영문,숫자를 혼합하여 6~20자 이내)</font>');
  				}
  			});
  			
  			$('#conformPassword').blur(function(){
  				if($('#password').val() != $('#conformPassword').val()){
  					//alert('비밀번호가 일치하지 않습니다.');
  					$('#cpwError').html('<font color="red">불일치</font>');
  				}else {
  					$('#cpwError').html('<font color="green">일치</font>');
  				}
  			});
    		
  			$('#phoneNum').blur(function(){
  				if(!regPhoneNum.test($('#phoneNum').val())){
  					//alert('전화번호가 유효하지 않습니다.');	
  					$('#pnumError').html('<font color="red">전화번호 오류 (ex) 000-0000-0000)</font>');
  				}
  			});
  			
  			$('#email').blur(function(){
  				if(!regEmail.test($('#email').val())){
  					//alert('이메일 주소가 유효하지 않습니다.');	
  					$('#emailError').html('<font color="red">이메일 오류 (ex) abc@naver.com)</font>');
  				}
  			});
  			
    	});
    </script>
    
	
  </head>
  <body>
   
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>회원가입</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
 <div class="single-product-area">
<!--         <div class="zigzag-bottom"></div> -->
        <div class="container">
            <div class="row">
                
                <div class="col-md-55">
     
                    <div class="product-content-right">
                        <div class="woocommerce" >
                         
                     

                            <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">

                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">회원 정보 입력</h2>
                                        <div class="woocommerce-billing-fields">
                                            
       									<form action="/Wawa/join.do">
                                            
                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">ID<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="숫자, 대문자, 소문자, 언더바(_),하이픈(-), 4~12자리" 
                                                id="id" name="id" class="input-text ">
                                                <br>
                                                <span id="idError"></span>
                                            </p>
                                            <br>
                                               <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">닉네임<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="nickname" name="nickname" class="input-text ">
                                                <br>
                                                <span id="cidError"></span>
                                            </p>
                                            <br>

                                         	<p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">비밀번호<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="영문,숫자를 혼합하여 특수문자가능 6~20자6~20자리" 
                                                id="password" name="password" class="input-text ">
                                                <br>
                                                <span id="pwError"></span>
                                            </p>
                                            <br>
                                          
                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">비밀번호 확인<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="conformPassword" name="conformPassword" class="input-text ">
                                            	<span id="cpwError"></span>
                                            </p>
                                            <br>
                                            
                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">성별 <abbr title="required" class="required">*</abbr></label>
	                                            <div id="payment">
													<ul class="payment_methods methods">
														<li class="payment_method_paypal">
															<input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio" id="sex"> 남자
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio" id="sex"> 여자
														</li>
													</ul>
												</div>
                                            </p>
                                            <br>
                                            
											<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">연락처</label>
                                                <input type="text" id="phoneNum" name="phoneNum" placeholder="000-0000-0000" value="" class="input-text ">
                                                <br>
                                                <span id="pnumError"></span>
                                            </p>
                                            <br>
                                            	<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">이메일</label>
                                                <input type="text" id="email" name="email" placeholder="abc@naver.com" value="" class="input-text ">
                                                <br>
                                                <span id="emailError"></span>
                                            </p>
                                            <br>
                                           

<!--<div class="clear"></div> -->


											<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="JOIN US" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
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

  
  </body>
</html>