<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./fullcalendar-3.3.1/fullcalendar.css" rel="stylesheet"/>
<link href="./fullcalendar-3.3.1/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="./fullcalendar-3.3.1/lib/moment.min.js"></script>
<!-- <script type="text/javascript" src="./fullcalendar-3.3.1/lib/jquery.min.js"></script> -->
<script type="text/javascript" src="./fullcalendar-3.3.1/fullcalendar.js"></script>
<script type="text/javascript" src="./fullcalendar-3.3.1/locale/ko.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if('${isDel}' != '')
		alert('${isDel}');
	$('.mainPetMk').click(function(){
		alert('메인펫으로 지정합니다.');
	});
	
	function getPetAge(petBirth, petIdx){
		$.ajax({
			type: 'get',
			url: 'getAge.do',
			data: "birthday="+petBirth+"&petIdx="+petIdx,
			dataType: "json",
			success: function(data) {
				$('#ageSpan' + petIdx).text(data.year + "년" + data.month + "개월");
				$('#transperAgeSpan' + petIdx).text(data.transperAge + "살");
				$('#caloriesSpan' + petIdx).text(data.calories + "kcal");
				$('#adultWeightSpan' + petIdx).text(data.adultWeight + "kg");
				$('#exerciseMsgSpan' + petIdx).text(data.exerciseMsg);
				$('#warningMsgSpan' + petIdx).text(data.warningMsg);
				$('#groomingDdaySpan' + petIdx).text(data.d_day);
			},
			error: function(data){
				alert("잠시 후 다시 시도해주세요.");
			}
		});
		}	
	
	
	
	$("#calendar").fullCalendar({
        defaultDate : new Date()
      , editable : true
      , eventLimit : true
      , lang: 'ko'
      ,         
/*            events: [
      	{
				title: 'Birthday',
				start: '2017-04-01'
			}
      ]  */
      events: function(start, end, timezone, callback) {
          $.ajax({
             type : 'post',
             url : 'calendar.do',
             dataType : 'json',
             data : 'id=${sessionScope.id}',
             success : function(petList) {

                var events = [];
                for (var i = 0; i < 2; i++) {
                     events.push({
                         title : petList[i].name+'의 생일',
                         start : petList[i].birthday,
                         textColor : "white",
                         color : "#FF7421"
                         
                      });
                   
                }
                callback(events);
                
             },
             error : function() {
          	   alert('error');
             }
          });
   
       }//event end 
  });  //calendar end
	  
		var idx = $('#defaultBirth').attr('name');
		var birth = $('#defaultBirth').val();
		getPetAge(birth, idx);
		
	  $('li').click(function(){
	  	getPetAge($(this).attr('id'), $(this).attr('name'));
		});
	  $('.petDel').click(function() {
			var petName = prompt('펫 정보를 삭제 하시나요?', '삭제하시려면 펫이름을 입력해주세요');
			
			var petIdx = $(this).attr('id');
	
			location.href='deletePet.do?id=${sessionScope.id}&idx=' + petIdx + '&petname=' + petName;
		});
		
});
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

			<div class="form-row place-order" style="float: right">
				<input type="button" value="펫 추가하기" onclick = "location.href ='addPetForm.do?id=${sessionScope.id}'">
			</div>                                          
			<ul id="tabs">
				<c:forEach var="pet" items="${petList }" varStatus="idx">
					<span></span>
					<li id="${pet.birthday }" name="${pet.idx }"><a href="#" name="#tab${idx.count }" style="font-size: 25px;">${pet.name }</a></li>
					<input type="hidden" id="defaultBirth" name="${pet.idx }" value="${pet.birthday }">
					
				</c:forEach>
			</ul>
			<div id="content">
			<c:forEach var="pet" items="${petList }" varStatus="idx">
			            <div id="tab${idx.count }">
               <div class="col-md-3">
                  <p style="text-align: center;">
                  <img src="PetInfoImage/${pet.fileId }.do" onerror="this.src='img/noImage.png'" alt=""style="width: 100%;">
                  </p>
                  <p style="text-align: center;">
                     <input type="button" value="메인펫으로 지정" style="width: 100%" class="mainPetMk" onclick="location.href='mainPetUpdate.do?id=${sessionScope.id}&idx=${pet.idx}'"><br><br>
                  </p>
                  
               </div>
               <div class="col-md-9" style="font-size: 18px;">
               
                  <table cellspacing="0" class="pet_table">
                     <tr>
                        <td>
                           <span style="font-weight: bold;">${pet.name }</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;(등록번호 : <span>${pet.resist }</span>)
                           <span style="float: right;">
                              <input type="button" value="펫 수정" style="font-size: small;"
                              onclick="location.href='updatePetForm.do?idx=${pet.idx}'">
                              <input type="button" value="펫 삭제" id='${pet.idx }' class="petDel" style="font-size: small;">
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span>${pet.kind } </span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<span>${pet.sex }</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;중성화 여부 : <span>${pet.neutral }</span>&nbsp;&nbsp;<input type="button" value="짝꿍 찾으러가기 GO" style="font-size: small;" onclick = "location.href ='partnerMain.do'">
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span>생일 : ${pet.birthday } </span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<span id="ageSpan${pet.idx }"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;사람나이 <span id="transperAgeSpan${pet.idx }"></span>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span>${pet.weight }kg</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;해당견종 성견 평균무게 <span id="adultWeightSpan${pet.idx }"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;(기본) 하루 필요열량 <span id="caloriesSpan${pet.idx }"></span>&nbsp;&nbsp;<input type="button" value="체중관리 GO" style="font-size: small;" onclick = "location.href ='healthcare.do?id=${sessionScope.id}'">
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span id="exerciseMsgSpan${pet.idx }"></span><br>
                           <span id="warningMsgSpan${pet.idx }" style="font-size: small; color:orange;"></span> 
                        </td>
                     </tr>
                     <tr>
                        <td>
                        미용 주기 알림   <span style="color: #FF7421;" id="groomingDdaySpan${pet.idx }"></span>&nbsp;&nbsp;<input type="button" value="주기수정" style="font-size: small;">
                        </td>
                     </tr>
                     <tr>
                        <td>
                        다음 예방 접종 시기 <span style="color: #FF7421; " id="">[백신명]</span> 
                        <span style="color: #FF7421;"id="">D-00</span>&nbsp;&nbsp;<input type="button" value="접종관리 GO" style="font-size: small;"onclick = "location.href ='medicalcareForm.do?id=${sessionScope.id}'">
                        </td>
                     </tr>
                  </table>
                  
                  
                  
               </div>
            </div>

				<%-- <div id="tab${idx.count }">
						<div class="col-md-3">
							<p style="text-align: center;">
							<img src="img/dog_0${idx.count }.jpg" alt=""style="width: 100%;">
							</p>
							<p style="text-align: center;">
								<input type="button" value="메인펫으로 지정" style="width: 100%"><br><br>
	<!-- 							<input type="button" value="펫 수정" style="width: 48%"> -->
	<!-- 							<input type="button" value="펫 삭제" style="width: 48%"> -->
							</p>
							
						</div>
						<div class="col-md-9" style="font-size: 18px;">
						
					
								<p style="text-align: right; margin: 0">
									<input type="button" value="펫 수정" style="font-size: small;">
									<input type="button" value="펫 삭제" style="font-size: small;">
								</p>
							<table>
								<tr>
									<td>이름</td> <td style="font-weight: bold;">${pet.name }</td>
									<td>등록번호</td> <td>${pet.resist }</td>
								</tr>
								<tr>
									<td>품종</td> <td>${pet.kind }</td>
									<td>성별[중성화여부]</td> <td>${pet.sex }[${pet.neutral }]</td>
								</tr>
								<tr>
									<td>출생일</td> <td>${pet.birthday }</td>
									<td>나이</td> <td>나중에 계산하기</td>
								</tr>
								<tr>
									<td>몸무게</td> <td>${pet.weight }kg</td>
									<td>권장 열량</td> <td>나중에 계산하기</td>
								</tr>
								<tr>
									<td>권장 운동량</td> <td>나중에 계산하기</td>
									<td>미용 주기</td> <td>${pet.groomingPeriod }</td>
								</tr>
								<tr>
									<td>다음 접종일</td> <td colspan="3">나중에 계산[예방접종 이름도 같이 알려주면 좋을듯]</td>
								</tr>
							</table>
					
							<br> <br> <br> 	
						</div>
					</div> --%>
				
				</c:forEach>
		
			</div><!-- tab end -->
		</div>

	<!-- calendar -->
	 <div class="container">
         <div class="col-md-3"></div>
         <div class="col-md-8"id="calendar" style="text-align: right;"></div>  
      </div> 
		

	</div>


</body>
</html>