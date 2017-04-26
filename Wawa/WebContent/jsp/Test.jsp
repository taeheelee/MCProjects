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
    <link href="css/bootstrap.min.css" rel="stylesheet">
<!--     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- <script src="./tab.js?version=2"></script> -->
<!-- <script type="text/javascript"> -->
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script> 
    <link href="tabstyle.css" rel="stylesheet">
    
<!--     <script type="text/javascript" src="./tab.js?version=2"></script> -->
  </head>
  <body>
     
<div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="user-menu">
                        <ul>
                            <li><a href="join.html"><i class="fa fa-heart"></i> Join us</a></li>
                            <li><a href="logout.html"><i class="fa fa-user"></i> Logout</a></li>
                            <li><a href="login.html"><i class="fa fa-user"></i> Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="index.html"><img src="img/paw-print.png" id="paw-print"><span>WAWA</span></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
                    <div class="shopping-item">
                        <a href="cart.html">UserInfo - <span class="cart-amunt"> | PetName | age | ♂ or ♀<br>예방 접종 알림 D-?? 미용 주기 알림 D-??</span>  </a>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
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
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>나의 펫 메디컬케어</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>

<div class="single-product-area">
        
        <div class="container">
            <div class="row">
                <div class="col-md-3">
        
                <form method="post" action="#">
								<table cellspacing="0" class="shop_table cart">
									<thead>
										<tr>
											<th colspan="2" id="mypetmainimage">
												<img src="img/dog_04.jpg" alt="">
											</th>
										</tr>
									</thead>
									<tbody>
										<tr class="cart_item">
											<td colspan="2">
												<select class="country_to_state country_select" id="billing_country" name="billing_country">
                                                    <option selected="selected" id="mypet01">와와(이름)</option>
                                                    <option id="mypet02">애견이름2</option>
                                                    <option id="mypet03">애견이름3</option>
                                                    <option id="mypet04">애견이름4</option>
                                                    <option id="mypet05">애견이름5</option>
                                                </select>
											</td>
										</tr>
										<tr class="cart_item">
											<td colspan="2" id="kind">치와와(품종)</td>
										</tr>
										<tr class="cart_item">
											<td id="petsex">남</td>
											<td id="neutral">미중성</td>
										</tr>
										<tr class="cart_item">
											<td colspan="2" id="petage">00년00개월</td>
										</tr>
										<tr class="cart_item">
											<td colspan="2" id="weight">00kg</td>
										</tr>
										<tr class="cart_item">
											<td colspan="2" id="caloriesbyday">하루필요열량 000kcal</td>
										</tr>										



									</tbody>
								</table>
							</form>
                
                
                
               
                    
                 
                    
                    
                </div>
                <!-- 여기여기여기부터 -->
                <div class="col-md-8">
                    <div class="product-content-right">
                     <h2 class="sidebar-title">예방 접종 관리</h2>
                     <p>이 홈페이지에서 안내하는 사항은 참고용입니다. 전문의와 상담 후 예방접종 일정을 조율 하십시오.</p>
                     
                        <div class="woocommerce">
                        
                        
                        
                                            
<ul id="tabs">
	<li><a href="#" name="#tab1">종합백신 DHPPL</a></li>
	<li><a href="#" name="#tab2">코로나 Corona Virus</a></li>
	<li><a href="#" name="#tab3">켄넬코프  Kennel Cough</a></li>
	<li><a href="#" name="#tab4">광견병 Rabies</a></li>
</ul>
<div id="content">
	<div id="tab1">
		<h2>종합백신 DHPPL</h2>
		<p>개 홍역(Distemper), 전염성 간염(Infectious Hepatitis), 파보바이러스성 장염(Pavovirus Enteritis), 파라인플루엔자성 기관지염(Parainflluenza) 및 렙토스피라증(Leptospirosis) 등의 질병을 예방해주는 가장 중요한 예방접종이다.</p>
		<p>6~8주부터 시작해서 2~3주 간격으로 3~5회 접종, 매년 1회 추가접종한다. 접종 뒤 1주일간 목욕금지.</p>
		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th colspan="2">접종일정</th>
                        <th>접종예정일</th>
                        <th>D-day</th>
                        <th colspan="2">실제접종일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="cart_item">
                        <td class="product-remove" rowspan="5"><a>기초접종</a></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>
                            <input type="submit" value="수정" name="update_cart" class="button" style="padding: 5px 5px">
                        	<input type="submit" value="삭제" name="update_cart" class="button" style="padding: 5px 5px">
                        </td>
                    </tr>
                    <tr>
                        <td><a>2차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
                    </tr>
                    <tr>
                        <td><a>3차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td><a>4차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td><a>5차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
				</tbody>
			</table>
        </form>
