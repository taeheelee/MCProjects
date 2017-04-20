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
                        <h2>유기견 찾기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>



	<div class="single-product-area">
		<div class="container">
			<h2 class="sidebar-title2">찾고있어요/보호중입니다 </h2>
				<form action="/Wawa/partnerSearch.do" style="text-align: right;">
					<input type="radio" name="lost" value="찾고있어요"> 찾고있어요
					<input type="radio" name="lost" value="보호중입니다"> 보호중입니다
					<input type="text" placeholder="Seach.."> 
					<input type="submit" value="검색">
					<input type="button" value="유기견 등록" onclick="location.href='/Wawa/lostWriteForm.do'">
				</form>
		</div>

<!-- 		<div class="container">                    -->
<!-- 			<h3 class="sidebar-title">목록</h3> -->
<!-- 		</div> -->
		
<!-- 		<div class="container"> -->
<!-- 				<div class="container" style="float: right;"> -->
<!-- 				<form action="/Wawa/partnerSearch.do"> -->
<!-- 					<input type="text" placeholder="Search.."> -->
<!-- 					<input type="submit" value="검색"> -->
<!-- 				</form> -->
<!-- 				<input type="button" value="유기견 등록" onclick="location.href='/Wawa/lostWriteForm.do'"> -->
<!-- 				</div> -->
		
<!-- 		</div> -->

		<div class="container" id="">



			<div class="single-product col-md-4" style=" padding: 15px;">
				<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
					<h4>찾고있어요</h4>
					<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
					<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue">
					
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_03.jpg" alt="">
							<div class="product-hover">
								<a href="/Wawa/lostDetails.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					</div>
					<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;">
					<table border="1" style="width: 100%; font-size: small;	" >
						<tr><td>이름</td><td id="petname">이름</td></tr>
						<tr><td>품종</td><td id="petkind">품종</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
						<tr><td colspan="2">잃어버린 장소</td></tr>
						<tr><td colspan="2" id="place">OO동</td></tr>
						<tr><td colspan="2">잃어버린 날짜</td></tr>
						<tr><td colspan="2" id="lostdate">년월일</td></tr>
					</table>
					</div>
					<hr style="border-color: black; border: solid 1px;margin: 5px 0">
				</div>
			</div>
			<div class="single-product col-md-4" style=" padding: 15px;">
				<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
					<h4>찾고있어요</h4>
					<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
					<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue">
					
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_02.jpg" alt="">
							<div class="product-hover">
								<a href="/Wawa/lostDetails.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					</div>
					<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;">
					<table border="1" style="width: 100%; font-size: small;	" >
						<tr><td>이름</td><td id="petname">이름</td></tr>
						<tr><td>품종</td><td id="petkind">품종</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
						<tr><td colspan="2">잃어버린 장소</td></tr>
						<tr><td colspan="2" id="place">OO동</td></tr>
						<tr><td colspan="2">잃어버린 날짜</td></tr>
						<tr><td colspan="2" id="lostdate">년월일</td></tr>
					</table>
					</div>
					<hr style="border-color: black; border: solid 1px;margin: 5px 0">
				</div>
			</div>
			<div class="single-product col-md-4" style=" padding: 15px;">
				<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
					<h4>찾고있어요</h4>
					<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
					<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue">
					
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_01.jpg" alt="">
							<div class="product-hover">
								<a href="/Wawa/lostDetails.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					</div>
					<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;">
					<table border="1" style="width: 100%; font-size: small;	" >
						<tr><td>이름</td><td id="petname">이름</td></tr>
						<tr><td>품종</td><td id="petkind">품종</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
						<tr><td colspan="2">잃어버린 장소</td></tr>
						<tr><td colspan="2" id="place">OO동</td></tr>
						<tr><td colspan="2">잃어버린 날짜</td></tr>
						<tr><td colspan="2" id="lostdate">년월일</td></tr>
					</table>
					</div>
					<hr style="border-color: black; border: solid 1px;margin: 5px 0">
				</div>
			</div>
			<div class="single-product col-md-4" style=" padding: 15px;">
				<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
					<h4>찾고있어요</h4>
					<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
					<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue">
					
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_14.jpg" alt="">
							<div class="product-hover">
								<a href="/Wawa/lostDetails.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					</div>
					<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;">
					<table border="1" style="width: 100%; font-size: small;	" >
						<tr><td>이름</td><td id="petname">이름</td></tr>
						<tr><td>품종</td><td id="petkind">품종</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
						<tr><td colspan="2">잃어버린 장소</td></tr>
						<tr><td colspan="2" id="place">OO동</td></tr>
						<tr><td colspan="2">잃어버린 날짜</td></tr>
						<tr><td colspan="2" id="lostdate">년월일</td></tr>
					</table>
					</div>
					<hr style="border-color: black; border: solid 1px;margin: 5px 0">
				</div>
			</div>
			<div class="single-product col-md-4" style=" padding: 15px;">
				<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
					<h4>찾고있어요</h4>
					<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
					<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue">
					
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_13.jpg" alt="">
							<div class="product-hover">
								<a href="/Wawa/lostDetails.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					</div>
					<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;">
					<table border="1" style="width: 100%; font-size: small;	" >
						<tr><td>이름</td><td id="petname">이름</td></tr>
						<tr><td>품종</td><td id="petkind">품종</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
						<tr><td colspan="2">잃어버린 장소</td></tr>
						<tr><td colspan="2" id="place">OO동</td></tr>
						<tr><td colspan="2">잃어버린 날짜</td></tr>
						<tr><td colspan="2" id="lostdate">년월일</td></tr>
					</table>
					</div>
					<hr style="border-color: black; border: solid 1px;margin: 5px 0">
				</div>
			</div>
			<div class="single-product col-md-4" style=" padding: 15px;">
				<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
					<h4>찾고있어요</h4>
					<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
					<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue">
					
						<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
							<img src="img/dog_07.jpg" alt="">
							<div class="product-hover">
								<a href="/Wawa/lostDetails.do" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>
						</div><!--  마우스오버시 검정색 효과 범위 끝 -->
					</div>
					<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;">
					<table border="1" style="width: 100%; font-size: small;	" >
						<tr><td>이름</td><td id="petname">이름</td></tr>
						<tr><td>품종</td><td id="petkind">품종</td></tr>
						<tr><td id="petsex">성별</td><td id="petage">몇개월</td></tr>
						<tr><td colspan="2">잃어버린 장소</td></tr>
						<tr><td colspan="2" id="place">OO동</td></tr>
						<tr><td colspan="2">잃어버린 날짜</td></tr>
						<tr><td colspan="2" id="lostdate">년월일</td></tr>
					</table>
					</div>
					<hr style="border-color: black; border: solid 1px;margin: 5px 0">
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
	</div>




  </body>
</html>