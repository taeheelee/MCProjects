<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eElectronics - HTML eCommerce Template</title>
  
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
						<form enctype="multipart/form-data" action="#" class="checkout"method="post" name="checkout">
					<p style="text-align: right;"> 
						<input type="submit" value="수정하기">
						<input type="submit" value="회원탈퇴">
<!-- 						<input type="button" value="수정하기" onclick="location.href='#'"> -->
<!-- 						<input type="button" value="회원탈퇴" onclick="location.href='#'"> -->
					</p>
					<div class="single-product-widget">

						<!-- 요기사이에 -->

							
<div id="customer_details" class="col2-set">
	<div class="col-md-12" style="padding-left: 30px; padding-top: 30px;">
		<div class="woocommerce-billing-fields">
			<label class="" for="billing_first_name">아이디</label> 
			<span id="userid">idididid</span>
			<br><br>
			
			<label class="" for="billing_first_name">닉네임 <abbr	title="required" class="required">*</abbr></label> 
			<input type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text ">
			<br>

			<label class="">성별 </label>
            <div id="payment">
				<ul class="payment_methods methods">
					<li class="payment_method_paypal">
						<input type="radio" value="male" name="usersex"> 남자
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" value="female" name="usersex"> 여자
					</li>
				</ul>
			</div>

			<label class="" for="billing_state">비밀번호<abbr title="required" class="required">*</abbr></label> 
			<input type="password" id="billing_state" name="billing_state" placeholder="15자리 이내의 알파벳, 숫자, 특수문자" value="" class="input-text ">
			<br><br>

			<label class="" for="billing_state">비밀번호 확인<abbr title="required" class="required">*</abbr></label> 
			<input type="password" id="billing_state" name="billing_state" placeholder="15자리 이내의 알파벳, 숫자, 특수문자" value="" class="input-text ">
			<br><br>

			<label class="" for="billing_first_name">연락처</label> 
			<input type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text ">
			<br><br>
			
			<label class="" for="billing_first_name">E-mail  </label> 
			<input type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text ">
			<br><br>



			</div>
		</div>


	</div>


                       
                       
                       
                      <!-- 요기사이에 -->
                       
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