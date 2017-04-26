<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						
						<c:forEach items="${best }" begin="0" end="2" var="best" varStatus="st">
							<div class="col-md-3 col-sm-6">
								<div class="single-product"><!-- 마우스오버 효과-->
									<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
										<img src="img/dog_10.jpg" alt="">
										<div class="product-hover">
											<a href="increaseLike.do?boardIdx=${best.boardIdx }" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
											<a href="boastDetails.do?boardIdx=${best.boardIdx }" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
										</div>
								</div><!--  마우스오버시 검정색 효과 범위 끝 -->
										<h1 style="text-align: center; color: #FF7F27;">BEST ${st.index+1}</h1>
										
										<div class="product-carousel-price">
											<p style="color: #ffc000; text-align: center; font-size: 18px; background-color: white;">${best.name }(${best.sex }) ${best.age }살</p>
											<p style="color: #777; text-align: center;">♥좋아요 ${best.likeCount }개</p>

										</div>
										<h4 align="center">주인 : ${best.writer }</h4>
									</div><!-- 마우스오버 효과 끝-->	
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
					<form action="/Wawa/boastSearch.do" style="text-align: right;">
						<input type="text" placeholder="Seach.."> 
						<input type="submit" value="검색">
						<c:if test="${sessionScope.name != null}">
						<input type="button" value="뽐내기 후보 등록" onclick="location.href='boastWriteForm.do'">
						</c:if>
					</form>
				
		</div>
		

		
			<div class="container">
				<c:forEach items="${boardList }" var="boast">
				<div class="single-product col-md-2" style=" padding: 10px;">
					<div class="col-md-11 boast-list-petname" style="background: #f4f4f4; padding : 15px;width: 100%; margin: 0 auto;">
							<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
								<img src="img/dog_01.jpg" alt="" style="margin-bottom: 15px">
								<div class="product-hover">
									<a href="increaseLike.do?boardIdx=${boast.boardIdx }" class="add-to-cart-link"><i class="fa fa-heart"></i> 좋아요</a> 
									<a href="boastDetails.do?boardIdx=${boast.boardIdx }" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
								</div>
							</div><!--  마우스오버시 검정색 효과 범위 끝 -->
						<table style="background : #ffc000 ;width: 100%; font-size: small;text-align:center; " >
							<tr><td id="petname" style="color: white; font-weight: bold; font-size: large;"><span>${boast.name }</span>(<span id="petsex">${boast.sex }</span>)<span id="petage">${boast.age }</span>살</td></tr>
							<tr><td id="like">♥좋아요 <span style="font-weight: bold">${boast.likeCount }</span>개</td></tr>
						</table>
						<div align="center">주인 : ${boast.writer }</div>
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
											<li><a href="boastMain.do?page=${current-1 }" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="boastSearch.do?page=${current-1 }&keyword=${keyword}&type=${type}" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
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
													<li><a href="boastSearch.do?page=${page }&keyword=${keyword}&type=${type}">${page }</a></li>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${current != last }">
									<c:choose>
										<c:when test="${keyword == null }">
											<li><a href="boastMain.do?page=${current+1 }" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="boastSearch.do?page=${current+1 }&keyword=${keyword}&type=${type}" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
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