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
                        <h2>짝꿍찾기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>



	<div class="single-product-area">
		<div class="container">
			<h2 class="sidebar-title2">Would you marry me? 결혼해듀오</h2>
				<form action="/Wawa/partnerSearch.do" style="text-align: right;">
					<input type="radio" name="petsex" value="male"> 수컷
					<input type="radio" name="petsex" value="female"> 암컷
					<input type="text" name="petname" placeholder="Seach.."> 
					<input type="submit" value="검색">
					<c:if test="${sessionScope.name != null}">
					<input type="button" value="짝꿍찾기 등록" onclick="location.href='partnerWriteForm.do'">
					</c:if>
				</form>
		</div>

	<!-- 	<div class="container">                                 
			<h3 class="sidebar-title">목록</h3>
		</div>
		<div class="container">
				<div class="container" style="width :100% ;float: right;">
				<form action="/Wawa/partnerSearch.do">
					<input type="radio" name="petsex" value="male"> 수컷
					<input type="radio" name="petsex" value="female"> 암컷	
					<input type="text" name="petname" placeholder="Search..">
					<input type="submit" value="검색">
				</form>
				<input type="button" value="짝꿍찾기 등록" onclick="location.href='/Wawa/partnerWriteForm.do'">
				</div>
		</div> -->

		<div class="container" id="">


			<c:forEach items="${boardList }" var="partner">
				<div class="single-product col-md-2" style=" padding: 15px;">
					<div class="col-md-11" style="background: #f4f4f4; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
							<div class="product-f-image"><!-- 마우스오버시 검정색 효과 범위-->
								<img src="img/dog_14.jpg" alt="">
								<div class="product-hover">
									<a href="partnerDetails.do?boardIdx=${partner.boardIdx }" class="view-details-link"><i class="fa fa-link"></i>상세</a>
								</div>
							</div><!--  마우스오버시 검정색 효과 범위 끝 -->
						<table border="1" style="width: 100%; font-size: small;text-align:center; " >
							<tr><td colspan="2" id="petname">이름: ${partner.name }</td></tr>
							<tr><td id="petsex">${partner.sex }</td><td id="petage">${partner.age }</td></tr>
							<tr><td colspan="2">작성자:${partner.writer }</td></tr>
						</table>
		
					</div>
				</div>
			</c:forEach>
			
			
			<div class="row">
				<div class="col-md-12">
					<div class="product-pagination text-center">
						<nav>
							<ul class="pagination">
								<c:if test="${current != 1 }">
									<c:choose>
										<c:when test="${keyword == null }">
											<li><a href="partnerMain.do?page=${current-1 }" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="partnerSearch.do?page=${current-1 }&keyword=${keyword}&type=${type}" aria-label="Next"> <span
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
													<li><a href="partnerMain.do?page=${page }">${page }</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="partnerSearch.do?page=${page }&keyword=${keyword}&type=${type}">${page }</a></li>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${current != last }">
									<c:choose>
										<c:when test="${keyword == null }">
											<li><a href="partnerMain.do?page=${current+1 }" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="partnerSearch.do?page=${current+1 }&keyword=${keyword}&type=${type}" aria-label="Next"> <span
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
	</div>





  </body>
</html>