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
		var regPassword = /^.*(?=^.{6,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[*!@#$%^&+=]).*$/;
		
		var flag1 = false;
		$('#inputPass').blur(function(){
			if(!regPassword.test($('#inputPass').val())){
				$('#pwError').html('<font color="red">비밀번호 오류 (알파벳 대소문자, 숫자, 특수문자를 혼합하여 6~20자 이내)</font>');
				flag1 = false;
			}else {		
				$('#pwError').html('<font color="green">사용가능</font>');
				flag1 = true;
			}
		});
		
		var flag2 = false;
		$('#inputConfirmPass').blur(function(){
			if($('#inputPass').val() == $('#inputConfirmPass').val()){
				$('#cpwError').html('<font color="green">일치</font>');
				flag2 = true;
			}else {
				$('#cpwError').html('<font color="red">불일치</font>');
				flag2 = false;
			}
		});
		
		$('#resistPass').click(function(){
			if(flag1 && flag2){
				alert("비밀번호가 성공적으로 변경되었습니다");
				$('#resistPass').attr('type','submit');
			}else if(flag1 == false){
				alert('비밀번호 형식을 확인하세요');
			}else if(flag2 = false){
				alert('비밀번호가 일치하지 않습니다');
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
                        <h2>비밀번호 설정하기</h2>
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
			                            <form  action="findPass.do?id='${id }'" class="checkout" method="post" name="checkout">
<!-- 			                            	id이렇게보내는거맞나 	 -->
			                            	<br>
			                            	
			                            	<table>
			                            		<tr>
			                            			<td width="100px" height="20px">	
			                            				<label style="width:100px;height:20px;" class="" for="billing_first_name">새로운 비밀번호:<abbr title="required" class="required">*</abbr>
                                                		</label>
                                                	</td>
			                            			<td> 
			                            				<input type="password" value="" style="width:200px;height:40px;" placeholder="알파벳 소문자,숫자를 혼합하여 특수문자가능 6~20자" 
		                                                id="inputPass" name="inputPass" class="input-text ">
		                                                <span id="pwError"></span>
			                            			</td>
			                            		</tr>
			                            		<tr>
			                            			<td width="100px" height="20px">	
			                            				<label style="width:100px;height:20px;" class="" for="billing_first_name">비밀번호 확인:<abbr title="required" class="required">*</abbr>
                                                		</label>
                                                	</td>
			                            			<td> 
			                            				<input type="password" style="width:200px;height:40px;" value="" placeholder="" 
			                            				id="inputConfirmPass" name="inputConfirmPass" class="input-text ">
                                            			<span id="cpwError"></span>
			                            			</td>
			                            		</tr>
			                            		
			                            	</table>
			                            	
											<div align="center" class="form-row place-order" style="float: right">
												<input type="button" data-value="Place order" value="변경" id="resistPass" class="button alt">
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