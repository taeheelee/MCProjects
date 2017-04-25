<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	 		var regPassword = /^.*(?=^.{6,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
 			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    		var regPhoneNum =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	 		$('#nick').blur(function(){
    			if($('#nick').val() != ''){
    			var inputNickname = $('#nick').val();
				 $.ajax({
					url : "nicknameCheck.do",
					type : "GET",
					data : 'nickname=' + inputNickname,
					dataType : 'json',
					success : function (data){
						if(data.result)
							$('#nickError').html('<font color="green">사용가능</font>');
						else
							$('#nickError').html('<font color="red">중복</font>');
					},
					error : function(){
						alert('에러발생');
					}
				}); 
    			}
    		});
		 	$('#password').blur(function(){
					if(!regPassword.test($('#password').val())){
						$('#pwError').html('<font color="red">비밀번호 오류 (영문,숫자를 혼합하여 6~20자 이내)</font>');
					}else {
						$('#pwError').html('<font color="green">사용가능</font>');
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
	  					$('#pnumError').html('<font color="red">전화번호 오류 (ex) 000-0000-0000</font>');
	  				}else{
	  					$('#pnumError').html('<font color="green">사용가능</font>');
	  				}
	  			});
				$('#email').blur(function(){
	  				if(!regEmail.test($('#email').val())){
	  					//alert('이메일 주소가 유효하지 않습니다.');	
	  					$('#emailError').html('<font color="red">이메일 오류 (ex) abc@naver.com)</font>');
	  				}else{
	  					$('#emailError').html('<font color="green">사용가능</font>');
	  				}
	  			});
	 	});
 	</script>
  
  </head>
  <body>
     

	<div class="product-big-title-area">
		<div class="container">
			<div class="col-md-12">
				<div class="product-bit-title text-left">
					<h2>내 정보</h2>
				</div>
			</div>
		</div>
	</div>

    <div class="product-widget-area">
        <div class="container">
            <div class="row">
            
              <div class="col-md-5">
					<h2 class="sidebar-title2">기본정보</h2>
						<form action="userUpdate.do" class="checkout" method="post" name="checkout">
					<p style="text-align: right;"> 
						<input type="submit" value="수정하기">
						<input type="button" value="회원탈퇴">
					</p>
					<div class="single-product-widget">
							
<div id="customer_details" class="col2-set">
	<div class="col-md-12" style="padding-left: 30px; padding-top: 30px;">
		<div class="woocommerce-billing-fields">
			<label class="" for="billing_first_name">아이디</label> 
			<span id="userid">${sessionScope.id }</span>
			<input type="hidden" value="${sessionScope.id }" name="id">
			<br><br>
			
			<label class="" for="billing_first_name">닉네임 <abbr	title="required" class="required">*</abbr></label> 
			<input type="text" value="${sessionScope.name }" placeholder="" id="nick" name="nickname" class="input-text ">
			<br>
			<span id="nickError"></span>

			<label class="">성별 </label>
            <div id="payment">
				<ul class="payment_methods methods">
					<li class="payment_method_paypal">
						<c:choose>
							<c:when test="${sessionScope.sex == 'male'}">
								<input type="radio" value="male" name="sex" checked="checked"> 남자
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" value="female" name="sex"> 여자
							</c:when>
							<c:otherwise>
								<input type="radio" value="male" name="sex"> 남자
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" value="female" name="sex" checked="checked"> 여자
							</c:otherwise>
						</c:choose>
						
					</li>
				</ul>
			</div>

			<label class="" for="billing_state">비밀번호<abbr title="required" class="required">*</abbr></label> 
			<input type="password" id="password" name="password" placeholder="15자리 이내의 알파벳, 숫자, 특수문자" value="${sessionScope.pass }" class="input-text ">
			<br>
			<span id="pwError"></span>

			<label class="" for="billing_state">비밀번호 확인<abbr title="required" class="required">*</abbr></label> 
			<input type="password" id="conformPassword" name="conformPassword" placeholder="15자리 이내의 알파벳, 숫자, 특수문자" value="" class="input-text ">
			<br>
			<span id="cpwError"></span>

			<label class="" for="billing_first_name">연락처</label> 
			<input type="text" value="${sessionScope.phone }" placeholder="" id="phoneNum" name="phone" class="input-text ">
			<br>
			<span id="pnumError"></span>
			
			<label class="" for="billing_first_name">E-mail  </label> 
			<input type="text" value="${sessionScope.email }" placeholder="" id="email" name="email" class="input-text ">
			<br>
			<span id="emailError"></span>



			</div>
		</div>


	</div>
                       
                    </div>
						</form>
                </div>
            
            
                <div class="col-md-7">
                    <div class="single-product-widget">
                      	<h2 class="sidebar-title">등록된 마이펫</h2>
                   <a href="#" class="wid-view-more">나의 펫 보러가기</a>
                        
                    <table style="width: 100%" >
				<thead>
					<tr>
						<th width="20%" style="text-align: center;">와와</th>
                        <th width="20%" style="text-align: center;">산체</th>
                        <th width="20%" style="text-align: center;">3</th>
                        <th width="20%" style="text-align: center;">4</th>
                        <th width="20%" style="text-align: center;">5</th>
                    </tr>
                </thead>
                <tbody>
                
                    <tr>
                   		<td style="text-align: center;"><img src="img/dog_09.jpg" alt=""style="width: 100%;"></td>
                        <td style="text-align: center;"><img src="img/dog_08.jpg" alt=""style="width: 100%;"></td>
                        <td style="text-align: center;">[]</td>
    					<td style="text-align: center;">[]</td>
                        <td style="text-align: center;">[]</td>
                    </tr>
				</tbody>
			</table>    
                        <br><br><br><br><br>
                        
                  
                         
                    </div>
                    
                                        <div class="single-product-widget">
                      	<h2 class="sidebar-title">내가 쓴 글 목록</h2>
<!--                         <a href="#" class="wid-view-more">View All</a> -->
                   
                <form method="post" action="#">
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th>게시판명</th>
                        <th>카테고리</th>
                        <th>글제목</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                
                    <tr class="cart_item">
                   		<td>[자유게시판]</td>
                        <td>[사료]</td>
                        <td><a href="#">맛좋은사료 	</a></td>
    					<td>0</td>
                        <td>2017-03-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>[제품리뷰]</td>
                        <td>[목욕/미용]</td>
                        <td><a href="#">윤기나는 샴푸</a></td>
    					<td>0</td>
                        <td>2017-02-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>[뽐내기]</td>
                        <td>[간식]</td>
                        <td><a href="#">영양 간식</a></td>
    					<td>0</td>
                        <td>2017-01-01</td>
                    </tr>
                  
                     
          
           
				</tbody>
			</table>
        </form>
                    </div>
                    
                    
                    
                </div>
                
                
                
                
                
                
              

            </div>
        </div>
    </div> <!-- End product widget area -->

  </body>
</html>