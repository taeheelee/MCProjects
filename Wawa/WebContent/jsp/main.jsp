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
												<h2>즐거운 봄 산책을 조심, 또 조심해야 하는 이유!</h2>
												<p>보기엔 아름답지만, 강아지에게는 위협적인 독성이 있는 꽃. 과연 어떤 꽃들이 있을까요? 후각이
													발달하고 호기심이 많은 강아지 우리가 조금만 신경쓰면, 즐거운 봄산책을 즐길 수 있어요~!</p>
												<a href="infoMain.do" class="readmore">Learn more</a>
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
												<h2>영양제 급여, 체크포인트!</h2>
												<p>'어떤' 영양제가 아니라, '언제' 영양제를 먹이냐에 주목할 것! 나이든 개의 건강을 위해
													영양제는 필수적인 것일까? 결론부터 말하면 ‘모든 개’가 ‘반드시’ 섭취해야 하는 것은 아니다. 영양제는
													건강 증진을 위한 보조식품일 뿐이다.</p>
												<a href="infoMain.do" class="readmore">Learn more</a>
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
												<h2>산책 않는 개, 광견병 주사 꼭 맞혀야 하나요?</h2>
												<p>반려동물과 함께 하는 여행, 광견병 예방접종은 필수 옛말에 이런 이야기가 있었다. 광견병에 걸린
													개에게 물리면 개처럼 울거나 침을 흘리면서 물을 무서워하다 미쳐서 죽는다고...</p>
												<a href="infoMain.do" class="readmore">Learn more</a>
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
						<a href="freeboardMain.do" class="wid-view-more">View All</a>
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
						<a href="reviewMain.do" class="wid-view-more">View All</a>
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
						<a href="lostMain.do" class="wid-view-more">View All</a>
						<c:forEach items="${thirdBoard.get(\"boardList\") }" var="lost"
							begin="0" end="2">
							<div class="single-product " style="padding: 5px;">
								<div class="col-md-11"
									style="background: #E6E6E6; padding: 15px 15px 5px 15px; width: 100%; margin: 0 auto;">
									<h4>${lost.category }</h4>
									<hr
										style="border-color: black; border: solid 1px; margin: 0 0 5px 0">
									<div align="right">${lost.writer }</div>
									<div class="col-md-6" id="wanted_photo"
										style="padding: 0; background: #e6e6e6">

										<div class="product-f-image">
											<!-- 마우스오버시 검정색 효과 범위-->
											<img src="imageShow/${lost.fileId}.do"
												onerror="this.src='img/noImage.png'" alt="">
											<div class="product-hover">
												<a href="lostDetails.do?boardIdx=${lost.boardIdx }"
													class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
											</div>
										</div>
										<!--  마우스오버시 검정색 효과 범위 끝 -->
									</div>
									<div class="col-md-6" id="wanted_content"
										style="padding: 0 0 0 15px;">
										<ul id="lostPet-ul">
											<li><b>이름 :</b> ${lost.name }</li>
											<li><b>품종 :</b> ${lost.kind }</li>
											<li><b>성별 :</b> ${lost.sex }</li>
											<c:choose>
												<c:when test="${lost.category =='찾고있어요'}">
													<li style="margin-bottom: 0px;"><b>잃어버린 장소</b></li>
												</c:when>
												<c:when test="${lost.category =='보호중입니다'}">
													<li style="margin-bottom: 0px;"><b>발견된 장소</b></li>
												</c:when>
												<c:otherwise>
													<li style="margin-bottom: 0px;"><b>장소</b></li>
												</c:otherwise>
											</c:choose>
											<li style="font-size: large; text-align: right;"><b>${lost.lostPlace }</b></li>
											<c:choose>
												<c:when test="${lost.category =='찾고있어요'}">
													<li style="margin-bottom: 0px;"><b>잃어버린 날짜</b></li>
												</c:when>
												<c:when test="${lost.category =='보호중입니다'}">
													<li style="margin-bottom: 0px;"><b>발견된 날짜</b></li>
												</c:when>
												<c:otherwise>
													<li style="margin-bottom: 0px;"><b>날짜</b></li>
												</c:otherwise>
											</c:choose>
											<li style="text-align: right;">${lost.lostDate }</li>
										</ul>
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