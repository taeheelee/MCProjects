<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    		
    		if('${isJoin}' != '')
    			alert('${isJoin}');
    		//정규식
    		var regId =  /^.*(?=^.{4,12}$)(?=.*[a-z]).*$/;
    		var regPassword = /^.*(?=^.{6,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[*!@#$%^&+=]).*$/;
 			var regEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var regPhoneNum = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			//회원가입시 정보입력이 제대로 된 경우만 가입시키기 위해 각 입력 상태값 만들기
			var statusOfId = false;
			var statusOfNickname = false;
			var statusOfPassword = false;
			var statusOfConfirmPassword = false;
	
			//이 두개는 필수정보가아니라 일단 제외
			
			var statusOfSex = false;
			
			var statusOfquestion1 = false;
			var statusOfquestion2 = false;
			var statusOfquestionEQ = false;
			
			var statusOfEmail = false;
			var statusOfPhoneNum = false;
			var statusOfAddtion = false;
			
			$('#select_question1').change(function() {
    			var option_selected = $("#select_question1 option:selected").val();
    			
    			if(option_selected != "default1"){
    				$('#question1').val(option_selected);
    				statusOfquestion1 = false;
    			}
    			if($('#select_question1').val() == $('#select_question2').val()){
    				$("#select_question1").val("default1").attr("selected", "selected");	
    				alert('서로 다른 질문을 선택해주세요');
    				statusOfquestionEQ = false;
    			}else {				
	    			statusOfquestionEQ = true;
    			}
			});
			
    		$('#select_question2').change(function() {
				var option_selected = $("#select_question2 option:selected").val();
    			
    			if(option_selected != "default2"){
    				$('#question2').val(option_selected);
    				statusOfquestion2 = false;
    			}
    			if($('#select_question1').val() == $('#select_question2').val()){
    				$("#select_question2").val("default2").attr("selected", "selected");	
    				alert('서로 다른 질문을 선택해주세요');
    				statusOfquestion2 = false;
    			}else {				
	    			statusOfquestionEQ = true;
    			}
    		});
    		
    		$('#answer1').blur(function(){
    			var flag = true;
    			if($("#select_question1 option:selected").val() == "default1"){
    				alert('질문을 먼저 선택해주세요');
    				statusOfquestion1 = false;
    				flag = false;
    			}
    			if($('#answer1').val() == ""){
    				alert('답을 입력해주세요');
    				statusOfquestion1 = false;
    				flag = false;
    			}
    			if(flag){
    				statusOfquestion1 = true;
    			}
    		});

			$('#answer2').blur(function(){
				var flag = true;
				if($("#select_question2 option:selected").val() == "default2"){
    				alert('질문을 먼저 선택해주세요');
    				statusOfquestion2 = false;
    				flag = false;
    			}
				if($('#answer2').val() == ""){
    				alert('답을 입력해주세요');
    				statusOfquestion2 = false;
    				flag =  false;
    			}
				if(flag){
					statusOfquestion2 = true;
				}
    		});
    		
    		$('#id').blur(function(){
    			
    			if(!regId.test($('#id').val())){
    				$('#idError').html('<font color="red">아이디 오류 (알파벳 소문자 또는 소문자+숫자 4~12자)</font>');
    				statusOfId = false;
    			}else{
    				var inputid = $('#id').val();
     				$.ajax({ 
     			 	    url : "idCheck.do",
     			    	type : 'GET',
      			     	data : 'id=' + inputid,
       			     	dataType: 'json',
    	   			    success : function (data) {
     	   			        if(data.result){
        			     			$('#idError').html('<font color="green">사용가능</font>');
        			     			statusOfId = true;
     	   			        }
     	   			        else {
     	   			        	$('#idError').html('<font color="red">중복</font>');
     	   			        	statusOfId = false;
     	   			        }
    	   			    },
       			     	error : function(){
       			    		alert('잠시 후 다시 시도해주세요');
       			    		statusOfId = false;
       			     	}
       			 	});
    			}
 
   				
    		});
    		
    		$('#nick').blur(function(){
    			if($('#nick').val() != ''){
    			var inputNickname = $('#nick').val();
				 $.ajax({
					url : "nicknameCheck.do",
					type : "GET",
					data : 'nickname=' + inputNickname,
					dataType : 'json',
					success : function (data){
						if(data.result){
							$('#nickError').html('<font color="green">사용가능</font>');
							statusOfNickname = true;
						}
						else{
							$('#nickError').html('<font color="red">중복</font>');
							statusOfNickname = false;
						}
					},
					error : function(){
						statusOfNickname = false;
						alert('에러발생');
					}
				}); 
    			}
    		});
		    $('#password').keyup(function(){
  				if(!regPassword.test($('#password').val())){
  					chk();
  					$('#pwError').html('<font color="red">비밀번호 오류 (알파벳 대소문자, 숫자, 특수문자를 혼합하여 6~20자 이내)</font>');
  					statusOfPassword = false;
  					
  				}else {
  	  				chk();
  					$('#pwError').html('<font color="green">사용가능</font>');
  					statusOfPassword = true;
  				}
  			});
  			
  			$('#confirmpassword').keyup(function(){
  				chk();
  			});
  			
  			//비밀번호 확인 함수
  			var chk = function() {
					if($('#password').val() != $('#confirmpassword').val()){
	  					//alert('비밀번호가 일치하지 않습니다.');
	  					statusOfConfirmPassword = false;
	  					$('#cpwError').html('<font color="red">불일치</font>');
	  				}else {
	  					$('#cpwError').html('<font color="green">일치</font>');
	  					statusOfConfirmPassword = true;
	  				}
			};
  			
  			$('#phoneNum').blur(function(){
  				var phonenum = $('#phoneNum').val();
  				if(!regPhoneNum.test(phonenum)){
  					//alert('전화번호가 유효하지 않습니다.');	
  					$('#pnumError').html('<font color="red">전화번호 오류 (ex) 000-0000-0000)</font>');
  				}else {
  					$('#pnumError').html('<font color="green">사용가능</font>');
  					 $.ajax({
  						url : "phonenumCheck.do",
  						type : "GET",
  						data : 'phone=' + phonenum,
  						dataType : 'json',
  						success : function (data){
  							if(data.result){
  								$('#pnumError').html('<font color="green">사용가능</font>');
  								statusOfPhoneNum = true;
  							}
  							else{
  								$('#pnumError').html('<font color="red">중복</font>');
  								statusOfPhoneNum = false;
  							}
  						},
  						error : function(){
  							statusOfPhoneNum = false;
  							alert('에러발생');
  						}
  					}); 
  				}
  			});
  			
  			$('#email').blur(function(){
  				var email = $('#email').val();
  				if(!regEmail.test(email)){
  					//alert('이메일 주소가 유효하지 않습니다.');	
  					$('#emailError').html('<font color="red">이메일 오류 (ex) abc@naver.com)</font>');
  				}else {
  					$('#emailError').html('<font color="green">사용가능</font>');
  					 $.ajax({
  						url : "emailCheck.do",
  						type : "GET",
  						data : 'email=' + email,
  						dataType : 'json',
  						success : function (data){
  							if(data.result){
  								$('#emailError').html('<font color="green">사용가능</font>');
  								statusOfEmail = true;
  							}
  							else{
  								$('#emailError').html('<font color="red">중복</font>');
  								statusOfEmail = false;
  							}
  						},
  						error : function(){
  							statusOfEmail = false;
  							alert('에러발생');
  						}
  					}); 
  				}
  			});
  			
  			$('.input-radio').click(function() {
				statusOfSex = true;
			});
			
  			$('#join').click(function() {
  				if(statusOfEmail == true || statusOfPhoneNum == true){
  					statusOfAddtion = true;
  				}
  				
  				if(statusOfId && statusOfNickname && statusOfConfirmPassword && statusOfPassword && 
  						statusOfSex && statusOfquestion1 && statusOfquestion2 && statusOfquestionEQ
  						&& statusOfAddtion){
  					$('#join').attr('type','submit');
  				}else if(statusOfId == false){
  					alert('ID 오류입니다.');
  					 $('#id').focus();
  				}else if (statusOfNickname == false){
  					alert('닉네임 오류입니다.');
  					$('#nick').focus();
  				}else if (statusOfPassword == false){
  					alert('비밀번호 양식을 확인해주세요.');
  					$('#password').focus();
  				}else if (statusOfConfirmPassword == false){
  					alert('비밀번호가 일치하지 않습니다.');
  					$('#confirmpassword').focus();
  				}else if (statusOfSex == false){
  					alert('성별을 선택해주세요');
  					$('#sex').focus();
  				}else if(statusOfquestion1 == false){
  					alert('질문1을 입력해주세요');
  					$('#question1').focus();
  				}else if(statusOfquestion2 == false){
  					alert('질문2을 입력해주세요');
  					$('#question2').focus();
  				}else if(statusOfquestionEQ == false){
  					alert('서로 다른 질문을 선택해주세요');
  					$('#question1').focus();
  				}else if(statusOfAddtion == false){
  					alert('이메일이나 폰번호 중 하나는 필수입니다');
  					$('#phoneNum').focus();
  				}
			})

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
                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">회원 정보 입력</h2>
                                        <div class="woocommerce-billing-fields">
			                            <form  class="checkout" method="post" name="checkout">
                                            <br>   
                                                <label class="" for="billing_first_name">ID<abbr title="required" class="required" autofocus>*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="알파벳 소문자, 숫자를 혼합하여 4~12자리" 
                                                id="id" name="id" class="input-text ">
                                                <br>
                                                <span id="idError"></span>
                                            <br>
                                               <label class="" for="billing_first_name">닉네임<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" id="nick" name="nickname" class="input-text ">
                                                <br>
                                                <span id="nickError"></span>
                                            <br>
                                         	    <label class="" for="billing_first_name">비밀번호<abbr title="required" class="required">* <font color="red" size="1"> 사용가능한 특수문자 : *!@#$%^&+=</font></abbr>
                                                </label>
                                                <input type="password" value="" placeholder="알파벳 소문자,숫자를 혼합하여 특수문자가능 6~20자" 
                                                id="password" name="password" class="input-text ">
                                                <br>
                                                <span id="pwError"></span>
                                            <br>
                                                <label class="" for="billing_first_name">비밀번호 확인<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="password" value="" placeholder="" id="confirmpassword" name="confirmpassword" class="input-text ">
                                            	<span id="cpwError"></span>
                                            <br>
                                           		<label class="" for="billing_first_name">비밀번호 찾기 질문<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <label style="width:5px;height:20px;" class="" for="billing_first_name">1.<abbr title="required" class="required">*</abbr>
                                                </label>
                                            	<select id="select_question1" name="select_question1" style="width:350px;height:40px;" class="country_to_state country_select">
													<option id="default1" value="default1">선택하세요</option>
													<option value="1">가장 좋아했던 초등학교 선생님 성함은?</option>
													<option value="2">가장 기억에 남는 장소는?</option>
													<option value="3">자주 가는 식당이름은?</option>
													<option value="4">가장 좋아하는 친구 이름은?</option>
													<option value="5">가장 기억에 남는 애인 이름은?</option>
													<option value="6">가장 좋아하는 음식은?</option>
												</select>   
												&nbsp;
												&nbsp;
                                            	<input type="hidden" name="question1" id="question1" value="">
                                                <input id="answer1" name="answer1" style="width:450px;height:40px;" type="text" value="" placeholder="질문의 답을 입력하세요" class="input-text ">
                                            <br>
                                            	<label style="width:5px;height:20px;" class="" for="billing_first_name">2.<abbr title="required" class="required">*</abbr>
                                                </label>
                                            	<select id="select_question2" name="select_question2" style="width:350px;height:40px;" class="country_to_state country_select">
													<option id="default2" value="default2">선택하세요</option>
													<option value="1">가장 좋아했던 초등학교 선생님 성함은?</option>
													<option value="2">가장 기억에 남는 장소는?</option>
													<option value="3">자주 가는 식당이름은?</option>
													<option value="4">가장 좋아하는 친구 이름은?</option>
													<option value="5">가장 기억에 남는 애인 이름은?</option>
													<option value="6">가장 좋아하는 음식은?</option>
												</select>
												&nbsp;
												&nbsp;   
                                            	<input type="hidden" name="question2" id="question2" value="">
                                                <input id="answer2" name="answer2" style="width:450px;height:40px;" type="text" value="" placeholder="질문의 답을 입력하세요" class="input-text ">
                                            <br>
                                                <label class="" for="billing_first_name">성별 <abbr title="required" class="required">*</abbr></label>
	                                            <div id="payment">
													<ul class="payment_methods methods">
														<li class="payment_method_paypal">
															<input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio"> 남자
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio"> 여자
														</li>
													</ul>
												</div>
                                            <br>
											    <label class="" for="billing_state">연락처</label>
                                                <input type="text" id="phoneNum" name="phone" placeholder="000-0000-0000" value="" class="input-text ">
                                                <br>
                                                <span id="pnumError"></span>
                                            <br>
                                            	<label class="" for="billing_state">이메일</label>
                                                <input type="text" id="email" name="email" placeholder="abc@naver.com" value="" class="input-text ">
                                                <br>
                                                <span id="emailError"></span>
                                            <br>
<!--<div class="clear"></div> -->
											<div class="form-row place-order" style="float: right">
												<input type="button" data-value="Place order" value="JOIN US" id="join" class="button alt">
											</div>
										</form>
										</div>
                                    </div>
                                </div>
                                </div>
                        </div>                       
                    </div>                    
                </div>
            </div>
        </div>
  </body>
</html>