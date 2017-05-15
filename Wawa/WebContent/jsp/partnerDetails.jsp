<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
  		var repleCount = ${fn:length(reple)};
  		for(var i=0; i<repleCount; i++){
  			$('#repleForm'+i).empty();
  			$('#repleContent'+i).html($('#repleContent'+i).text());
  			$('#updateForm'+i).show();
  		}
		$('#repleForm'+idx).html("<form action='repleWrite.do'>"
								 +"<textarea style='width: 85%; height: 100px; resize: none' name='content'></textarea>"
								 +"<input type='submit' value='답글작성'>"
								 +"<input type='hidden' name='boardIdx' value='${board.boardIdx }'>"
								 +"<input type='hidden' name='boardCode' value='${board.boardCode }'>"
								 +"<input type='hidden' name='nickname' value='${sessionScope.name }'>"
								 +"<input type='hidden' name='pIdx' value='"+repleIdx+"'>"
								 +"</form>");
	}
  	
  	function update(idx,repleIdx){
  		var text = $('#repleContent'+idx).text();
  		var repleCount = ${fn:length(reple)};
  		for(var i=0; i<repleCount; i++){
  			$('#repleForm'+i).empty();
  			$('#repleContent'+i).html($('#repleContent'+i).text());
  			$('#updateForm'+i).show();
  		}
  		$('#updateForm'+idx).hide();
  		$('#repleContent'+idx).html("<form action='repleUpdate.do'>"
				 +"<textarea style='width: 85%; height: 100px; resize: none' name='content'>"+text+"</textarea>"
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
                        <h2>짝꿍찾기</h2>
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
	                		<td rowspan="5" style="width: 30%"><img src="imageShow/${board.fileId}.do" onerror="this.src='img/no_image.jpg'" alt=""></td>
	                        <td style="background-color: #f5f5f5">애견이름</td>
							<td id="petname">${board.name }</td>
							<td style="background-color: #f5f5f5">품종/성별</td>
							<td id="kindandsex"><span id="kind">${board.kind }</span><span id="petsex">(${board.sex })</span></td>
	                    </tr>
						<tr class="cart_item">
							<td style="background-color: #f5f5f5">애견 몸무게</td>
							<td id="weight">${board.weight }kg</td>
							<td style="background-color: #f5f5f5">애견 나이</td>
							<td id="petage">${board.age }</td>
						</tr>
						<tr class="cart_item">
							<td style="background-color: #f5f5f5">주인 연락처</td>
							<td id="phonenumber">${board.phone }</td>
							<td style="background-color: #f5f5f5">e-mail</td>
							<td id="email">${board.email }</td>
						</tr>
					</tbody>
				</table>
        		
               	
                <h4 style="color: gray; text-align: center;">${board.title }</h4>
                <hr style="border: solid 1px; border-color: lightgray">
                <h5 align="right">${board.writer }</h5> 
                <div id=boardcontents style="text-align: center">
                	${board.content }
                </div>
                <hr style="border: solid 1px; border-color: lightgray"> 
                <div style="text-align: center">
                <input type="button" value="뒤로가기" onClick="location.href='partnerMain.do'">
                <c:if test="${board.writer == sessionScope.name }">
	                <input type="button" value="수정" onclick="location.href='partnerUpdateForm.do?boardIdx=${board.boardIdx}'">
	                <input type="button" value="삭제" onclick="location.href='partnerDelete.do?boardIdx=${board.boardIdx}'">
                </c:if>
                </div>
                <div>
                	<h4>댓글</h4>
						<c:forEach items="${reple }" var="reple" varStatus="st">
							<table style="width: 100%" border="1">
								<tr>
								
								<td align="left" width="25%">
								<c:if test="${reple.groupLv > 0 }">
									<c:forEach begin="1" end="${reple.groupLv }">
										&nbsp;&nbsp;&nbsp;
									</c:forEach>
										ㄴ
								</c:if>
								<b>${reple.nickname }</b>
								</td>
								<td align="left" width="50%">
									<span id="repleContent${st.index }"><!--  
									--><c:if test="${reple.isDelete == 'N' }">${reple.content }</c:if><!--  
									--><c:if test="${reple.isDelete == 'Y' }"><font color="gray">삭제된 댓글입니다</font></c:if><!--  
								--></span>
										<c:if test="${sessionScope.name == reple.nickname && reple.isDelete == 'N'}">
										<span id="updateForm${st.index }">
										<a href="##" onclick="update(${st.index},${reple.repleIdx })">수정</a>
										<a href="repleDelete.do?boardIdx=${board.boardIdx}
										&boardCode=${board.boardCode}&repleIdx=${reple.repleIdx}" >삭제</a>
										</span>
									</c:if>
								</td>
								<td align="right" width="10%">${reple.writedate }</td>
								<td width="10%">
									<c:if test="${sessionScope.id != null && reple.isDelete == 'N'}">
										<a href="##" onclick="reple(${st.index},${reple.repleIdx })">답글달기</a>
									</c:if>
								</td>
								</tr>
								<tr><td colspan="4"><span id="repleForm${st.index }"></span></td></tr>
							</table>
						</c:forEach>
	                	<form action="repleWrite.do">
	                		<c:if test="${sessionScope.id != null }">
		                		<textarea style="width: 85%; height: 100px; resize: none" name="content"></textarea>
		                		<input type="hidden" name="boardIdx" value="${board.boardIdx }">
		                		<input type="hidden" name="boardCode" value="${board.boardCode }">
		                		<input type="hidden" name="nickname" value="${sessionScope.name }">
		                		<input type="hidden" name="pIdx" value="0">
								<input type="submit" value="댓글작성">
							</c:if>
							<c:if test="${sessionScope.id == null }">
								<textarea style="width: 85%; height: 100px" name="content" readonly="readonly">로그인 후 이용해주세요</textarea>
							</c:if>
						</form>
                </div>
			</div>
		</div>
	</div>


   
<!-- 여기부터 안에 들어가면 안되는 이유찾기  end-->     



  </body>
</html>