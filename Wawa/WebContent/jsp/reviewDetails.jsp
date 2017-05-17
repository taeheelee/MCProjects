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
                        <h2>제품리뷰</h2>
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
    			<div class=""style="width: 100%; margin-bottom: 10px">
                 <p>
                <font style="font-size: medium; font-weight: bold; color: gray">[${board.category }]</font>
                

                <font style="font-size: large; font-weight: bold; color: red">
                   		<c:if test="${board.starPoint == 5 }"><td>★★★★★</td></c:if>
	               		<c:if test="${board.starPoint == 4 }"><td>★★★★☆</td></c:if>
	                    <c:if test="${board.starPoint == 3 }"><td>★★★☆☆</td></c:if>
	                    <c:if test="${board.starPoint == 2 }"><td>★★☆☆☆</td></c:if>
	                    <c:if test="${board.starPoint == 1 }"><td>★☆☆☆☆</td></c:if>
                </font>
                </p>
				<h4 class="sidebar-title" style="text-align: center">${board.title }</h4>
                <h5 style="text-align: right; color: lightblack">작성자: ${board.writer }</h5> 
                   
                </div>
                <hr style="border: solid 1px; border-color: lightgray">  
                <p style="text-align: right; color: gray" >${board.writeDate }</p>
                <div id="boardcontents"> 
                	${board.content }
                </div>
                 <hr style="border: solid 1px; border-color: lightgray"> 
                 
               
                
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
									--><c:if test="${reple.isDelete == 'N' }">${reple.content }</c:if><!--  
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
	                	<form action="repleWrite.do">
	                		<c:if test="${sessionScope.id != null }">
		                		<textarea style="width: 85%; height: 100px; resize: none" name="content" ></textarea>
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
                <!-- 여기까지 댓글목록 -->
                
                <!-- 댓글쓰기 -->
                <input type="button" value="목록"  onClick="location.href='reviewMain.do'">
                <c:if test="${board.writer == sessionScope.name }">
                	<input type="button" value="수정" onclick="location.href='reviewUpdateForm.do?boardIdx=${board.boardIdx}'">
                	<input type="button" value="삭제" onclick="location.href='reviewDelete.do?boardIdx=${board.boardIdx}'">
                </c:if>
                <!-- 여기까지 댓글쓰기 -->
			</div>
			
		</div>
	</div>


   
<!-- 여기부터 안에 들어가면 안되는 이유찾기  end-->     

  </body>
</html>