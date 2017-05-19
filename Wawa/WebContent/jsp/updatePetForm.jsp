<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>eElectronics - HTML eCommerce Template</title>
   
   <script
   src="https://code.jquery.com/jquery-2.2.4.min.js"
   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
   crossorigin="anonymous"></script>
   
   <script type="text/javascript">
      $(document).ready(function(){
         
         var regDate = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
         var regName = /^[가-힣a-zA-Z]+$/;
         
         $('#name').blur(function(){
            if(!regName.test($('#name').val()) || $('#name').val().length > 15){
               $('#nameError').html('<font color="red">이름입력 오류 (15자 미만의 한글, 영문만 가능)</font>');
            }
         });
         


$('#weight').blur(function(){
   if(!regWeight.test($('#weight').val())){
      $('#weightError').html('<font color="red">몸무게입력 오류(ex) 4.3');
   }
});



});
</script>


<!-- jQuery Datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   function getResult(){
      
      var param = $("#datePicker").val();
      
      if(param == ""){
         alert("날짜를 선택해 주세요.");
         return;
      }

   }
   /* 달력 설정 */
   $.datepicker.setDefaults({
      dateFormat: 'yy-mm-dd',
      prevText: '이전 달',
      nextText: '다음 달',
      monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
      monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      showMonthAfterYear: true,
      showButtonPanel: true,
      changeMonth: true,
      changeYear: true,
      autoSize: true,

});
   $( function() {
      $( ".datepicker" ).datepicker();
   } );
</script>

