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
			$('#question1').val(option_selected);
			if(option_selected == 1){
				$('#addQuestion').val('1');
				$('#addAnswer').attr('placeholder', 'abc@naver.com');
			}else {
				$('#addQuestion').val('2');
				$('#addAnswer').attr('placeholder', '010-0000-0000');
			}
			statusOfAddtion = false;
		});
		
		$('#addAnswer').blur(function(){
			var flag = true;
			if($("#select_addtion option:selected").val() == "addDefault"){
				alert('질문을 먼저 선택해주세요');
				statusOfAddtion = false;
				flag = false;
			}
			if($('#addAnswer').val() == ""){
				alert('답을 입력해주세요');
				statusOfAddtion = false;
				flag = false;
			}
			if(flag){
				statusOfAddtion = true;
			}
		});
		
		$('#select_question1').change(function() {
			var option_selected = $("#select_question1 option:selected").val();
			$('#question1').val(option_selected);
			if(option_selected == "default1")
				statusOfQuestion1 = false;
			else 
				statusOfQuestion1 = true;
		});
		
		$('#select_question2').change(function() {
			var option_selected = $("#select_question2 option:selected").val();
			$('#question2').val(option_selected);
			if(option_selected == "default2")
				statusOfQuestion2 = false;
			else 
				statusOfQuestion2 = true;
		});
		
		var flag1 = true;
		$('#answer1').blur(function(){
			if(statusOfQuestion1 == false){
				alert('질문을 먼저 선택해주세요');
				flag1 = false;
			}else if($('#answer1').val() == ""){
				alert('답을 입력해주세요');
				flag1 = false;
			}else {
				flag1 = true;
			}
		});

		var flag2 = true;
		$('#answer2').blur(function(){
			if(statusOfQuestion2 == false){
				alert('질문을 먼저 선택해주세요');
				flag2 = false;
			}else if($('#answer2').val() == ""){
				alert('답을 입력해주세요');
				flag2 = false;
			}else {
				flag2 = true;
			}
			
		});
		
		$('#checkId').click(function(){
			
		});
		
		$('#findPass').click(function() {
			if(statusOfAddtion && statusOfQuestion1 && statusOfQuestion2){
				$('#findPass').attr('type','submit');
			}else if(statusOfAddtion == false){
				alert('본인인증은 필수입니다');
				$('#addQuestion').focus();
			}else if(statusOfQuestion1 == false || flag1 == false){
				alert('질문1을 입력해주세요');
				$('#question1').focus();
			}else if(statusOfQuestion2 == false || flag2 == false){
				alert('질문2을 입력해주세요');
				$('#question2').focus();
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
     
                    <div class="product-content-right">
                        <div class="woocommerce" >
                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">비밀번호 찾기</h2>
                                        <div class="woocommerce-billing-fields">
                                             	
			                      		   <form action="findPass.do" class="checkout" method="post" name="checkout">
			                            	
			                            	<br>
			                            	<table>
			                            		<tr>
			                            			<td width="100px" height="20px">	
			                            				<label style="width:100px;height:20px;" class="" for="billing_first_name">닉네임: <abbr title="required" class="required">*</abbr>
                                                		</label>
                                                	</td>
			                            			<td> 
			                            				<input id="inputName" name="inputName" style="width:200px;height:40px;" type="text" value="" placeholder="" class="input-text ">
			                            			</td>
			                            		</tr>
			                            		<tr>
			                            			<td width="100px" height="20px">	
			                            				<label style="width:100px;height:20px;" class="" for="billing_first_name">아이디: <abbr title="required" class="required">*</abbr>
     		                                           </label>
                                                	</td>
			                            			<td> 
			                            				  <input id="inputId" name="inputId" style="width:200px;height:40px;" type="text" value="" placeholder="" class="input-text ">
			                            				  &nbsp; <input type="button" data-value="Place order" value="확인" id="checkId" class="button alt">
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
	                                               		</td>
	                                               	</tr>
	                                              
                                               </table>
                                                
                                            <label style="width:50px;height:20px;" class="" for="billing_first_name">질문: <abbr title="required" class="required">*</abbr>
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
												<input type="button" data-value="Place order" value="찾기" id="findPass" class="button alt">
												<input type="button" data-value="Place order" value="취소" id="cancel" class="button alt" onclick="history.back(-1);">
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