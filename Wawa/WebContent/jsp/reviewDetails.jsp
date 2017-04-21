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
                   <span style="font-size: medium;font-weight: bold; color: gray">[${board.category }]</span>
                   <span style="font-size: medium;font-weight: bold;">
                   		<c:if test="${board.starPoint == 5 }"><td>★★★★★</td></c:if>
	               		<c:if test="${board.starPoint == 4 }"><td>★★★★☆</td></c:if>
	                    <c:if test="${board.starPoint == 3 }"><td>★★★☆☆</td></c:if>
	                    <c:if test="${board.starPoint == 2 }"><td>★★☆☆☆</td></c:if>
	                    <c:if test="${board.starPoint == 1 }"><td>★☆☆☆☆</td></c:if>
                  </span>
                </div>
                <h2 class="sidebar-title">${board.title }</h2>
                <hr style="border: solid 1px; border-color: lightgray">  
                <h5 style="text-align: right">${board.writer }</h5> 
                <div id=boardcontents style="text-align: center">
                	${board.content }
                </div>
                 <hr style="border: solid 1px; border-color: lightgray"> 
                 
                <div style="text-align: center;">
                <input type="button" value="뒤로가기" onClick="location.href='reviewMain.do'">
                <input type="button" value="수정" onclick="location.href='reviewUpdateForm.do?boardIdx=${board.boardIdx}'">
                <input type="button" value="삭제" onclick="location.href='reviewDelete.do?boardIdx=${board.boardIdx}'">
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

  </body>
</html>