<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('.postLink').click(
						function() {
							var p = $(this).attr('href').split('?');
							var action = p[0];
							var params = p[1].split('&');
							var form = $(document.createElement('form')).attr(
									'action', action).attr('method', 'post');
							$('body').append(form);
							for ( var i in params) {
								var tmp = params[i].split('=');
								var key = tmp[0], value = tmp[1];
								$(document.createElement('input')).attr('type',
										'hidden').attr('name', key).attr(
										'value', value).appendTo(form);
							}
							$(form).submit();
							return false;
						});
			});
</script>
</head>
<body>




	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-left">
						<h2>이달의 뽐내기</h2>
						<c:if test="${best == '[]'}">
							<marquee scrollamount="20">
								<h1>이달의 뽐내기 BEST가 없습니다.</h1>
							</marquee>
						</c:if>
						<!--                         <div class="row"> -->
						<div class="best3">

							<c:forEach items="${best }" begin="0" end="2" var="best"
								varStatus="st">
								<div class="col-md-4 col-sm-6">
									<div class="single-product">
										<!-- 마우스오버 효과-->
										<div class="product-f-image" style="height: 250px;">
											<!-- 마우스오버시 검정색 효과 범위-->
											<img src="imageShow/${best.fileId}.do"
												onerror="this.src='img/no_image.jpg'" alt="">
											<div class="product-hover">
												<a
													href="increaseLike.do?boardIdx=${best.boardIdx }&userIdx=${sessionScope.idx}"
													class="add-to-cart-link postLink"><i
													class="fa fa-heart"></i> 좋아요</a> <a
													href="boastDetails.do?boardIdx=${best.boardIdx }"
													class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
											</div>
										</div>
										<!--  마우스오버시 검정색 효과 범위 끝 -->
										<h1 style="text-align: center; color: #FF7F27;">BEST
											${st.index+1}</h1>

										<div class="product-carousel-price">
											<p
												style="color: #ffc000; text-align: center; font-size: 18px; background-color: white;">${best.name.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }<br>(${best.sex })
												${best.age }살
											</p>
											<p style="color: #777; text-align: center;">♥좋아요
												${best.likeCount }개</p>
										</div>

										<h4 align="center">주인 : ${best.writer.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }</h4>
										<c:forEach items="${like }" var="like">
											<c:if test="${like.boardIdx == best.boardIdx}">
												<div align="center">
													<font style="color: red">내가 좋아요 한 게시글</font>
												</div>
											</c:if>
										</c:forEach>
									</div>
									<!-- 마우스오버 효과 끝-->
									<div align="center">${best.writeDate }</div>
								</div>
							</c:forEach>



						</div>






					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="single-product-area">

		<div class="container">

			<h2 class="sidebar-title2">뽐내기 후보 리스트</h2>
			<form action="boastSearch.do" style="text-align: right;">
				<input type="text" placeholder="펫이름검색" name="keyword" id="keyword">
				<input type="submit" value="검색">
				<c:if test="${sessionScope.name != null}">
					<input type="button" value="뽐내기 후보 등록"
						onclick="location.href='boastWriteForm.do'" style="height: 42px">
				</c:if>
			</form>

		</div>



		<div class="container">
			<c:forEach items="${boardList }" var="boast">
				<div class="single-product col-md-3" style="padding: 10px;">
					<div class="col-md-11 boast-list-petname"
						style="background: #f4f4f4; padding: 15px; width: 100%; height: 290px; margin: 0 auto;">
						<div class="product-f-image" style="height: 230px;">
							<!-- 마우스오버시 검정색 효과 범위-->
							<div class="recimg">
								<img src="imageShow/${boast.fileId}.do"
									onerror="this.src='img/no_image.jpg'" alt=""
									style="position: relative;">

							</div>
							<div class="listName">
							<table>
								<tr>
									<td id="petname"><span class="boastName">
											${boast.name.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }</span><br>
								</tr>
								<tr>
									<td id="like"
										style="font-weight: bold; font-size: 30px; text-align: right;">
										<span style="margin-right: 10px;">
										<img alt="" src="img/heart.png" style="width: 30px;"> ${boast.likeCount }개</span></td>
								</tr>
							</table>
							</div>
							<div class="product-hover" style="height: 153px; z-index: 3">
								<a
									href="increaseLike.do?boardIdx=${boast.boardIdx }&userIdx=${sessionScope.idx}"
									class="add-to-cart-link postLink"><i class="fa fa-heart"></i>
									좋아요</a> <a href="boastDetails.do?boardIdx=${boast.boardIdx }"
									class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
							</div>

						</div>
						<!--  마우스오버시 검정색 효과 범위 끝 -->

						<div align="center">
							주인 : ${boast.writer.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }<br>
						</div>
						<div align="center">
							<c:forEach items="${like }" var="like">
								<c:if test="${like.boardIdx == boast.boardIdx}">
									<font style="color: red">내가 좋아요 한 게시글</font>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="product-pagination text-center">
					<nav>
						<ul class="pagination">
							<c:if test="${current != 1 }">
								<c:choose>
									<c:when test="${keyword == null }">
										<li><a href="boastMain.do?page=${current-1 }"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="boastSearch.do?page=${current-1 }&keyword=${keyword}"
											aria-label="Next"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:forEach begin="${start }" end="${end }" var="page">
								<c:choose>
									<c:when test="${page==current }">
										<li><a href="#"><b style="color: black">${page }</b></a></li>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${keyword == null }">
												<li><a href="boastMain.do?page=${page }">${page }</a></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="boastSearch.do?page=${page }&keyword=${keyword}">${page }</a></li>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${current != last }">
								<c:choose>
									<c:when test="${keyword == null }">
										<li><a href="boastMain.do?page=${current+1 }"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="boastSearch.do?page=${current+1 }&keyword=${keyword}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>











	</div>






</body>
</html>