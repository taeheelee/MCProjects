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
  <script type="text/javascript" src="js/boardCheck.js"></script>
  <script type="text/javascript">
  	function reple(idx,repleIdx) {
  		var repleCount = ${fn:length(reple)};
  		for(var i=0; i<repleCount; i++){
  			$('#repleForm'+i).empty();
  			$('#repleContent'+i).html($('#repleContent'+i).text().replace(/</gi, "&lt;").replace(/>/gi, "&gt;"));
  			$('#updateForm'+i).show();
  		}
		$('#repleForm'+idx).html("<form action='repleWrite.do' method='post'>"
								 +"<textarea style='width: 85%; height: 100px; resize: none' id='repleContent' name='content' maxlength='500'></textarea>"
								 +"<input type='submit' value='답글작성' onclick='doRemoveTag();'>"
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
  			$('#repleContent'+i).html($('#repleContent'+i).text().replace(/</gi, "&lt;").replace(/>/gi, "&gt;"));
  			$('#updateForm'+i).show();
  		}
  		$('#updateForm'+idx).hide();
  		$('#repleContent'+idx).html("<form action='repleUpdate.do' method='post'>"
				 +"<textarea style='width: 85%; height: 100px; resize: none' id='repleContent' name='content' maxlength='500'>"+text+"</textarea>"
				 +"<input type='hidden' name='boardIdx' value='${board.boardIdx }'>"
				 +"<input type='hidden' name='boardCode' value='${board.boardCode }'>"
				 +"<input type='hidden' name='repleIdx' value='"+repleIdx+"'>"
				 +"<input type='submit' value='수정' onclick='doRemoveTag();'>"
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
                        <h2>유기견 찾기</h2>
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
        		<p>
	        		<font style="font-size: medium; font-weight: bold; color: gray">[${board.category }]</font>
	        	</p>
	        	<h2 class="sidebar-title" style="text-align: center;">${board.title.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }</h2>
        		<h5 align="right">작성자: ${board.writer.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }</h5> 
        		
        		<table class="shop_table cart">
	                <tbody>
	                	<tr class="cart_item">
	                		<td rowspan="4" style="width: 30%"><img src="imageShow/${board.fileId}.do" onerror="this.src='img/no_image.jpg'" alt=""></td>
	                        <td style="background-color: #f5f5f5">애견이름</td>
							<td id="petname">${board.name.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }</td>
							<td style="background-color: #f5f5f5">등록번호</td>
							<td id="등록번호">${board.resist.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }</td>
	                    </tr>
	                    <tr class="cart_item">
							<td id="lostOrFind" style="background-color: #f5f5f5">잃어버린날짜</td>
							<td id="loastdate">${board.lostDate }</td>
							<td style="background-color: #f5f5f5">품종/성별</td>
							<td id="kindandsex"><span id="kind">${board.kind }</span><span id="petsex">(${board.sex })</span></td>
						</tr>
						<tr class="cart_item">
							<td style="background-color: #f5f5f5">주인 연락처</td>
							<td id="phonenumber">${board.phone }</td>
							<td style="background-color: #f5f5f5">애견 나이</td>
							<td id="petage">${board.age }</td>
						</tr>
						<tr class="cart_item">
							<td style="background-color: #f5f5f5">e-mail</td>
							<td id="email">${board.email.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }</td>
							<td style="background-color: #f5f5f5">애견 몸무게</td>
							<td id="weight">${board.weight }kg</td>
						</tr>
						<tr>
						<td colspan="5" style="background-color: #f5f5f5">내용</td>
						</tr>
						<tr>
							<td colspan="5">${board.content }</td>
						</tr>
					</tbody>
				</table>

                
                <!-- 댓글 -->
                <h4>댓글 ${fn:length(reple)}개</h4>
                <div style="background-color: lightgray">
						<c:forEach items="${reple }" var="reple" varStatus="st">
							<table style="width: 100%">
								<tr>
								
								<td align="left" width="75%">
								<c:if test="${reple.groupLv > 0 }">
									<c:forEach begin="1" end="${reple.groupLv }">
										&nbsp;&nbsp;&nbsp;
									</c:forEach>
										<font color="red">ㄴ</font>
									
								</c:if>
								
								<b>${reple.nickname }</b>
								<c:if test="${sessionScope.name == reple.nickname && reple.isDelete == 'N'}">
									<span id="updateForm${st.index }">
									<a href="##" onclick="update(${st.index},${reple.repleIdx })" style="color: orange">수정</a>
									<a href="repleDelete.do?boardIdx=${board.boardIdx}
									&boardCode=${board.boardCode}&repleIdx=${reple.repleIdx}" style="color: orange">삭제</a>
									</span>
									</c:if>
									<c:if test="${sessionScope.id != null && reple.isDelete == 'N'}">
										<a href="##" onclick="reple(${st.index},${reple.repleIdx })" style="color: orange">답글</a>
									</c:if>
									
								
								</td>
								<td align="right" width="10%">${reple.writedate }</td>
								</tr>
								<tr style="border-bottom: dotted 1px; border-color: gray">
								<td>
								<c:forEach begin="1" end="${reple.groupLv }">
										&nbsp;&nbsp;&nbsp;
								</c:forEach>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span id="repleContent${st.index }"><!--  
									--><c:if test="${reple.isDelete == 'N' }">${reple.content.replaceAll("<", "&lt;").replaceAll(">", "&gt;") }</c:if><!--  
									--><c:if test="${reple.isDelete == 'Y' }"><font color="gray">삭제된 댓글입니다</font></c:if><!--  
								--></span>
									
								</td>
								</tr>
								<tr>
								<td colspan="4"><span id="repleForm${st.index }"></span></td>
								</tr>
							</table>
						</c:forEach>
					</div>
					<br>
					<div>
	                	<form action="repleWrite.do" method="post">
	                		<c:if test="${sessionScope.id != null }">
		                		<textarea style="width: 85%; height: 100px; resize: none" id="repleContent" name="content" maxlength="500"></textarea>
		                		<input type="hidden" name="boardIdx" value="${board.boardIdx }">
		                		<input type="hidden" name="boardCode" value="${board.boardCode }">
		                		<input type="hidden" name="nickname" value="${sessionScope.name }">
		                		<input type="hidden" name="pIdx" value="0">
								<input type="submit" value="댓글작성" onclick="doRemoveTag();">
							</c:if>
							<c:if test="${sessionScope.id == null }">
								<textarea style="width: 85%; height: 100px" name="content" readonly="readonly">로그인 후 이용해주세요</textarea>
							</c:if>
						</form>
                </div>
                <!-- 여기까지 댓글목록 -->
                
                <!-- 댓글쓰기 -->
                <input type="button" value="목록"  onClick="location.href='lostMain.do'">
                <c:if test="${board.writer == sessionScope.name }">
                	<input type="button" value="수정" onclick="location.href='lostUpdateForm.do?boardIdx=${board.boardIdx}'">
                	<input type="button" value="삭제" onclick="location.href='lostDelete.do?boardIdx=${board.boardIdx}'">
                </c:if>
                <!-- 여기까지 댓글쓰기 -->
                
			</div>
		</div>
	</div>


   
<!-- 여기부터 안에 들어가면 안되는 이유찾기  end-->     


  </body>
</html>