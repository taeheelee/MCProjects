<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


  <script
	src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
    
 
<script type="text/javascript">
	$(document).ready(function(){
		
		var statusOfQuestion1 = false;
		var statusOfQuestion2 = false;
		var statusOfAddtion = false;
		
		var msg = '${msg}';
		if(msg == ''){
			
		}else {
			alert(msg);
		}
		
		$('#select_addtion').change(function() {
			var option_selected = $("#select_addtion option:selected").val();
			$('#addQuestion').val(option_selected);
			if(option_selected == 1){
				$('#addQuestion').val('1');
				$('#addAnswer').attr('placeholder', 'abc@naver.com');
				statusOfAddtion = true;
			}else if(option_selected == 2){
				$('#addQuestion').val('2');
				$('#addAnswer').attr('placeholder', '010-0000-0000');
				statusOfAddtion = true;
			}else {				
				statusOfAddtion = false;
			}
		});
		
		var flag1 = true;
		$('#addAnswer').blur(function(){
			if(statusOfAddtion == false){
				alert('질문을 먼저 선택해주세요');
				flag1 = false;
			}else if($('#addAnswer').val() == ""){
				alert('답을 입력해주세요');
				flag1 = false;
			}else {
				flag1 = true;
			}
		});
		
		var flag = 1;
		$('#checkInfo').click(function(){
			var nickname = $('#inputName').val();
			var addQuestion = $("#addQuestion").val();
			var addAnswer = $("#addAnswer").val();
			if(nickname != "" && statusOfAddtion == true && flag1 == true){
				$.ajax({
					type : 'get',
					url : 'findNickname.do',
					data : 'nickname=' + nickname,
					dataType : 'json',
					success : function (data){
						if(data.result == false){
							if(addQuestion == 1){
								$.ajax({
				 					type : 'get',
				 					url : 'emailCheck.do',
				 					data : "email=" + addAnswer,
				 					dataType : 'json',
				 					success : function (data){
				 						if(data.result){
				 							$('#identify').html('<font color="red">본인인증실패</font>');
				 							flag = 1;
				 						}else{
				 							$('#identify').html('<font color="green">본인인증성공</font>');
				 							flag = 0;
				 						}
				 					},
				 					error : function(){
				 						alert('에러발생');
				 					}
				 				}); 
							}else if(addQuestion == 2){
								$.ajax({
				 					type : 'get',
				 					url : 'phonenumCheck.do',
				 					data : "phone=" + addAnswer,
				 					dataType : 'json',
				 					success : function (data){
				 						if(data.result){
				 							$('#identify').html('<font color="red">본인인증실패</font>');
				 							flag = 1;
				 						}else{
				 							$('#identify').html('<font color="green">본인인증성공</font>');
				 							flag = 0;
				 						}
				 					},
				 					error : function(){
				 						alert('에러발생');
				 					}
				 				});
							}
						}else {
							$('#identify').html('<font color="red">본인인증실패</font>');
						}
					}
					,error : function(){
			    		alert('잠시 후 다시 시도해주세요');
			    		statusOfId = false;
			     	}
				});
			}
		});
		
		$('#select_question1').change(function() {
			if(flag == 1){
				alert('본인 인증을 먼저 진행해주세요');
				$("#select_question1").val("default1");
			}
			
			var option_selected = $("#select_question1 option:selected").val();
			$('#question1').val(option_selected);
			if(option_selected == "default1"){				
				statusOfQuestion1 = false;
			}else {
				statusOfQuestion1 = true;
			}
		});
		
		var flag2 = true;
		$('#answer1').blur(function(){
			if(statusOfQuestion1 == false){
				alert('질문을 먼저 선택해주세요');
				flag2 = false;
			}else if($('#answer1').val() == ""){
				alert('답을 입력해주세요');
				flag2 = false;
			}
		});
		
		$('#select_question2').change(function() {
			if(flag == 1){
				alert('본인 인증을 먼저 진행해주세요');
				$("#select_question2").val("default2");
			}
			else if(statusOfQuestion1 == false || flag2 == false){
				alert('1번 질문을 먼저 작성하세요');
			}
		
			var option_selected = $("#select_question2 option:selected").val();
			$('#question2').val(option_selected);
			if(option_selected == "default2"){						
				statusOfQuestion2 = false;
			}else {
				statusOfQuestion2 = true;
			}
		});
		
		var myId;
		var result = false;
		function checkQA(question1, answer1, question2, answer2, nickname){
				$.ajax({ 
			 	    url : "chkQuestion.do",
			    	type : 'get',
			     	data : 'question1=' + question1 + "&answer1=" + answer1
				     	+ "&question2=" + question2 + "&answer2=" + answer2
				     	+ "&nickname=" + nickname,
			     	dataType: 'json',
	   			    success : function (data) {
	   			    	if(data.result){
	   			    		myId = data.id;
	   			    		result = true;
	   			    	}else{
	   			    		result = false;
	   			    	}
	   			    },
			     	error : function(){
			    		alert('잠시 후 다시 시도해주세요');
			     	}
			 	});
		}
		
		var flag3 = true;
		$('#answer2').blur(function(){
			if(statusOfQuestion2 == false){
				alert('질문을 먼저 선택해주세요');
				flag3 = false;
			}else if($('#answer2').val() == ""){
				alert('답을 입력해주세요');
				flag3 =  false;
			}else {
				flag3 = true;
				var nickname = $('#inputName').val();
				var question1 = $("#question1").val();
				var answer1 = $("#answer1").val();
				var question2 = $("#question2").val();
				var answer2 = $("#answer2").val();
				checkQA(question1, answer1, question2, answer2, nickname);
			}
		});
		
		$('#findId').click(function() {
				if(result && statusOfAddtion && statusOfQuestion1 && statusOfQuestion2 && result){
					alert("회원님의 아이디는 '" + myId +"'입니다");
					$('#findId').attr('type','submit');
				}else if(statusOfAddtion == false || flag1 == false){
					alert('본인인증은 필수입니다');
					$('#addQuestion').focus();
				}else if(statusOfQuestion1 == false || flag2 == false){
					alert('질문1을 입력해주세요');
					$('#question1').focus();
				}else if(statusOfQuestion2 == false || flag3 == false){
					alert('질문2을 입력해주세요');
					$('#question2').focus();
				}else if(result == false){
					alert('사용자 정보와 일치하지 않습니다');
					$("#question1").focus();
				}
		});

	});