</div>



<div id="tab2">
	<h2>코로나 Corona Virus</h2>
	<p>코로나바이러스성 장염은 피가 섞인 설사를 하고, 구토를 하며, 열이 나고, 식욕이 없어지는 증세가 특징.</p>
	<p>생후 6~8주부터 2~3주 간격으로 2회 접종, 매년 1회 추가접종한다.</p>
		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th colspan="2">접종일정</th>
                        <th>접종예정일</th>
                        <th>D-day</th>
                        <th colspan="2">실제접종일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="cart_item">
                        <td class="product-remove" rowspan="2"><a>기초접종</a></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>
                            <input type="submit" value="수정" name="update_cart" class="button" style="padding: 5px 5px">
                        	<input type="submit" value="삭제" name="update_cart" class="button" style="padding: 5px 5px">
                        </td>
                    </tr>
                    <tr>
                        <td><a>2차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                </tbody>
			</table>
        </form>
</div>
<div id="tab3">
	<h2>켄넬코프  Kennel Cough</h2>
	<p>주로 강아지들이 대량으로 있는 곳에서 공기를 통해 쉽게 감염되며 심한 마른기침을 일으키며 폐렴으로 진행되기도 한다.</p>
	<p>생후 6~8주부터 2~3주 간격으로 2회 접종, 매년 1회 추가접종한다.</p>
		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th colspan="2">접종일정</th>
                        <th>접종예정일</th>
                        <th>D-day</th>
                        <th colspan="2">실제접종일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="cart_item">
                        <td class="product-remove" rowspan="2"><a>기초접종</a></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>
                            <input type="submit" value="수정" name="update_cart" class="button" style="padding: 5px 5px">
                        	<input type="submit" value="삭제" name="update_cart" class="button" style="padding: 5px 5px">
                        </td>
                    </tr>
                    <tr>
                        <td><a>2차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                </tbody>
			</table>
        </form>

</div>
<div id="tab4">
	<h2>광견병 Rabies</h2>
	<p>광견병 바이러스가 매개하는 감염증으로 광견병은 공수병이라고도 한다. 모든 온혈동물에서 발생되는 질병으로 감염 동물로부터 교상(물리거나 할퀸 상처)을 통해 동물 및 사람에게 전파되는 중요한 인수공통전염병이다.</p>
	<p>생후 3개월 이상 된 강아지에게 1회 접종한 후 6개월 후 재접종한다. 매년 추가접종을 해야 한다</p>
	<h3>Imperdiet sem interdum nec</h3>
	<p>Mauris rhoncus tincidunt libero quis fringilla.</p>
		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th colspan="2">접종일정</th>
                        <th>접종예정일</th>
                        <th>D-day</th>
                        <th colspan="2">실제접종일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="cart_item">
                        <td class="product-remove"><a>기초접종</a></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>
                            <input type="submit" value="수정" name="update_cart" class="button" style="padding: 5px 5px">
                        	<input type="submit" value="삭제" name="update_cart" class="button" style="padding: 5px 5px">
                        </td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
                    </tr>>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                    <tr>
                        <td class=""colspan="2"><a title="Remove this item" class="remove" href="#">추가접종</a></td>
						<td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" placeholder="0000-00-00" value="" id="coupon_code" class="input-text" name="coupon_code"></td>
                        <td>등록</td>
                    </tr>
                </tbody>
			</table>
        </form>
</div>
</div><!-- tab end -->
                        
                        
                        
        
                         

                  
                        </div>                 
                    </div>                    
                </div>
            </div>
        </div>
    </div>

  

    <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2>e<span>Electronics</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">User Navigation </h2>
                        <ul>
                            <li><a href="">My account</a></li>
                            <li><a href="">Order history</a></li>
                            <li><a href="">Wishlist</a></li>
                            <li><a href="">Vendor contact</a></li>
                            <li><a href="">Front page</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categories</h2>
                        <ul>
                            <li><a href="">Mobile Phone</a></li>
                            <li><a href="">Home accesseries</a></li>
                            <li><a href="">LED TV</a></li>
                            <li><a href="">Computer</a></li>
                            <li><a href="">Gadets</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <input type="email" placeholder="Type your email">
                            <input type="submit" value="Subscribe">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>&copy; 2015 eElectronics. All Rights Reserved. Coded with <i class="fa fa-heart"></i> by <a href="http://wpexpand.com" target="_blank">WP Expand</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <!-- Latest jQuery form server-->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
    
<!-- tab form make sy -->
    <script src="tab.js"></script>
  </body>
</html>