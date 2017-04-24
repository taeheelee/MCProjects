<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
  <script type="text/javascript">
  	function reple(idx,repleIdx) {
		$('#repleForm'+idx).html("<form action='repleWrite.do'>"
								 +"<textarea style='width: 85%; height: 100px' name='content'></textarea>"
								 +"<input type='submit' value='답글작성'>"
								 +"<input type='hidden' name='boardIdx' value='${board.boardIdx }'>"
								 +"<input type='hidden' name='boardCode' value='${board.boardCode }'>"
								 +"<input type='hidden' name='nickname' value='닉네임'>"
								 +"<input type='hidden' name='pIdx' value='"+repleIdx+"'>"
								 +"</form>");
	}
  	
  	function update(idx,repleIdx){
  		$('#updateForm').text("");
  		var text = $('#repleContent'+idx).text();
  		$('#repleContent'+idx).html("<form action='repleUpdate.do'>"
				 +"<textarea style='width: 85%; height: 100px' name='content'>"+text+"</textarea>"
				 +"<input type='hidden' name='boardIdx' value='${board.boardIdx }'>"
				 +"<input type='hidden' name='boardCode' value='${board.boardCode }'>"
				 +"<input type='hidden' name='repleIdx' value='"+repleIdx+"'>"
				 +"<input type='submit' value='수정'>"
				 +"</form>")
  	}
  </script>
</head>
  <body>
   
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>뽐내기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- 여기부터 안에 들어가면 안되는 이유찾기 -->
    <div class="single-product-area">
<!--         <div class="zigzag-bottom"></div> -->
        <div class="container">
        	<div class="col-md-55">
        		<h2 class="sidebar-title">${board.title }</h2>
        		
        		<table class="shop_table cart">
	                <tbody>
	                	<tr class="cart_item">
	                		<td colspan="4"><img src="img/dog_10.jpg" alt=""></td>
	                	</tr>
	                	<tr class="cart_item">
	                		<td colspan="4"><span><a>좋아요 ♥ ${board.likeCount }개</a></span></td>
	                	</tr>
	                    <tr class="cart_item">
							<td style="background-color: #f5f5f5">애견이름</td>
							<td id="petname">${board.name }</td>
							<td style="background-color: #f5f5f5">품종</td>
							<td id="kind">${board.kind }</td>
						</tr>
	                    <tr class="cart_item">
							<td style="background-color: #f5f5f5">성별</td>
							<td id="petsex">${board.sex }</td>
							<td style="background-color: #f5f5f5">나이</td>
							<td id="age">${board.age }</td>
						</tr>
					</tbody>
		
				</table>
        		
<!--                	df -->
                <h4 style="color: gray; text-align: center;">${board.title }</h4>
                <hr style="border: solid 1px; border-color: lightgray">  
                <div id=boardcontents style="text-align: center">
                	${board.content }
                
                	
                </div>
<!--                 d -->

                <hr style="border: solid 1px; border-color: lightgray"> 
                <div style="text-align: center">
                
                
                <input type="button" value="뒤로가기"  onClick="location.href='boastMain.do';">
                <input type="button" value="수정" onclick="location.href='boastUpdateForm.do?boardIdx=${board.boardIdx}'">
                <input type="button" value="삭제" onclick="location.href='boastDelete.do?boardIdx=${board.boardIdx}'">
                </div>
                <div>
                	<h4>댓글</h4>
						<c:forEach items="${reple }" var="reple" varStatus="st">
							<table style="width: 100%" border="1">
								<tr>
								
								<td align="left" width="25%">
								<c:if test="${reple.groupLv > 0 }">
									<c:forEach begin="1" end="${reple.groupLv }">
										ㄴ
									</c:forEach>
								</c:if>
								<b>${reple.nickname }</b>
								</td>
								<td align="left" width="50%"><span id="repleContent${st.index }">${reple.content }</span><span id="updateForm"><a href="##" onclick="update(${st.index},${reple.repleIdx })">수정</a></span></td>
								<td align="right" width="10%">${reple.writedate }</td>
								<td width="10%"><a href="##" onclick="reple(${st.index},${reple.repleIdx })">답글달기</a></td>
								</tr>
								<tr><td colspan="4"><span id="repleForm${st.index }"></span></td></tr>
							</table>
						</c:forEach>
	                	<form action="repleWrite.do">
	                		<textarea style="width: 85%; height: 100px" name="content"></textarea>
	                		<input type="hidden" name="boardIdx" value="${board.boardIdx }">
	                		<input type="hidden" name="boardCode" value="${board.boardCode }">
	                		<input type="hidden" name="nickname" value="닉네임">
	                		<input type="hidden" name="pIdx" value="0">
							<input type="submit" value="댓글작성">
						</form>
                </div>
			</div>
		</div>
	</div>


   
<!-- 여기부터 안에 들어가면 안되는 이유찾기  end-->     
   
    <!-- Latest jQuery form server -->
<!--     <script src="https://code.jquery.com/jquery.min.js"></script> -->
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
  </body>
</html>