</script>
<body>
	 <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>아이디/비밀번호 찾기</h2>
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
     
     <input type="hidden" id="myId" name="myId" value="">
  
                    <div class="product-content-right">
                        <div class="woocommerce" >
                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">아이디 찾기</h2>
                                        <div class="woocommerce-billing-fields">
			                            <form  action="findId.do" class="checkout" method="post" name="checkout">
			                            	
			                            	<br>
			                            	
			                            	<table>
			                            		<tr>
			                            			<td width="100px" height="20px">	
			                            				<label style="width:100px;height:20px;" class="" for="billing_first_name">닉네임:<abbr title="required" class="required">*</abbr>
                                                		</label>
                                                	</td>
			                            			<td> 
			                            				<input id="inputName" name="inputName" style="width:200px;height:40px;" type="text" value="" placeholder="" class="input-text ">
			                            			</td>
			                            		</tr>
			                            		
			                            	</table>
			                            	
			                            	<br>
                                                
                                            <label style="width:90px;height:20px;" class="" for="billing_first_name">인증방법: <abbr title="required" class="required">*</abbr>
                                            </label>
                                            
                                               <table>
	                                               	<tr>
	                                               		<td>
	                                               		<select id="select_addtion" name="select_addtion" style="width:300px;height:40px;" class="country_to_state country_select">
															<option id="addDefault" value="addDefault1">선택하세요</option>
															<option value="1">등록된 이메일로 찾기</option>
															<option value="2">등록된 폰번호로 찾기</option>
														</select>   
	                                               		&nbsp;&nbsp;&nbsp;&nbsp;
	                                               		</td>
	                                               		<td>
                                             			    <input id="addAnswer" align="top" name="addAnswer" style="width:300px;height:38px;" type="text" value="" placeholder="" class="input-text ">
	                                               			<input type="hidden" name="addQuestion" id="addQuestion" value="">
	                                               			&nbsp; <input type="button" id="checkInfo" name="checkInfo" value="인증"> 
			                            					<span id="identify"></span>
	                                               		</td>
	                                               	</tr>
	                                              
                                               </table>
                          
                                                
                                            <label style="width:90px;height:20px;" class="" for="billing_first_name">질문: <abbr title="required" class="required">*</abbr>
                                            </label>
                                            <div style="margin-left: 20px">
                                               	<abbr title="required" class="required">* <font color="red" size="1"> 가입할 때 입력하셨던 질문을 선택하세요 </font></abbr>
                                            </div>
                                            
                                            <br>
                                               <table>
	                                               	<tr>
	                                               		<td>
	                                               		<label style="width:5px;height:20px;" class="" for="billing_first_name">1.<abbr title="required" class="required">*</abbr>
                                                		</label>
	                                               		</td>
	                                               	</tr>
	                                               	<tr>
	                                               		<td>
	                                               		<select id="select_question1" name="select_question1" style="width:300px;height:40px;" class="country_to_state country_select">
															<option id="default1" value="default1">선택하세요</option>
															<option value="1">가장 좋아했던 초등학교 선생님 성함은?</option>
															<option value="2">가장 기억에 남는 장소는?</option>
															<option value="3">자주 가는 식당이름은?</option>
															<option value="4">가장 좋아하는 친구 이름은?</option>
															<option value="5">가장 기억에 남는 애인 이름은?</option>
															<option value="6">가장 좋아하는 음식은?</option>
														</select>   
	                                               		&nbsp;&nbsp;&nbsp;&nbsp;
	                                               		</td>
	                                               		<td>
                                             			    <input id="answer1" align="top" name="answer1" style="width:300px;height:38px;" type="text" value="" placeholder="질문의 답을 입력하세요" class="input-text ">
	                                               			<input type="hidden" name="question1" id="question1" value="">
	                                               		</td>
	                                               	</tr>
	                                               	<tr>
	                                               		<td>
	                                               		<label style="width:5px;height:20px;" class="" for="billing_first_name">2.<abbr title="required" class="required">*</abbr>
                                                		</label>
	                                               		</td>
	                                               	</tr>
	                                               	<tr>
	                                               		<td>
	                                               		<select id="select_question2" name="select_question2" style="width:300px;height:40px;" class="country_to_state country_select">
															<option id="default2" value="default2">선택하세요</option>
															<option value="1">가장 좋아했던 초등학교 선생님 성함은?</option>
															<option value="2">가장 기억에 남는 장소는?</option>
															<option value="3">자주 가는 식당이름은?</option>
															<option value="4">가장 좋아하는 친구 이름은?</option>
															<option value="5">가장 기억에 남는 애인 이름은?</option>
															<option value="6">가장 좋아하는 음식은?</option>
														</select>   
	                                               		&nbsp;&nbsp;&nbsp;&nbsp;
	                                               		</td>
	                                               		<td>
                                             			    <input id="answer2" align="top" name="answer2" style="width:300px;height:38px;" type="text" value="" placeholder="질문의 답을 입력하세요" class="input-text ">
	                                               			<input type="hidden" name="question2" id="question2" value="">
	                                               		
	                                               		</td>
	                                               	</tr>
                                               </table>
                                            <br>
                                            
											<div align="center" class="form-row place-order" style="float: right">
												<input type="button" data-value="Place order" value="찾기" id="findId" class="button alt">
												<input type="button" data-value="Place order" value="취소" id="cancel" class="button alt" onclick="history.back(-1);" >
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