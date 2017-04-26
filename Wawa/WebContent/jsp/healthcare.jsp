<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WAWA-healthcare</title>
<!-- D3 -->
<script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<style type="text/css">
svg{
   width: 300px;
   height: 500px;
   border: 1px solid black;
}
.line{
   fill: none;
   stroke: black;
}
.axis text{
   font-family: scans-serif;
   font-size: 11px;
}
.axis path,
.axis line {
   fill: none;
   stroke : black;
}
.axis_x line { 
   fill: none;
   stroke: black;
}
#d3g{
   fill: gray;
}

</style>
<script type="text/javascript">

$(document).ready(function(){
	
	
	var calculate = document.getElementById('calculate');

	var calculateCalories = document.getElementById('calculateCalories');
	
	
	calculate.onclick = function(){
		var activity = $("input[name=activity]:checked").val();
// 		alert(activity);
		calculateCalories.innerHTML = Number(activity) * ((5*30)+70);
	};
	
});
</script>
</head>
<body>
   <div class="product-big-title-area">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="product-bit-title text-left">
                  <h2>나의 펫 헬스케어</h2>
               </div>
            </div>
         </div>
      </div>
   </div>

   <div class="single-product-area">

      <div class="container">
         <div class="row">
            <div class="col-md-3">

               <form method="post" action="#">
                  <table cellspacing="0" class="shop_table cart">
                     <thead>
                        <tr>
                           <th colspan="2" id="mypetmainimage"><img
                              src="img/dog_04.jpg" alt=""></th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr class="cart_item">
                           <td colspan="2"><select
                              class="country_to_state country_select" id="billing_country"
                              name="billing_country">
                                 <option selected="selected" id="mypet01">와와(이름)</option>
                                 <option id="mypet02">애견이름2</option>
                                 <option id="mypet03">애견이름3</option>
                                 <option id="mypet04">애견이름4</option>
                                 <option id="mypet05">애견이름5</option>
                           </select></td>
                        </tr>
                        <tr class="cart_item">
                           <td colspan="2" id="kind">치와와(품종)</td>
                        </tr>
                        <tr class="cart_item">
                           <td id="petsex">남</td>
                           <td id="neutral">미중성</td>
                        </tr>
                        <tr class="cart_item">
                           <td colspan="2" id="petage">00년00개월</td>
                        </tr>
                        <tr class="cart_item">
                           <td colspan="2" id="weight">00kg</td>
                        </tr>
                        <tr class="cart_item">
                           <td colspan="2" id="caloriesbyday">하루필요열량 000kcal</td>
                        </tr>



                     </tbody>
                  </table>
               </form>


            </div>
            <!-- 여기여기여기부터 -->




            <div class="col-md-9">
               <div class="product-content-right">
                  <h2 class="sidebar-title">체중 관리</h2>
                  <p>이 홈페이지에서 안내하는 사항은 참고용입니다. 정확한 정보는 전문가와 상담하십시오.</p>
                  <div class="woocommerce">
                     <form method="post" action="#"></form>
                  </div>
               </div>
            </div>

<div class="col-md-9">
            <div class="col-md-6">
               <div class="product-content-right">
                  <div class="woocommerce">

                     <form method="post" action="#">
                        <table cellspacing="0" class="shop_table cart">
                           <thead>
                              <tr>
                                 <th>날짜</th>
                                 <th colspan="2">몸무게</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr class="cart_item">

                                 <td><input type="text" placeholder="0000-00-00" value="" style="width: 100px"></td>

                                 <td><input type="text" placeholder="kg" value="" style="width: 80px">
                                    kg</td>
                                 <td><input type="submit" value="수정" 
                                    class="button" style="padding: 5px 5px"> 
                                    <input
                                    type="submit" value="삭제"  class="button"
                                    style="padding: 5px 5px"></td>
                              </tr>
                              <tr>
                                 <td><input type="text" placeholder="0000-00-00" value=""
                                      style="width: 100px"></td>

                                 <td><input type="text" placeholder="kg" value=""
                                      style="width: 80px">
                                    kg</td>
                                 <td><input type="submit" value="등록" 
                                    class="button" style="padding: 5px 5px"></td>
                              </tr>
                              <tr>
                                 <td><input type="text" placeholder="0000-00-00" value=""
                                      style="width: 100px"></td>

                                 <td><input type="text" placeholder="kg" value=""
                                     style="width: 80px" >
                                    kg</td>
                                 <td>등록</td>
                              </tr>
                              <tr>
                                 <td><input type="text" placeholder="0000-00-00" value=""
                                      style="width: 100px"></td>

                                 <td><input type="text" placeholder="kg" value=""
                                     style="width: 80px" >
                                    kg</td>
                                 <td>등록</td>
                              </tr>
                              <tr>
                                 <td><input type="text" placeholder="0000-00-00" value=""
                                      style="width: 100px"></td>

                                 <td><input type="text" placeholder="kg" value=""
                                      style="width: 80px">
                                    kg</td>
                                 <td>등록</td>
                              </tr>


                           </tbody>
                        </table>
                     </form>

                  </div>
               </div>
            </div>



            <div class="col-md-6">
               <!-- 그래프 구역 -->
               <svg id="d3g" style="width: 100%;"></svg>
            </div>
</div>

            <div class="col-md-9">
               <div class="product-content-right">
                  <h2 class="sidebar-title">
                     하루 필요열량(kcal) = <span id="calculateCalories" style="color: gray">
                        000</span>kcal
                  </h2>
                  <form name="calculate">
                  <input type="radio" name="activity" id="activity" value="1.0">비만
                  <input type="radio" name="activity" id="activity" value="1.4">비만경향
                  <input type="radio" name="activity" id="activity" value="1.8" checked="checked">운동량 없음 
                  <input type="radio" name="activity" id="activity" value="2.0">가벼운 운동 
                  <input type="radio" name="activity" id="activity" value="3.0">적당한 운동 
                  <input type="radio" name="activity" id="activity" value="4.0">심한 운동 
                  <input type="button" value="Calculate" id="calculate" onclick=""> <br>
                  </form>
                  <p></p>
                  <p>보통 사료 패키지에는 체중에 따른 1일 권장 급여량과 100g당 칼로리가 표시되어있지만 대략적인수치이며,
                     같은 성분이라고 하더라도 애견의 활동량과 체질 등에 따라 급여 칼로리가 달라질 수 있다.</p>
                  <p>하루 필요열량을 급여 할 때, 간식칼로리도 함께 생각해야합니다. 1일 총칼로리 = 밥2끼 + 간식</p>
                  
                  <div class="woocommerce">
                     <form method="post" action="#"></form>
                  </div>
               </div>
            </div>

         </div>
      </div>
   </div>
   <!-- 내용 -->

   <script type="text/javascript" src="js/healthD3.js"></script>

</body>
</html>\