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
	 		if('${result}' != '')
				alert('${result}');
	 		
	 		var statusOfNickname = true;
			var statusOfNewPassword = false;
			var statusOfconfirmPassword = false;
	 		var regPassword = /^.*(?=^.{6,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
 			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    		var regPhoneNum = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	 		$('#nick').blur(function(){
    			if($('#nick').val() != ''){
    			var inputNickname = $('#nick').val();
    			var userid = $('#uid').val();
    			var allData = { "id": userid, "nickname": inputNickname };
				 $.ajax({
					url : "nicknameCheck.do",
					type : "GET",
					data : allData,
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
						alert('에러발생');
						statusOfNickname = false;
					}
				}); 
    			}
    		});
		 	$('#newPassword').keyup(function(){
					if(!regPassword.test($('#newPassword').val())){
						$('#pwError').html('<font color="red">비밀번호 오류 (영문,숫자를 혼합하여 6~20자 이내)</font>');
						statusOfNewPassword = false;
					}else {
						$('#pwError').html('<font color="green">사용가능</font>');
						statusOfNewPassword = true;
					}
				});
				
				$('#confirmPassword').keyup(function(){
					if($('#newPassword').val() != $('#confirmPassword').val()){
						$('#cpwError').html('<font color="red">불일치</font>');
						statusOfconfirmPassword = false;
					}else {
						$('#cpwError').html('<font color="green">일치</font>');
						statusOfconfirmPassword = true;
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
				
				$('#delete').click(function() {
						window.open('deleteForm.do', name ,"width=500, height=230");
				});
				$('#update').click(function(){
					if($('#newPassword').val() != '' && $('#confirmPassword').val() != ''){
						if(statusOfNickname && statusOfconfirmPassword && statusOfNewPassword){
		  					$('#update').attr('type','submit');
		  				}else if (statusOfNickname == false){
		  					alert('닉네임 오류입니다.');
		  					$('#nick').focus();
		  				}else if (statusOfNewPassword == false){
		  					alert('비밀번호 양식을 확인해주세요.');
		  					$('#newPassword').focus();
		  				}else if (statusOfconfirmPassword == false){
		  					alert('비밀번호가 일치하지 않습니다.');
		  					$('#confirmPassword').focus();
		  				}
					}else{
						if(statusOfNickname){
							$('#update').attr('type','submit');
						}else{
		  					alert('닉네임 오류입니다.');
		  					$('#nick').focus();
						}
					
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
						<input type="button" value="수정하기" id="update" style="padding: 5px 20px">
						<input type="button" value="회원탈퇴" id="delete">
					</p>
					<div class="single-product-widget">
							
<div id="customer_details" class="col2-set">
	<div class="col-md-12" style="padding-left: 30px; padding-top: 30px;">
		<div class="woocommerce-billing-fields">
			<label class="" for="billing_first_name">아이디</label> 
			<span id="userid">${id }</span>
			<input type="hidden" value="${id }" name="id" id="uid">
			<br><br>
			
			<label class="" for="billing_first_name">닉네임 <abbr	title="required" class="required">*</abbr></label> 
			<input type="text" value="${name }" placeholder="" id="nick" name="nickname" class="input-text ">
			<br>
			<span id="nickError"></span>

			<label class="">성별 </label>
            <div id="payment">
				<ul class="payment_methods methods">
					<li class="payment_method_paypal">
						<c:choose>
							<c:when test="${sex == 'male'}">
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
			<input type="password" id="password" name="password" placeholder="정보를 수정하려면 비밀번호를 입력하세요" class="input-text " size="45">
			<br>
			<label class="" for="billing_state">변경할 비밀번호<abbr title="required" class="required">*</abbr></label> 
			<input type="password" id="newPassword" name="newPassword" placeholder="비밀번호 변경시에만 입력하세요" class="input-text " size="45">
			<br>
			<span id="pwError"></span>
			<label class="" for="billing_state"> 비밀번호 확인<abbr title="required" class="required">*</abbr></label> 
			<input type="password" id="confirmPassword" name="confirmPassword" placeholder="변경할 비밀번호와 동일하게 입력하세요" class="input-text " size="45">
			<br>
			<span id="cpwError"></span>

			<label class="" for="billing_first_name">연락처</label> 
			<input type="text" value="${phone }" placeholder="" id="phoneNum" name="phone" class="input-text ">
			<br>
			<span id="pnumError"></span>
			
			<label class="" for="billing_first_name">E-mail  </label> 
			<input type="text" value="${email }" placeholder="" id="email" name="email" class="input-text ">
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
                   <a href="myPetInfo.do?id=${sessionScope.id}" class="wid-view-more">나의 펫 보러가기</a>
                        
                    <table style="width: 100%">
				<thead>
					<tr>
						<c:forEach var="pet" items="${petList }" varStatus="idx">
							<th width="20%" style="text-align: center;">${pet.name}</th>
						</c:forEach>
                    </tr>
                </thead>
                <tbody>
                
                    <tr>
                    	<c:forEach var="pet" items="${petList }" varStatus="idx">
	                   		<td style="text-align: center;"><img src="PetInfoImage/${pet.idx }.do" onerror="this.src='img/noImage.png'" alt="" width="200" height="150"></td>
                    	</c:forEach>
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
                	<c:forEach var="board" items="${boardList }" varStatus="idx">
                    	<tr class="cart_item">
                    	<c:choose>
					       <c:when test="${board.boardCode == 1}">
					           <td>애견정보/상식</td>
					       </c:when>
					       <c:when test="${board.boardCode == 2}">
					           <td>제품리뷰</td>
					       </c:when>
					       <c:when test="${board.boardCode == 3}">
					           <td>뽐내기</td>
					       </c:when>
					       <c:when test="${board.boardCode == 4}">
					           <td>유기견찾기</td>
					       </c:when>
					       <c:when test="${board.boardCode == 5}">
					           <td>짝꿍찾기</td>
					       </c:when>
					       <c:otherwise>
					           <td>자유게시판</td>
					       </c:otherwise>
					   </c:choose>
                        <td>${board.category }</td>
                        <td><a href="#">${board.title }	</a></td>
    					<td>${board.readCount }</td>
                        <td>${board.writeDate }</td>
                    </tr>
                    
                    </c:forEach>
                   
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