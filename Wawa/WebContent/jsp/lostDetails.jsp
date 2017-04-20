<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<!-- 여기부터 안에 들어가면 안되는 이유찾기 -->
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
        	<div class="col-md-55">
        		<h2 class="sidebar-title">찾고있어요 or 보호중입니다</h2>
        		
        		<table class="shop_table cart">
	                <tbody>
	                	<tr class="cart_item">
	                		<td rowspan="5" style="width: 30%"><img src="img/dog_10.jpg" alt=""></td>
	                        <td style="background-color: #f5f5f5">애견이름</td>
							<td id="petname">이름</td>
							<td style="background-color: #f5f5f5">등록번호</td>
							<td id="등록번호">000001234512345</td>
	                    </tr>
	                    <tr class="cart_item">
							<td id="lostOrFind" style="background-color: #f5f5f5">잃어버린날짜</td>
							<td id="loastdate">0000-00-00</td>
							<td style="background-color: #f5f5f5">품종/성별</td>
							<td id="kindandsex"><span id="kind">품종</span><span id="petsex">(남)</span></td>
						</tr>
						<tr class="cart_item">
							<td style="background-color: #f5f5f5">주인 연락처</td>
							<td id="phonenumber">000-0000-0000</td>
							<td style="background-color: #f5f5f5">애견 나이</td>
							<td id="petage">0년 00개월</td>
						</tr>
						<tr class="cart_item">
							<td style="background-color: #f5f5f5">e-mail</td>
							<td id="email">e_mail@mail.com</td>
							<td style="background-color: #f5f5f5">애견 몸무게</td>
							<td id="weight">0.0kg</td>
						</tr>
					</tbody>
				</table>
        		
               	
                <h4 style="color: gray; text-align: center;">[제목] 애타게 찾고있습니다 [제목]</h4>
                <hr style="border: solid 1px; border-color: lightgray">  
                <div id=boardcontents style="text-align: center">
                	갓 미용을 한 상태여서 털이 짧은 편이고,<br>
                	까만 코 안에 흰점이 한개있습니다.<br>
                	잃어버릴 당시 전화번호가 쓰여있는 목걸이를 착용중이였습니다.<br>
                	<br>
                	사람을 잘 따르는 편입니다.<br>
                	이름을 알아듣습니다<br>
                	
                </div>
                <hr style="border: solid 1px; border-color: lightgray"> 
                <div style="text-align: center">
                <input type="button" value="뒤로가기" onClick="location.href='/Wawa/lostMain.do'">
                <input type="button" value="수정" onclick="location.href='/Wawa/lostUpdateForm.do'">
                <input type="button" value="삭제" onclick="location.href='/Wawa/lostDelete.do'">
                </div>
			</div>
		</div>
	</div>


   
<!-- 여기부터 안에 들어가면 안되는 이유찾기  end-->     


  </body>
</html>