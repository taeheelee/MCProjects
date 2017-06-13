<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>eElectronics - HTML eCommerce Template</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<!-- jQuery Datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

	function dataCheck(){
		var test = document.getElementById('realShotDate');
		if(test.value ==""){
			alert("날짜를 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
	function dataCheck2(){
		var test = document.getElementById('realShotDate2');
		if(test.value ==""){
			alert("날짜를 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
	function dataCheck3(){
		var test = document.getElementById('realShotDate3');
		if(test.value ==""){
			alert("날짜를 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
	function dataCheck4(){
		var test = document.getElementById('realShotDate4');
		if(test.value ==""){
			alert("날짜를 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
	function dataCheck5(){
		var test = document.getElementById('realShotDate5');
		if(test.value ==""){
			alert("날짜를 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
	function dataCheck6(){
		var test = document.getElementById('realShotDate6');
		if(test.value ==""){
			alert("날짜를 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
	function dataCheck7(){
		var test = document.getElementById('realShotDate7');
		if(test.value ==""){
			alert("날짜를 입력해주세요");
			return false;
		}else{
			return true;
		}
	}
	function dataCheck8(){
		var test = document.getElementById('realShotDate8');
		if(test.value ==""){
			alert("날짜를 입력해주세요");
			return false;
		}else{
			return true;
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
//         showOn: "button",
//         buttonImage: "/images/team/calendar.png",
//         buttonImageOnly: true,
//         buttonText: "날짜 선택"
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
						<h2>나의 펫 메디컬케어</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="single-product-area">

		<div class="container">
			<div class="row">	
				<div class="col-md-3">


					
		
					
						<table cellspacing="0" class="shop_table cart">
									<thead>
										<tr>
											<th colspan="2" id="mypetmainimage">
												<img src="PetInfoImage/${petDetail.fileId }.do" onerror="this.src='img/noImage.png'" alt=""style="width: 100%;">
											</th>
										</tr>
									</thead>
									<tbody>
										<tr class="cart_item">
											<td colspan="2">
												<select class="" name="name" id="name" onchange="location.href=this.value">
														<option value="defaultValue">선택하세요</option>
														<c:forEach items="${list }" var="petinfo">
															<c:choose>
																<c:when test="${petDetail.idx == petinfo.idx }">
																	<option value="medicalcareForm.do?id=${petinfo.id}&petIdx=${petinfo.idx }" selected="selected">${petinfo.name }</option>
																</c:when>
																<c:otherwise>
																	<option value="medicalcareForm.do?id=${petinfo.id}&petIdx=${petinfo.idx }">${petinfo.name }</option>
																</c:otherwise>
															</c:choose>
															
														</c:forEach>				
												</select>
											</td>
										</tr>
										<tr class="cart_item">
											<td colspan="2" id="kind">${petDetail.kind }</td>
										</tr>
										<tr class="cart_item">
											<td id="petsex">${petDetail.sex }</td>
											<td id="neutral">${petDetail.neutral }</td>
										</tr>
										<tr class="cart_item">
											<td colspan="2" id="petage">
											<c:choose>
												<c:when test="${calculate.year==0}"></c:when>
												<c:otherwise> ${calculate.year}년</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${calculate.month==0}"></c:when>
												<c:otherwise> ${calculate.month}개월</c:otherwise>
											</c:choose>
											</td>
										</tr>
										<tr class="cart_item">
											<td colspan="2" id="weight">${petDetail.weight }kg</td>
										</tr>
										<tr class="cart_item">
											<td colspan="2" id="caloriesbyday">하루필요열량 ${calculate.calories}kcal</td>
										</tr>										



									</tbody>
								</table>
					
					
					
					
					
					

				</div>

				<!-- 여기여기여기부터 -->
				<div class="col-md-8">
					<div class="product-content-right">
						<h2 class="sidebar-title" style="margin-bottom: 10px">예방 접종 관리</h2>
						<p>이 홈페이지에서 안내하는 사항은 참고용입니다. 전문의와 상담 후 예방접종 일정을 조율 하십시오.</p>


			<table cellspacing="0" class="vaccine_table">
				<thead>
					<tr>
						<th colspan="2">접종일정 가이드</th>
                        <th>종합백신</th>
                        <th>코로나</th>
                        <th>켄넬코프</th>
                        <th>광견병</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    	<td rowspan="5">기초접종<br>(2주 간격)</td>
				        <td>1차 (6주령)</td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2차 (8주령)</td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>3차 (10주령)</td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                        <td></td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>4차 (12주령)</td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                        <td></td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>5차 (14주령)</td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                        <td></td>
                        <td></td>
                        <td><i class="fa fa-paw" aria-hidden="true"></i></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2">추가접종</td>
						<td colspan="4">매년 1회 추가접종</td>
                    </tr>
				</tbody>
			</table>





						<div class="woocommerce">

							<ul id="tabs">
								<li><a href="#" name="#tab1">종합백신 DHPPL</a></li>
								<li><a href="#" name="#tab2">코로나 Corona Virus</a></li>
								<li><a href="#" name="#tab3">켄넬코프 Kennel Cough</a></li>
								<li><a href="#" name="#tab4">광견병 Rabies</a></li>
							</ul>
							<div id="content">
								<div id="tab1">
									<h2>종합백신 DHPPL</h2>
									<h2 style="color: #ffc000; text-align: right; margin-top: -50px; margin-right: 30px">&nbsp; ${DDay.abc1}</h2>
									<p>개 홍역(Distemper), 전염성 간염(Infectious Hepatitis), 파보바이러스성
										장염(Pavovirus Enteritis), 파라인플루엔자성 기관지염(Parainflluenza) 및
										렙토스피라증(Leptospirosis) 등의 질병을 예방해주는 가장 중요한 예방접종이다.</p>
									<p>6~8주부터 시작해서 2~3주 간격으로 3~5회 접종, 매년 1회 추가접종한다. 접종 뒤 1주일간
										목욕금지.</p>
									
					<table cellspacing="0" class="shop_table cart">
						<thead>
							<tr>
								<th colspan="2">접종일정</th>
		                        <th>접종예정일</th>
		                        <th colspan="2">실제접종일</th>
		                    </tr>
		                </thead>
		                <tbody>
                   
							<c:choose>
	                        	<c:when test="${vaccineRecord.v101 == null }">
	                       			 <tr>
	                       				<td rowspan="5" style="color: #ffc000">기초접종</td>
				                        <td style="color: #ffc000">1차</td>
				                        <td>${nextSchedules.d101}</td>
				                        <form method="post" action="insertVaccine.do" onsubmit="return dataCheck()">
					                        <td>
					                        
						                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
						                        <input type="hidden" value="1" name="vaccineCode">
						                        <input type="hidden" value="기초" name="vaccineType">
						                        <input type="hidden" value="1" name="degree">
					                        	<input type="text" placeholder="0000-00-00" value="" id="realShotDate" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
					                        </td>
						                    <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
					               		</form>
					                 </tr>
			                        
	                        	</c:when>
	                        	<c:otherwise>
									<tr>
										<td rowspan="5" style="color: #ffc000">기초접종</td>
				                        <td style="color: #ffc000">1차</td>
				                        <td>${nextSchedules.d101}</td>
				                        <td><input type="text" value="${vaccineRecord.v101}" readonly="readonly" id="" readonly="readonly" name=""style="width: 150px;text-align: center;"></td>
					                    <td>
					                    	<form method="post" action="deleteVaccine.do">
						                        <input type="hidden" value="${vaccineRecord.v101idx}" name="idx">
						                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
						                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px;"></td>
		                    				</form>
					                    </td>
					                 </tr>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${vaccineRecord.v102 == null }">	 
	                       			 <tr>
				                        <td style="color: #ffc000">2차</td>
				                        <td>${nextSchedules.d102}</td>
				                        <c:choose>
					                    	<c:when test="${vaccineRecord.v101 == null }">
					                    	<td></td>
					                    	<td></td>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<form method="post" action="insertVaccine.do" onsubmit="return dataCheck()">
						                    		 <td>
							                    		 <input type="hidden" value="${petDetail.idx }" name="petIdx">
								                         <input type="hidden" value="1" name="vaccineCode">
								                         <input type="hidden" value="기초" name="vaccineType">
								                         <input type="hidden" value="2" name="degree">
							                        	 <input type="text" placeholder="0000-00-00" value="" id="realShotDate" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
						                        
						                    		 
						                    		 </td>
								                     <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
					                    		 </form>
					                    	</c:otherwise>
					                    </c:choose>
					                 </tr>  
	                        	</c:when>
	                        	<c:otherwise>
									<tr>
				                        <td style="color: #ffc000">2차</td>
				                        <td>${nextSchedules.d102}</td>
				                        <td><input type="text" value="${vaccineRecord.v102}" readonly="readonly" id="" name=""style="width: 150px;text-align: center;"></td>
					                    <td>
						                    <form method="post" action="deleteVaccine.do">
						                        <input type="hidden" value="${vaccineRecord.v102idx}" name="idx">
						                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
						                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px;"></td>
		                    				</form>
					                    </td>
					                 </tr>
	                        	</c:otherwise>
	                        </c:choose>
	                         <c:choose>
	                        	<c:when test="${vaccineRecord.v103 == null }">	 
	                       			 <tr>
				                        <td style="color: #ffc000">3차</td>
				                        <td>${nextSchedules.d103}</td>
				                        <c:choose>
					                    	<c:when test="${vaccineRecord.v102 == null }">
					                    	<td></td>
					                    	<td></td>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<form method="post" action="insertVaccine.do" onsubmit="return dataCheck()">
						                    		 <td>
							                    		 <input type="hidden" value="${petDetail.idx }" name="petIdx">
								                         <input type="hidden" value="1" name="vaccineCode">
								                         <input type="hidden" value="기초" name="vaccineType">
								                         <input type="hidden" value="3" name="degree">
							                        	 <input type="text" placeholder="0000-00-00" value="" id="realShotDate" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
						                        
						                    		 
						                    		 </td>
								                     <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
					                    		 </form>
					                    	</c:otherwise>
					                    </c:choose>
					                 </tr>  
	                        	</c:when>
	                        	<c:otherwise>
									<tr>
				                        <td style="color: #ffc000">3차</td>
				                        <td>${nextSchedules.d103}</td>
				                        <td><input type="text" value="${vaccineRecord.v103}" readonly="readonly" id="" name=""style="width: 150px;text-align: center;"></td>
					                    <td>
					                    	<form method="post" action="deleteVaccine.do">
						                        <input type="hidden" value="${vaccineRecord.v103idx}" name="idx">
						                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
						                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px"></td>
		                    				</form>
					                    </td>
					                 </tr>
	                        	</c:otherwise>
	                        </c:choose>
	                         <c:choose>
	                        	<c:when test="${vaccineRecord.v104 == null }">	 
	                       			 <tr>
				                        <td style="color: #ffc000">4차</td>
				                        <td>${nextSchedules.d104}</td>
				                        <c:choose>
					                    	<c:when test="${vaccineRecord.v103 == null }">
					                    	<td></td>
					                    	<td></td>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<form method="post" action="insertVaccine.do" onsubmit="return dataCheck()">
						                    		 <td>
							                    		 <input type="hidden" value="${petDetail.idx }" name="petIdx">
								                         <input type="hidden" value="1" name="vaccineCode">
								                         <input type="hidden" value="기초" name="vaccineType">
								                         <input type="hidden" value="4" name="degree">
							                        	 <input type="text" placeholder="0000-00-00" value="" id="realShotDate" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
						                        
						                    		 
						                    		 </td>
								                     <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
					                    		 </form>
					                    	</c:otherwise>
					                    </c:choose>
					                 </tr>  
	                        	</c:when>
	                        	<c:otherwise>
									<tr>
				                        <td style="color: #ffc000">4차</td>
				                        <td>${nextSchedules.d104}</td>
				                        <td><input type="text" value="${vaccineRecord.v104}" readonly="readonly" id="" name=""style="width: 150px;text-align: center;"></td>
					                    <td>
					                    	<form method="post" action="deleteVaccine.do">
						                        <input type="hidden" value="${vaccineRecord.v104idx}" name="idx">
						                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
						                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px"></td>
		                    				</form>
					                    </td>
					                 </tr>
	                        	</c:otherwise>
	                        </c:choose>
	                        
	                        
	                        
	                        <c:choose>
	                        	<c:when test="${vaccineRecord.v105 == null }">	 
	                       			 <tr>
				                        <td style="color: #ffc000">5차</td>
				                        <td>${nextSchedules.d105}</td>
				                        
					                    <c:choose>
					                    	<c:when test="${vaccineRecord.v104 == null }">
					                    	<td></td>
					                    	<td></td>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<form method="post" action="insertVaccine.do" onsubmit="return dataCheck()">
						                    		 <td>
							                    		 <input type="hidden" value="${petDetail.idx }" name="petIdx">
								                         <input type="hidden" value="1" name="vaccineCode">
								                         <input type="hidden" value="기초" name="vaccineType">
								                         <input type="hidden" value="5" name="degree">
							                        	 <input type="text" placeholder="0000-00-00" value="" id="realShotDate" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
						                        
						                    		 
						                    		 </td>
								                     <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
					                    		 </form>
					                    	</c:otherwise>
					                    </c:choose>
					                    
					                    
					                 </tr>  
	                        	</c:when>
	                        	<c:otherwise>
									<tr>
				                        <td style="color: #ffc000">5차</td>
				                        <td>${nextSchedules.d105}</td>
				                        <td><input type="text" value="${vaccineRecord.v105}" readonly="readonly" id=""  name=""style="width: 150px;text-align: center;"></td>
					                    <td>
					                   		<form method="post" action="deleteVaccine.do">
						                        <input type="hidden" value="${vaccineRecord.v105idx}" name="idx">
						                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
						                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px"></td>
		                    				</form>
					                    </td>
					                 </tr>
	                        	</c:otherwise>
	                        </c:choose>
	                        


							<c:forEach var="aHDPPL" items="${additionalHDPPL }" varStatus="idx">
								
														
										
								
								
								<tr>
									<td colspan="2" style="color: #ffc000">추가접종</td>
									
									<c:choose>	
										<c:when test="${vaccineRecord.v105==null}">
											<td>${nextHDPPL[idx.index-1].nextSchedules}</td>
										</c:when>
										<c:otherwise>
											<td>${nextHDPPL[idx.index].nextSchedules}</td>
										</c:otherwise>
									</c:choose>	
								
									<%-- ${idx.index } --%>
			                        <td><input type="text" value="${aHDPPL.realShotDate }" id="${aHDPPL.idx }" readonly="readonly" name="aHDPPL"style="width: 150px;text-align: center;"></td>
			                        <td>
										<form method="post" action="deleteVaccine.do">
					                        <input type="hidden" value="${aHDPPL.idx }" name="idx">
					                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
					                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px"></td>
	                    				</form>
	                    		</tr>
	                    		
	                    		
	                    		
	                    		
							</c:forEach>
            
                    <form method="post" action="insertVaccine.do" onsubmit="return dataCheck2()">
                    <tr>
                        <td colspan="2" style="color: #ffc000">추가접종</td>
						<td>${lastHDPPL.lastPang }</td>
                        <td>
                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
                        <input type="hidden" value="1" name="vaccineCode">
                        <input type="hidden" value="추가" name="vaccineType">
                        <input type="hidden" value="0" name="degree">
                        <input type="text" placeholder="0000-00-00" id="realShotDate2" readonly="readonly" class="datepicker" name="realShotDate"style="width: 150px;text-align: center;"></td>
                        <td><input type="submit" value="등록" name="insertVaccine " class="button" style="padding: 5px 5px"></td>
                    </tr>
                    </form>
				</tbody>
			</table>
										
										
										

								</div>

								<div id="tab2">
									<h2>코로나 Corona Virus</h2>
									<h2 style="color: #ffc000; text-align: right; margin-top: -50px; margin-right: 30px"> &nbsp; ${DDay.abc2}</h2>
									<p>코로나바이러스성 장염은 피가 섞인 설사를 하고, 구토를 하며, 열이 나고, 식욕이 없어지는 증세가
										특징.</p>
									<p>생후 6~8주부터 2~3주 간격으로 2회 접종, 매년 1회 추가접종한다.</p>

									<table cellspacing="0" class="shop_table cart">
												<thead>
													<tr>
														<th colspan="2">접종일정</th>
								                        <th>접종예정일</th>
								                        <th colspan="2">실제접종일</th>
								                    </tr>
								                </thead>
								                <tbody>
						                   
													<c:choose>
							                        	<c:when test="${vaccineRecord.v201 == null }">
							                       			 <tr>
							                       				<td rowspan="2" style="color: #ffc000">기초접종</td>
										                        <td style="color: #ffc000">1차</td>
										                        <td>${nextSchedules.d201}</td>
										                        <form method="post" action="insertVaccine.do" onsubmit="return dataCheck3()">
											                        <td>
											                        
												                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
												                        <input type="hidden" value="2" name="vaccineCode">
												                        <input type="hidden" value="기초" name="vaccineType">
												                        <input type="hidden" value="1" name="degree">
											                        	<input type="text" placeholder="0000-00-00" value="" id="realShotDate3" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
											                        </td>
												                    <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
											               		</form>
											                 </tr>
									                        
							                        	</c:when>
							                        	<c:otherwise>
															<tr>
																<td rowspan="2" style="color: #ffc000">기초접종</td>
										                        <td style="color: #ffc000">1차</td>
										                        <td>${nextSchedules.d201}</td>
										                        <td><input type="text" value="${vaccineRecord.v201}" readonly="readonly" id="" readonly="readonly" name=""style="width: 150px;text-align: center;"></td>
											                    <td>
											                    	<form method="post" action="deleteVaccine.do">
												                        <input type="hidden" value="${vaccineRecord.v201idx}" name="idx">
												                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
												                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px;"></td>
								                    				</form>
											                    </td>
											                 </tr>
							                        	</c:otherwise>
							                        </c:choose>
							                        <c:choose>
							                        	<c:when test="${vaccineRecord.v202 == null }">	 
							                       			 <tr>
										                        <td style="color: #ffc000">2차</td>
										                        <td>${nextSchedules.d202}</td>
										                        <c:choose>
											                    	<c:when test="${vaccineRecord.v201 == null }">
											                    	<td></td>
											                    	<td></td>
											                    	</c:when>
											                    	<c:otherwise>
											                    		<form method="post" action="insertVaccine.do" onsubmit="return dataCheck3()">
												                    		 <td>
													                    		 <input type="hidden" value="${petDetail.idx }" name="petIdx">
														                         <input type="hidden" value="2" name="vaccineCode">
														                         <input type="hidden" value="기초" name="vaccineType">
														                         <input type="hidden" value="2" name="degree">
													                        	 <input type="text" placeholder="0000-00-00" value="" id="realShotDate3" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
												                        
												                    		 
												                    		 </td>
														                     <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
											                    		 </form>
											                    	</c:otherwise>
											                    </c:choose>
											                 </tr>  
							                        	</c:when>
							                        	<c:otherwise>
															<tr>
										                        <td style="color: #ffc000">2차</td>
										                        <td>${nextSchedules.d202}</td>
										                        <td><input type="text" value="${vaccineRecord.v202}" readonly="readonly" id="" name=""style="width: 150px;text-align: center;"></td>
											                    <td>
												                    <form method="post" action="deleteVaccine.do">
												                        <input type="hidden" value="${vaccineRecord.v202idx}" name="idx">
												                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
												                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px;"></td>
								                    				</form>
											                    </td>
											                 </tr>
							                        	</c:otherwise>
							                        </c:choose>
							                         
							                        
						
						
													<c:forEach var="aCorona" items="${additionalCorona }" varStatus="idx">
														<tr>
															<td colspan="2" style="color: #ffc000">추가접종</td>
															<c:choose>
																<c:when test="${vaccineRecord.v202==null}">
																	<td>${nextCorona[idx.index-1].nextSchedules}</td>
																</c:when>
																<c:otherwise>
																	<td>${nextCorona[idx.index].nextSchedules}</td>
																</c:otherwise>
															</c:choose>	
															<%-- <td>${nextCorona[idx.index].nextSchedules}</td> --%>
															<%-- ${idx.index } --%>
									                        <td><input type="text" value="${aCorona.realShotDate }" id="${aCorona.idx }" readonly="readonly" name="aCorona"style="width: 150px;text-align: center;"></td>
									                        <td>
																<form method="post" action="deleteVaccine.do">
											                        <input type="hidden" value="${aCorona.idx }" name="idx">
											                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
											                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px"></td>
							                    				</form>
							                    		</tr>
													</c:forEach>
						            
						                    <form method="post" action="insertVaccine.do" onsubmit="return dataCheck4()">
						                    <tr>
						                        <td colspan="2" style="color: #ffc000">추가접종</td>
												<td>${lastCorona.lastPang }</td>
						                        <td>
						                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
						                        <input type="hidden" value="2" name="vaccineCode">
						                        <input type="hidden" value="추가" name="vaccineType">
						                        <input type="hidden" value="0" name="degree">
						                        <input type="text" placeholder="0000-00-00" id="realShotDate4" readonly="readonly" class="datepicker" name="realShotDate"style="width: 150px;text-align: center;"></td>
						                        <td><input type="submit" value="등록" name="insertVaccine " class="button" style="padding: 5px 5px"></td>
						                    </tr>
						                    </form>
										</tbody>
									</table>
								</div>

								<div id="tab3">
									<h2>켄넬코프 Kennel Cough</h2>
									<h2 style="color: #ffc000; text-align: right; margin-top: -50px; margin-right: 30px">&nbsp; ${DDay.abc3}</h2>
									<p>주로 강아지들이 대량으로 있는 곳에서 공기를 통해 쉽게 감염되며 심한 마른기침을 일으키며 폐렴으로
										진행되기도 한다.</p>
									<p>생후 6~8주부터 2~3주 간격으로 2회 접종, 매년 1회 추가접종한다.</p>
									<table cellspacing="0" class="shop_table cart">
												<thead>
													<tr>
														<th colspan="2">접종일정</th>
								                        <th>접종예정일</th>
								                        <th colspan="2">실제접종일</th>
								                    </tr>
								                </thead>
								                <tbody>
						                   
													<c:choose>
							                        	<c:when test="${vaccineRecord.v301 == null }">
							                       			 <tr>
							                       				<td rowspan="2" style="color: #ffc000">기초접종</td>
										                        <td style="color: #ffc000">1차</td>
										                        <td>${nextSchedules.d301}</td>
										                        <form method="post" action="insertVaccine.do" onsubmit="return dataCheck5()">
											                        <td>
											                        
												                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
												                        <input type="hidden" value="3" name="vaccineCode">
												                        <input type="hidden" value="기초" name="vaccineType">
												                        <input type="hidden" value="1" name="degree">
											                        	<input type="text" placeholder="0000-00-00" value="" id="realShotDate5" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
											                        </td>
												                    <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
											               		</form>
											                 </tr>
									                        
							                        	</c:when>
							                        	<c:otherwise>
															<tr>
																<td rowspan="2" style="color: #ffc000">기초접종</td>
										                        <td style="color: #ffc000">1차</td>
										                        <td>${nextSchedules.d301}</td>
										                        <td><input type="text" value="${vaccineRecord.v301}" readonly="readonly" id="" readonly="readonly" name=""style="width: 150px;text-align: center;"></td>
											                    <td>
											                    	<form method="post" action="deleteVaccine.do">
												                        <input type="hidden" value="${vaccineRecord.v301idx}" name="idx">
												                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
												                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px;"></td>
								                    				</form>
											                    </td>
											                 </tr>
							                        	</c:otherwise>
							                        </c:choose>
							                        <c:choose>
							                        	<c:when test="${vaccineRecord.v302 == null }">	 
							                       			 <tr>
										                        <td style="color: #ffc000">2차</td>
										                        <td>${nextSchedules.d302}</td>
										                        <c:choose>
											                    	<c:when test="${vaccineRecord.v301 == null }">
											                    	<td></td>
											                    	<td></td>
											                    	</c:when>
											                    	<c:otherwise>
											                    		<form method="post" action="insertVaccine.do" onsubmit="return dataCheck5()">
												                    		 <td>
													                    		 <input type="hidden" value="${petDetail.idx }" name="petIdx">
														                         <input type="hidden" value="3" name="vaccineCode">
														                         <input type="hidden" value="기초" name="vaccineType">
														                         <input type="hidden" value="2" name="degree">
													                        	 <input type="text" placeholder="0000-00-00" value="" id="realShotDate5" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
												                        
												                    		 
												                    		 </td>
														                     <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
											                    		 </form>
											                    	</c:otherwise>
											                    </c:choose>
											                 </tr>  
							                        	</c:when>
							                        	<c:otherwise>
															<tr>
										                        <td style="color: #ffc000">2차</td>
										                        <td>${nextSchedules.d302}</td>
										                        <td><input type="text" value="${vaccineRecord.v302}" readonly="readonly" id="" name=""style="width: 150px;text-align: center;"></td>
											                    <td>
												                    <form method="post" action="deleteVaccine.do">
												                        <input type="hidden" value="${vaccineRecord.v302idx}" name="idx">
												                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
												                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px;"></td>
								                    				</form>
											                    </td>
											                 </tr>
							                        	</c:otherwise>
							                        </c:choose>
							                         
							                        
						
						
													<c:forEach var="aKennel" items="${additionalKennel }" varStatus="idx">
														<tr>
															<td colspan="2" style="color: #ffc000">추가접종</td>
															<c:choose>
																<c:when test="${vaccineRecord.v302==null}">
																	<td>${nextKennel[idx.index-1].nextSchedules}</td>
																</c:when>
																<c:otherwise>
																	<td>${nextKennel[idx.index].nextSchedules}</td>
																</c:otherwise>
															</c:choose>
															<%-- <td>${nextKennel[idx.index].nextSchedules}</td> --%>
															<%-- ${idx.index } --%>
									                        <td><input type="text" value="${aKennel.realShotDate }" id="${aKennel.idx }" readonly="readonly" name="aKennel"style="width: 150px;text-align: center;"></td>
									                        <td>
																<form method="post" action="deleteVaccine.do">
											                        <input type="hidden" value="${aKennel.idx }" name="idx">
											                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
											                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px"></td>
							                    				</form>
							                    		</tr>
													</c:forEach>
						            
						                    <form method="post" action="insertVaccine.do" onsubmit="return dataCheck6()">
						                    <tr>
						                        <td colspan="2" style="color: #ffc000">추가접종</td>
												<td>${lastKennel.lastPang }</td>
						                        <td>
						                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
						                        <input type="hidden" value="3" name="vaccineCode">
						                        <input type="hidden" value="추가" name="vaccineType">
						                        <input type="hidden" value="0" name="degree">
						                        <input type="text" placeholder="0000-00-00" id="realShotDate6" readonly="readonly" class="datepicker" name="realShotDate"style="width: 150px;text-align: center;"></td>
						                        <td><input type="submit" value="등록" name="insertVaccine " class="button" style="padding: 5px 5px"></td>
						                    </tr>
						                    </form>
										</tbody>
									</table>

								</div>

								<div id="tab4">
									<h2>광견병 Rabies</h2>
									<h2 style="color: #ffc000; text-align: right; margin-top: -50px; margin-right: 30px"> &nbsp; ${DDay.abc4}</h2>
									<p>광견병 바이러스가 매개하는 감염증으로 광견병은 공수병이라고도 한다. 모든 온혈동물에서 발생되는
										질병으로 감염 동물로부터 교상(물리거나 할퀸 상처)을 통해 동물 및 사람에게 전파되는 중요한 인수공통전염병이다.</p>
									<p>생후 3개월 이상 된 강아지에게 1회 접종한 후 6개월 후 재접종한다. 매년 추가접종을 해야 한다</p>
									<table cellspacing="0" class="shop_table cart">
												<thead>
													<tr>
														<th colspan="2">접종일정</th>
								                        <th>접종예정일</th>
								                        <th colspan="2">실제접종일</th>
								                    </tr>
								                </thead>
								                <tbody>
						                   
													<c:choose>
							                        	<c:when test="${vaccineRecord.v401 == null }">
							                       			 <tr>
							                       				<td rowspan="1" style="color: #ffc000">기초접종</td>
										                        <td style="color: #ffc000">1차</td>
										                        <td>${nextSchedules.d401}</td>
										                        <form method="post" action="insertVaccine.do" onsubmit="return dataCheck7()">
											                        <td>
											                        
												                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
												                        <input type="hidden" value="4" name="vaccineCode">
												                        <input type="hidden" value="기초" name="vaccineType">
												                        <input type="hidden" value="1" name="degree">
											                        	<input type="text" placeholder="0000-00-00" value="" id="realShotDate7" readonly="readonly"class="datepicker" name="realShotDate"style="width: 150px;text-align: center;">
											                        </td>
												                    <td><input type="submit" value="등록" name="update_cart" class="button" style="padding: 5px 5px"></td>
											               		</form>
											                 </tr>
									                        
							                        	</c:when>
							                        	<c:otherwise>
															<tr>
																<td rowspan="1" style="color: #ffc000">기초접종</td>
										                        <td style="color: #ffc000">1차</td>
										                        <td>${nextSchedules.d401}</td>
										                        <td><input type="text" value="${vaccineRecord.v401}" readonly="readonly" id="" readonly="readonly" name=""style="width: 150px;text-align: center;"></td>
											                    <td>
											                    	<form method="post" action="deleteVaccine.do">
												                        <input type="hidden" value="${vaccineRecord.v401idx}" name="idx">
												                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
												                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px;"></td>
								                    				</form>
											                    </td>
											                 </tr>
							                        	</c:otherwise>
							                        </c:choose>
							                        
							                         
							                        
						
						
													<c:forEach var="aRadies" items="${additionalRadies }" varStatus="idx">
														<tr>
															<td colspan="2" style="color: #ffc000">추가접종</td>
															<c:choose>
																<c:when test="${vaccineRecord.v401==null}">
																	<td>${nextRadies[idx.index-1].nextSchedules}</td>
																</c:when>
																<c:otherwise>
																	<td>${nextRadies[idx.index].nextSchedules}</td>
																</c:otherwise>
															</c:choose>
															<%-- <td>${nextRadies[idx.index].nextSchedules}</td> --%>
															<%-- ${idx.index } --%>
									                        <td><input type="text" value="${aRadies.realShotDate }" id="${aRadies.idx }" readonly="readonly" name="aRadies"style="width: 150px;text-align: center;"></td>
									                        <td>
																<form method="post" action="deleteVaccine.do">
											                        <input type="hidden" value="${aRadies.idx }" name="idx">
											                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
											                        <input type="submit" value="삭제" name="update_cart" id="delete_btn" style="padding: 5px 5px"></td>
							                    				</form>
							                    		</tr>
													</c:forEach>
						            
						                    <form method="post" action="insertVaccine.do" onsubmit="return dataCheck8()">
						                    <tr>
						                        <td colspan="2" style="color: #ffc000">추가접종</td>
												<td>${lastRadies.lastPang }</td>
						                        <td>
						                        <input type="hidden" value="${petDetail.idx }" name="petIdx">
						                        <input type="hidden" value="4" name="vaccineCode">
						                        <input type="hidden" value="추가" name="vaccineType">
						                        <input type="hidden" value="0" name="degree">
						                        <input type="text" placeholder="0000-00-00" id="realShotDate8" readonly="readonly" class="datepicker" name="realShotDate"style="width: 150px;text-align: center;"></td>
						                        <td><input type="submit" value="등록" name="insertVaccine " class="button" style="padding: 5px 5px"></td>
						                    </tr>
						                    </form>
										</tbody>
									</table>
								</div>
							</div>
							<!-- tab end -->


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>