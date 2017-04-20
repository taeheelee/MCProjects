<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
  <body>
  
  
     
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>이달의 뽐내기</h2>
<!--                         <div class="row"> -->
						<div class="best3">
						
							<div class="col-md-3 col-sm-6">
								<div class="single-product"><!-- 마우스오버 효과-->
									<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
										<img src="img/dog_10.jpg" alt="">
										<div class="product-hover">
											<a href="/Wawa/increaseLike.do" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
											<a href="/Wawa/boastDetails.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
										</div>
								</div><!--  마우스오버시 검정색 효과 범위 끝 -->
										<h1 style="text-align: center; color: #FF7F27;">BEST 1</a></h1>
										
										<div class="product-carousel-price">
											<p style="color: #ffc000; text-align: center; font-size: 18px; background-color: white;">뽀송이(♂) 2살</p>
											<p style="color: #777; text-align: center;">♥좋아요 55개</p>

										</div>
									</div><!-- 마우스오버 효과 끝-->
						
								
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="single-product"><!-- 마우스오버 효과-->
									<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
										<img src="img/dog_04.jpg" alt="">
										<div class="product-hover">
											<a href="/Wawa/increaseLike.do" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
											<a href="/Wawa/boastDetails.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
										</div>
								</div><!--  마우스오버시 검정색 효과 범위 끝 -->
										<h1 style="text-align: center; color: #FF7F27;">BEST 2</a></h1>
										
										<div class="product-carousel-price">
											<p style="color: #ffc000; text-align: center; font-size: 18px; background-color: white;">브라운(♂) 1살</p>
											<p style="color: #777; text-align: center;">♥좋아요 40개</p>

										</div>
									</div><!-- 마우스오버 효과 끝-->
						
								
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="single-product"><!-- 마우스오버 효과-->
									<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
										<img src="img/dog_03.jpg" alt="">
										<div class="product-hover">
											<a href="/Wawa/increaseLike.do" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
											<a href="/Wawa/boastDetails.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
										</div>
								</div><!--  마우스오버시 검정색 효과 범위 끝 -->
										<h1 style="text-align: center; color: #FF7F27;">BEST 3</a></h1>
										
										<div class="product-carousel-price">
											<p style="color: #ffc000; text-align: center; font-size: 18px; background-color: white;">와와(♂) 2살</p>
											<p style="color: #777; text-align: center;">♥좋아요 30개</p>

										</div>
									</div><!-- 마우스오버 효과 끝-->
						
								
							</div>
			</div>

		
        

        	
        	
                    </div>
                </div>
            </div>
        </div>
    </div>



	<div class="single-product-area">

		<div class="container">

			<h2 class="sidebar-title2">뽐내기 후보 리스트</h2>
				<p style="text-align: right;">
				<form action="/Wawa/boastSearch.do">
					<input type="text" placeholder="Seach.."> 
					<input type="button" value="검색">
									</form>
					<input type="button" value="뽐내기 후보 등록" onclick="location.href='/Wawa/boastWriteForm.do'">
				</p>
		</div>
		

		
		
		<div class="container">
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_01.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_02.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_03.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_04.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_05.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_06.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_07.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_08.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_09.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_10.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_11.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			<div class="single-product col-md-2" style=" padding: 10px;">
				<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_12.jpg" alt="" style="margin-bottom: 15px">
							<div class="product-hover">
								<a href="" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
								<a href="/Wawa/boastSearch.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
						<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>와와</span>(<span id="petsex">♂</span>)<span id="petage">2</span>살</td></tr>
						<tr><td id="like">♥좋아요 <span style="font-weight: bold">10</span>개</td></tr>
					</table>
				</div>
			</div>
			
		</div>
		
		
		<div class="row">
				<div class="col-md-12">
					<div class="product-pagination text-center">
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">6</a></li>
								<li><a href="#">7</a></li>
								<li><a href="#">8</a></li>
								<li><a href="#">9</a></li>
								<li><a href="#">10</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		
		
		
		
		
		
		
		
		
		
		
	</div>






  </body>
</html>