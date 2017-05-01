<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="slider-area">
		<div id="slide-list" class="carousel carousel-fade slide"
			data-ride="carousel">

			<div class="slide-bulletz">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<ol class="carousel-indicators slide-indicators">
								<li data-target="#slide-list" data-slide-to="0" class="active"></li>
								<li data-target="#slide-list" data-slide-to="1"></li>
								<li data-target="#slide-list" data-slide-to="2"></li>
							</ol>
						</div>
					</div>
				</div>
			</div>

			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<div class="single-slide">
						<div class="slide-bg slide-one"></div>
						<div class="slide-text-wrapper">
							<div class="slide-text">
								<div class="container">
									<div class="row">
										<div class="col-md-6 col-md-offset-6">
											<div class="slide-content">
												<h2>We are awesome</h2>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Consequuntur, dolorem, excepturi. Dolore aliquam
													quibusdam ut quae iure vero exercitationem ratione!</p>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Modi ab molestiae minus reiciendis! Pariatur ab
													rerum, sapiente ex nostrum laudantium.</p>
												<a href="" class="readmore">Learn more</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="single-slide">
						<div class="slide-bg slide-two"></div>
						<div class="slide-text-wrapper">
							<div class="slide-text">
								<div class="container">
									<div class="row">
										<div class="col-md-6 col-md-offset-6">
											<div class="slide-content">
												<h2>We are great</h2>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Saepe aspernatur, dolorum harum molestias tempora
													deserunt voluptas possimus quos eveniet, vitae voluptatem
													accusantium atque deleniti inventore. Enim quam placeat
													expedita! Quibusdam!</p>
												<a href="" class="readmore">Learn more</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="single-slide">
						<div class="slide-bg slide-three"></div>
						<div class="slide-text-wrapper">
							<div class="slide-text">
								<div class="container">
									<div class="row">
										<div class="col-md-6 col-md-offset-6">
											<div class="slide-content">
												<h2>We are superb</h2>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Dolores, eius?</p>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Deleniti voluptates necessitatibus dicta recusandae
													quae amet nobis sapiente explicabo voluptatibus rerum nihil
													quas saepe, tempore error odio quam obcaecati suscipit
													sequi.</p>
												<a href="" class="readmore">Learn more</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- End slider area -->


	<div class="product-widget-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="single-product-widget">
						<h2 class="product-wid-title">자유게시판 최신글</h2>
						<a href="" class="wid-view-more">View All</a>
						<form method="post" action="#">
							<table cellspacing="0" class="shop_table cart">
								<thead>
									<tr>
										<th style="width: 9%">글번호</th>
										<th style="width: 12%">카테고리</th>
										<th style="width: 42%">글제목</th>
										<th>글쓴이</th>
										<th>조회수</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${firstBoard.get(\"boardList\") }"
										var="freeboard" begin="0" end="4">
										<tr class="cart_item">
											<td>${freeboard.boardIdx }</td>
											<td>${freeboard.category }</td>
											<td><a
												href="freeboardDetail.do?boardIdx=${freeboard.boardIdx }">${freeboard.title }</a></td>
											<td>${freeboard.writer }</td>
											<td>${freeboard.readCount }</td>
											<td>${freeboard.writeDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>



					</div>

					<div class="single-product-widget">
						<h2 class="product-wid-title">제품리뷰 BEST</h2>
						<a href="#" class="wid-view-more">View All</a>
						<form method="post" action="#">
							<table cellspacing="0" class="shop_table cart">
								<thead>
									<tr>
										<th style="width: 9%">글번호</th>
										<th style="width: 12%">카테고리</th>
										<th style="width: 35%">글제목</th>
										<th style="width: 5%">제품별점</th>
										<th>글쓴이</th>
										<th>조회수</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${secondBoard.get(\"boardList\") }"
										var="reviewboard" begin="0" end="4">
										<tr class="cart_item">
											<td>${reviewboard.boardIdx }</td>
											<td>${reviewboard.category }</td>
											<td><a
												href="reviewDetails.do?boardIdx=${reviewboard.boardIdx }">${reviewboard.title }</a></td>
											<c:if test="${reviewboard.starPoint == 5 }">
												<td>★★★★★</td>
											</c:if>
											<c:if test="${reviewboard.starPoint == 4 }">
												<td>★★★★☆</td>
											</c:if>
											<c:if test="${reviewboard.starPoint == 3 }">
												<td>★★★☆☆</td>
											</c:if>
											<c:if test="${reviewboard.starPoint == 2 }">
												<td>★★☆☆☆</td>
											</c:if>
											<c:if test="${reviewboard.starPoint == 1 }">
												<td>★☆☆☆☆</td>
											</c:if>
											<td>${reviewboard.writer }</td>
											<td>${reviewboard.readCount }</td>
											<td>${reviewboard.writeDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>


					</div>


				</div>
				<div class="col-md-4">
					<div class="single-product-widget">
						<h2 class="product-wid-title">유기견찾기</h2>
						<a href="#" class="wid-view-more">View All</a>
						<c:forEach items="${thirdBoard.get(\"boardList\") }" var="lost" begin="0" end="2">
							<div class="single-product " style="padding: 5px;">
								<div class="col-md-11"
									style="background: #E6E6E6; padding: 15px 15px 5px 15px; width: 100%; margin: 0 auto;">
									<h4>${lost.category }</h4>
									<hr
										style="border-color: black; border: solid 1px; margin: 0 0 5px 0">
									<div align="right">${lost.writer }</div>
									<div class="col-md-6" id="wanted_photo"
										style="padding: 0; background: blue">

										<div class="product-f-image">
											<!-- 마우스오버시 검정색 효과 범위-->
											<img src="img/dog_03.jpg" alt="">
											<div class="product-hover">
												<a href="lostDetails.do?boardIdx=${lost.boardIdx }"
													class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
											</div>
										</div>
										<!--  마우스오버시 검정색 효과 범위 끝 -->
									</div>
									<div class="col-md-6" id="wanted_content"
										style="padding: 0 0 0 15px;">
										<table border="1" style="width: 100%; font-size: small;">
											<tr>
												<td>이름</td>
												<td id="petname">${lost.name }</td>
											</tr>
											<tr>
												<td>품종</td>
												<td id="petkind">${lost.kind }</td>
											</tr>
											<tr>
												<td id="petsex">${lost.sex }</td>
												<td id="petage">${lost.age }</td>
											</tr>
											<tr>
												<td colspan="2">잃어버린/발견된 장소</td>
											</tr>
											<tr>
												<td colspan="2" id="place">${lost.lostPlace }</td>
											</tr>
											<tr>
												<td colspan="2">잃어버린/발견된 날짜</td>
											</tr>
											<tr>
												<td colspan="2" id="lostdate">${lost.lostDate }</td>
											</tr>
										</table>
									</div>
									<hr
										style="border-color: black; border: solid 1px; margin: 5px 0">
								</div>
							</div>
						</c:forEach>
				</div>
			</div>

		</div>
	</div>
	</div>
	<!-- End product widget area -->
</body>
</html>