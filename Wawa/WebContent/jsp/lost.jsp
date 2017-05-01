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
					<c:if test="${sessionScope.name != null}">
					<input type="button" value="유기견 등록" onclick="location.href='/Wawa/lostWriteForm.do'">
					</c:if>
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


			<c:forEach items="${boardList }" var="lost">
				<div class="single-product col-md-4" style=" padding: 15px;">
					<div class="col-md-11" style="background: #E6E6E6; padding : 15px 15px 5px 15px;width: 100%; margin: 0 auto;">
						<h4>${lost.category }</h4>
						<hr style="border-color: black; border: solid 1px;margin: 0 0 5px 0">
						<div align="right">${lost.writer }</div>
						<div class="col-md-6" id="wanted_photo" style="padding : 0 ;background: blue; width: 160px; height: 150px" >
						
							<div class="product-f-image" style="width: 160px; height: 150px" ><!-- 마우스오버시 검정색 효과 범위-->
								<img src="imageShow/${lost.fileId}.do" onerror="this.src='img/no_image.jpg'" alt="" >
								<div class="product-hover">
									<a href="lostDetails.do?boardIdx=${lost.boardIdx }" class="view-details-link"><i class="fa fa-link"></i>상세보기</a>
								</div>
							</div><!--  마우스오버시 검정색 효과 범위 끝 -->
						</div>
						<div class="col-md-6" id="wanted_content" style="padding: 0 0 0 15px;" >
						<table border="1" style="width: 100%; font-size: small;	" >
							<tr><td>이름</td><td id="petname">${lost.name }</td></tr>
							<tr><td>품종</td><td id="petkind">${lost.kind }</td></tr>
							<tr><td id="petsex">${lost.sex }</td><td id="petage">${lost.age }</td></tr>
							<tr><td colspan="2">잃어버린/발견된 장소</td></tr>
							<tr><td colspan="2" id="place">${lost.lostPlace }</td></tr>
							<tr><td colspan="2">잃어버린/발견된 날짜</td></tr>
							<tr><td colspan="2" id="lostdate">${lost.lostDate }</td></tr>
						</table>
						</div>
						<hr style="border-color: black; border: solid 1px;margin: 5px 0">
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
											<li><a href="lostMain.do?page=${current-1 }" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="lostSearch.do?page=${current-1 }&keyword=${keyword}&type=${type}" aria-label="Next"> <span
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
													<li><a href="lostMain.do?page=${page }">${page }</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="lostSearch.do?page=${page }&keyword=${keyword}&type=${type}">${page }</a></li>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${current != last }">
									<c:choose>
										<c:when test="${keyword == null }">
											<li><a href="lostMain.do?page=${current+1 }" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="lostSearch.do?page=${current+1 }&keyword=${keyword}&type=${type}" aria-label="Next"> <span
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