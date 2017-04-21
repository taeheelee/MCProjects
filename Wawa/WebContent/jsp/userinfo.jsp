<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eElectronics - HTML eCommerce Template</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
<!--     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/owl.carousel.css">
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="../css/responsive.css">
    
    <!--   JQuery -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 

      <script>
	    $(document).ready(function() {
	        $('#summernote').summernote();
	    });
  </script>
  
  </head>
  <body>
     
    
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
					<form enctype="multipart/form-data" action="userinfoUpdate.do">
						<p style="text-align: right;"> 
							<input type="submit" value="수정하기">
							<input type="submit" value="회원탈퇴">
						</p>
						<div class="single-product-widget">
							<div id="customer_details" class="col2-set" >
								<div class="col-md-12" style="padding-left: 30px; padding-top: 30px;">
									<div class="woocommerce-billing-fields">

										<label class="" for="billing_first_name">아이디</label> 
										<span id="userid">${userinfo.id}</span>
										<br><br>
										
										<label class="" for="billing_first_name">닉네임 <abbr	title="required" class="required">*</abbr></label> 
										<input type="text" value="${userinfo.nickname}">
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
										<input type="password" placeholder="15자리 이내의 알파벳, 숫자, 특수문자">
										<br><br>
							
										<label class="" for="billing_state">비밀번호 확인<abbr title="required" class="required">*</abbr></label> 
										<input type="password" placeholder="15자리 이내의 알파벳, 숫자, 특수문자">
										<br><br>
							
										<label class="" for="billing_first_name">연락처</label> 
										<input type="text" value="${userinfo.phone}" >
										<br><br>
										
										<label class="" for="billing_first_name">E-mail  </label> 
										<input type="text" value="${userinfo.email}" >
										<br><br>
								
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

   
   

    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="../js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="../js/main.js"></script>
  </body>
</html>