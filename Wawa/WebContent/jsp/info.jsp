<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h2>애견정보/상식</h2>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 여기부터 안에 들어가면 안되는 이유찾기 -->
	<div class="single-product-area">

		<div class="container">
			<!--             <div class="row"> -->

			<div class="col-md-55">

				<!--                     <div class="product-content-right"> -->
				<!--                         <div class="woocommerce" > -->



				<!--                             <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout"> -->


				<div id="customer_details" class="col2-set">
					<div class="col-3">
						<h2 class="sidebar-title2">글 목록</h2>
						<div class="form-row place-order" style="float: right">
							<c:if test="${sessionScope.name != null}">
							<input type="button" data-value="Place order"
								onclick="location.href='infoWriteForm.do'" value="WRITE"
								id="place_order" name="woocommerce_checkout_place_order"
								class="button alt">
							</c:if>
							<h2>&nbsp;</h2>
						</div>







						<form method="post" action="#">
							<table cellspacing="0" class="shop_table cart">
								<thead>
									<tr>
										<th>글번호</th>
										<th>카테고리</th>
										<th>글제목</th>
										<th>글쓴이</th>
										<th>조회수</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${boardList }" var="info">
										<tr class="cart_item">
											<td>${info.boardIdx }</td>
											<td>[${info.category }]</td>
											<td><a href="infoDetails.do?boardIdx=${info.boardIdx }">${info.title }</a></td>
											<td>${info.writer }</td>
											<td>${info.readCount }</td>
											<td>${info.writeDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
						<label class="" for="billing_country">게시글 검색</label>
						<form action="infoSearch.do">
							<table style="width: 100%">
								<tr>
									<td width="20%"><select
										class="country_to_state country_select" id="category"
										name="category">
											<option selected="selected" value="1">애견상식</option>
											<option value="2">훈련정보</option>
											<option value="3">애견간식레시피</option>
											<option value="4">기타</option>
									</select></td>
									<td width="3%"></td>
									<td width="62%">
										<input type="text" id="keyword" name="keyword" placeholder="Search..." value=""
										class="input-text "></td>
									<td width="3%"></td>
									<td width="12%" align="right"><input type="submit"
										data-value="Place order" value="SEARCH" id="place_order"
										name="woocommerce_checkout_place_order" class="button alt">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>

				<div class="col-md-12">
					<div class="product-pagination text-center">
						<nav>
							<ul class="pagination">
								<c:if test="${current != 1 }">
									<c:choose>
										<c:when test="${keyword == null }">
											<li><a href="infoMain.do?page=${current-1 }"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="infoSearch.do?page=${current-1 }&keyword=${keyword}&category=${category}"
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
													<li><a href="infoMain.do?page=${page }">${page }</a></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="infoSearch.do?page=${page }&keyword=${keyword}&category=${category}">${page }</a></li>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${current != last }">
									<c:choose>
										<c:when test="${keyword == null }">
											<li><a href="infoMain.do?page=${current+1 }"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="infoSearch.do?page=${current+1 }&keyword=${keyword}&category=${category}"
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
			

			<!--                         </div>                        -->
			<!--                     </div>                     -->
		</div>
		<!--             </div> -->
	</div>
	

	<!-- 여기부터 안에 들어가면 안되는 이유찾기  end-->
</body>
</html>