</head>
<body>
   
   <div class="product-big-title-area">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="product-bit-title text-left">
                  <h2>나의 펫 정보</h2>
               </div>
            </div>
         </div>
      </div>
   </div>



   <div class="single-product-area">
      
      <div class="container">
         <div class="row">
            
            <div class="col-md-55">
               
               <div class="product-content-right">
                  <div class="woocommerce" >
                     
                     
                     <div id="customer_details" class="col2-set" >
                        <div class="col-3">
                           <h2 class="sidebar-title">펫 정보 수정하기</h2>
                           <div class="woocommerce-billing-fields">
                              


                              <form action="updatePet.do" enctype="multipart/form-data" method="post">
                                 <input type="hidden" value="${idx}" name="idx">
									<input type="hidden" value="${sessionScope.id}" name="id">
								<input type="hidden" value="${mainPet}" name="mainPet">
                                 
                                 <label class="" for="billing_first_name">애견 프로필 사진 등록<abbr title="required" class="required">*</abbr></label>
                                 <table border="0">
                                    <tr>
                                       <td width="10%">
                                          <div class="file_input_div">
                                             <input type="button" value="파일 선택" class="file_input_button"/>
                                             <input type="file" name="ufile" class="file_input_hidden" onchange="javascript:document.getElementById('fileName').value = this.value" />
                                          </div>
                                       </td>
                                       <td width="90%">
                                          <input type="text" id="fileName"name="tempFileName" class="file_input_textbox" readonly="readonly" style="border: 0px;" value="${originFileName}">
                                       </td>
                                    </tr>
                                 </table>
                                 
                                 
                                 <label class="" for="billing_state">등록번호(15자리)</label>
                                 <input type="text" id="resist" name="resist" placeholder="등록번호가 있을시에 입력하세요" value="${resist}" class="input-text ">
                                
                                 
                                 <br><br>
                                 
                                 <label class="" for="billing_first_name">애견 이름 <abbr title="필수입력사항" class="required">*</abbr>
                                 </label>
                                 <input type="text" value="${name}" placeholder="15자 미만의 영문이나 한글로 입력하세요" id="name" name="name" class="input-text ">
                                 <span id="nameError"></span>
                                 
                                 <br><br>

                                 <label class="" for="billing_country">품종 <abbr title="required" class="required">*</abbr>
                                 </label>
                                 <select class="country_to_state country_select" id="kind" name="kind">
                                    <c:forEach var="kindList" items="${kindList }" varStatus="idx">
                                       <c:choose>
                                          <c:when test="${kindList.kind == kind }">
                                             <option selected="selected" value="${kindList.kind }">${kindList.kind }</option>
                                          </c:when>
                                          <c:otherwise>
                                             <option value="${kindList.kind }">${kindList.kind }</option>
                                          </c:otherwise>
                                       </c:choose>
                                    </c:forEach>

                                                </select>
                                                
                                                <br><br>
                                                
                                                
                                                <label class="" for="billing_first_name">성별 <abbr title="required" class="required">*</abbr></label>
                                                <div id="payment">
                                                   <ul class="payment_methods methods">
                                                      <li class="payment_method_paypal">
                                                         <c:choose>
                                                            <c:when test="${sex == 'male'}">
                                                               <input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio" id="sex" checked="checked"> 수컷
                                                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                               <input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio" id="sex"> 암컷
                                                            </c:when>
                                                            <c:otherwise>
                                                               <input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio" id="sex"> 수컷
                                                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                               <input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio" id="sex" checked="checked"> 암컷
                                                            </c:otherwise>
                                                         </c:choose>
                                                      
                                                         
                                                      </li>
                                                   </ul>
                                                </div>
                                                
                                                <br>
                                                
                                                
                                                <label class="" for="billing_state">중성화 여부</label>
                                                <div id="payment">
                                                   <ul class="payment_methods methods">
                                                      <li class="payment_method_paypal">
                                                      
                                                         <c:choose>
                                                            <c:when test="${neutral == 'N'}">
                                                                <input type="radio" data-order_button_text="Proceed to PayPal" value="N" name="neutral" class="input-radio" id="neutral" checked="checked"> 미중성
                                                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                               <input type="radio" data-order_button_text="Proceed to PayPal" value="Y" name="neutral" class="input-radio" id="neutral"> 중성화
                                                            </c:when>
                                                            <c:otherwise>
                                                               <input type="radio" data-order_button_text="Proceed to PayPal" value="N" name="neutral" class="input-radio" id="neutral"> 미중성
                                                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                               <input type="radio" data-order_button_text="Proceed to PayPal" value="Y" name="neutral" class="input-radio" id="neutral" checked="checked"> 중성화
                                                            
                                                            </c:otherwise>
                                                         </c:choose>
                                                      
                                                      
                                                      </li>
                                                   </ul>
                                                </div>
                                                
                                                <br>
                                                
                                                <label class="" for="billing_first_name">생일<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" id="birth"  class="datepicker" name="birthday" value="${birthday }">
                                                <span id="birthError"></span>
                                                
                                                <br><br>
                                                
                                                
                                                <label class="" for="billing_state">몸무게(kg)<abbr title="required" class="required">*</abbr></label>
                                                <span style="color: orange">*몸무게 데이터를 변경 하시려면, <span style="font-weight: bold;">[나의펫] - [나의 펫 헬스케어] - [체중관리]</span>에서 수정해주세요</span>
                                                <input type="text" id="weight" name="weight" placeholder="숫자만 입력하세요" readonly="readonly" value="${weight }" class="input-text ">
                                                <span id="weightError"></span>
                                                
                                                <br><br>
                                                
                                                <label class="" for="billing_state">미용 알림 시작일</label>
                                                <input type="text" id="gs" name="groomingStart" class="datepicker" value="${groomingStart }" placeholder="ex) 2017/04/01">
                                                <span id="gsError"></span>
                                                
                                                <br><br>
                                                

                                                <label class="" for="billing_country">미용 알림 주기</label>
                                                
                                                <select class="country_to_state country_select" id="groomingPeriod" name="groomingPeriod">
                                                   <c:choose>
                                                     <c:when test="${groomingPeriod == 0}">
                                                          <option selected="selected" value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                    <c:when test="${groomingPeriod == 30}">
                                                          <option value="0">미설정</option>
                                                         <option selected="selected" value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                       <c:when test="${groomingPeriod == 60}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option selected="selected" value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                    <c:when test="${groomingPeriod == 90}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option selected="selected" value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                       <c:when test="${groomingPeriod == 120}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option selected="selected" value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                    <c:when test="${groomingPeriod == 150}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option selected="selected" value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                       <c:when test="${groomingPeriod == 180}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option selected="selected" value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                    <c:when test="${groomingPeriod == 210}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option selected="selected" value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                       <c:when test="${groomingPeriod == 240}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option selected="selected" value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                    <c:when test="${groomingPeriod == 270}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option selected="selected" value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                       <c:when test="${groomingPeriod == 300}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option selected="selected" value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                    <c:when test="${groomingPeriod == 330}">
                                                          <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option selected="selected" value="330">11개월 주기</option>
                                                         <option value="365">1년 주기</option>
                                                       </c:when>
                                                      <c:otherwise>
                                                           <option value="0">미설정</option>
                                                         <option value="30">1개월 주기</option>
                                                         <option value="60">2개월 주기</option>
                                                         <option value="90">3개월 주기</option>
                                                         <option value="120">4개월 주기</option>
                                                         <option value="150">5개월 주기</option>
                                                         <option value="180">6개월 주기</option>
                                                         <option value="210">7개월 주기</option>
                                                         <option value="240">8개월 주기</option>
                                                         <option value="270">9개월 주기</option>   
                                                         <option value="300">10개월 주기</option>
                                                         <option value="330">11개월 주기</option>
                                                         <option selected="selected" value="365">1년 주기</option>
                                                      </c:otherwise>
                                                   </c:choose>
                                                   
                                                
                                                </select>
                                                
                                                
                                                
                                                <div>
                                                   <!--<div class="create-account"> -->
                                                   <p>*미용주기를 설정하면 애완동물의 미용시기를 D-day로 알려드립니다.</p>
                                                   <p>*알림을 원하지 않으시면 '미설정'으로 선택해주세요.</p>
                                                </div>
                                                
                                                <br>

                                                <div class="form-row place-order" style="float: right">
                                                   <input type="submit" data-value="Place order" value="UPDATE PET" id="place_order"  class="button alt">
                                                </div>
                                            </form>
                                            
                                            
                                        </div>
                                    </div>


                                </div>

                                
                            </div>
                            
                        </div>                       
                    </div>                    
                </div>
            </div>
        </div>
    </div>

</body>
</html>