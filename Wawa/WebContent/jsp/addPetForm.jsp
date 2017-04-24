<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
    		
    		var regDate = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
    		var regWeight = /^[0-9]*$/;
    
    		$('#birth').blur(function(){
    			if(!regDate.test($('#birth').val())){
    				$('#birthError').html('<font color="red">날짜입력 오류(ex) 2017-04-01)</font>');
    			}
    		});
    		
    		$('#weight').blur(function(){
    			if(!regWeight.test($('#weight').val())){
    				$('#weightError').html('<font color="red">몸무게입력 오류(ex) 4.3');
    			}
    		});
    		
    		$('#gs').blur(function(){
    			if(!regDate.test($('#gs').val())){
    				$('#gsError').html('<font color="red">날짜입력 오류(ex) 2017-04-01)</font>');
    			}
    		});
    	
    	});
    </script>
     
 
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
											<p id="billing_first_name_field" class="form-row form-row-first validate-required">
												<div class="file_input_div">
													<input type="button" value="파일 선택" class="file_input_button"/>
													<input type="file" class="file_input_hidden" onchange="javascript:document.getElementById('fileName').value = this.value" />
												</div>
												
												<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
											</p>
											<br>
												
											<p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_state">등록번호</label>
                                                <input type="text" id="resist" name="resist" placeholder="등록번호가 있을시에 입력하세요" value="" class="input-text ">
												<span id="weightError"></span>
                                            </p>
                                            <br>
                                            	
											<p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">애견 이름 <abbr title="필수입력사항" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="name" name="name" class="input-text ">
                                            </p>
                                            <br>

                                            <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
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
                                            </p>
                                            <br>
                                            
											<p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">생일<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" id="birth" name="birth" placeholder="ex) 2017-04-01">
												<span id="birthError"></span>
                                         	</p>
	                                        <br>
                                         
                                         
											<p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_state">몸무게(kg)</label>
                                                <input type="text" id="weight" name="weight" placeholder="숫자만 입력하세요" value="" class="input-text ">
												<span id="weightError"></span>
                                            </p>
                                            <br>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">미용시작일</label>
                                                <input type="text" id="gs" name="gs" value="" class="input-text " placeholder="ex) 2017-04-01">
											<span id="gsError"></span>
                                            </p>
                                            <br>
                                            

											<p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
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
                                            </p>
                                            <br>
                                               
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

  </body>
</html>