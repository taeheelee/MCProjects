<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WAWA-healthcare</title>
<!-- D3 -->
<script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="js/healthD3.js?version=3"></script> -->
<script type="text/javascript" src="js/d3_test.js?version=3"></script>
<style type="text/css">
svg {
	width: 300px;
	height: 500px;
	border: 1px solid black;
}

.bar {
	fill: orange;
}

.barNum { /*그래프값 */
	font-size: 9pt;
	text-anchor: middle;
}

.axis text { /*y축 눈금 글자 크기*/
	font-family: sans-serif;
	font-size: 11px
}

.axis path, .axis line {
	fill: none;
	stroke: black;
}

.axis_x line {
	fill: none;
	stroke: black;
}

.barName { /*그래프 레이블*/
	font-size: 9pt;
	text-anchor: middle;
}
</style>
<script type="text/javascript">
	var myPet = '';
	var isPet = false;

	function addTable(year, month, petinfo) {
		var table = $('#lTable tbody');
		$('tr:gt(0)', table).remove();
		var tr1 = $('<tr>');
		var tr2 = $('<tr>');
		var tr3 = $('<tr>');
		var tr4 = $('<tr>');
		var tr5 = $('<tr>');
		$('<td>').attr('colspan', '2').text(petinfo.kind).appendTo(tr1);
		$('<td>').text(petinfo.sex).appendTo(tr2);
		$('<td>').text(petinfo.neutral).appendTo(tr2);
		$('<td>').attr('colspan', '2').text(year + "년" + month + "개월")
				.appendTo(tr3);
		$('<td>').attr('colspan', '2').text(petinfo.weight).appendTo(tr4);
		$('<td>').attr('colspan', '2').text('하루필요열량 000kcal').appendTo(tr5);
		table.append(tr1);
		table.append(tr2);
		table.append(tr3);
		table.append(tr4);
		table.append(tr5);
	}

	function addPetinfo(pet) {
		var id = '${id }';
		var year = 0;
		var month = 0;
		$.ajax({
			type : 'get',
			url : 'calcAge.do',
			data : "name=" + pet.name + "&id=" + id,
			dataType : 'json',
			success : function(data) {
				if (data.year != null && data.month != null) {

					addTable(data.year, data.month, pet);
				} else {
				}
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}

	function chkDateFmt(ch, num) {
		var regDate = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		if (!regDate.test($('#day' + num).val())) {
			alert('날짜 형식을 확인하세요');
			return false;
		}
		return true;
	}
	
	function addFirstElement(data) {
		var num = data.attr('name');
		if (isPet == false) {
			alert('반려견을 선택하세요');
			return false;
		}

		var flag = chkDateFmt(num);
		if (flag == true) {
			if (data.val() == "입력") {
				uploadInfo(num);
			} else {
				uploadInfoAfter(num);
			}
		}
		data.val('수정');
	}
	
	function uploadInfo(num){
		var id = '${id }';
		var day = $('#day' + num).val();
		var weight = $('#wt' + num).val();
		$.ajax({
			type : 'get',
			url : 'uploadMedical.do',
			data : "id=" + id + "&petname=" + myPet + "&day=" + day
					+ "&weight=" + weight,
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					$('#day' + num).attr("readonly", true);
					$('#wt' + 1).attr("readonly", true);
				} else {
				}
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}
	
	function uploadInfoAfter(num){
		var id = '${id }';
		
	}
	
	function addDayForm(num) {
		$('#day' + num).attr("readonly", false);
		$('#wt' + 1).attr("readonly", false);
	}
	
	$(document).ready(function() {

		$('.addDay').click(function() {
			var num = $(this).attr('name'); // 첫번째!
			addDayForm(num);
		});

		$('.uploadBtn').click(function() {
			addFirstElement($(this));
		});
		
		$('#name').change(function() {
			var name = $("#name option:selected").text();
			myPet = name;
			var id = '${id }';

			if (name == ' 선택하세요 ') {
				isPet = false;
			} else {
				isPet = true;
			}
			$.ajax({
				type : 'get',
				url : 'selectPet.do',
				data : "id=" + id + "&name=" + name,
				dataType : "json",
				success : function(data) {
					if (data.pet != null) {
						addPetinfo(data.pet);
					} else {

					}
				},
				error : function(data) {
					alert("잠시 후 다시 시도해주세요.");
				}
			});
		});

		var calculate = document.getElementById('calculate');
		var calculateCalories = document.getElementById('calculateCalories');

		calculate.onclick = function() {
			var activity = $("input[name=activity]:checked").val();
			// 		alert(activity);
			calculateCalories.innerHTML = Number(activity) * ((5 * 30) + 70);
		};
		// 	alert('${weightList}');
		var data = '${weightList}';
		// 	for(var pet in weightList) {
		// 		console.log(pet);
		// 	}
		draw(data);
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
						<table cellspacing="0" class="shop_table cart" id="lTable">
							<thead>
								<tr>
									<th colspan="2" id="mypetmainimage"><img
										src="img/dog_04.jpg" alt=""></th>
								</tr>
							</thead>
							<tbody>
								<tr class="cart_item">
									<td colspan="2"><select
										class="country_to_state country_select" name="name" id="name">
											<option value="defaultValue">선택하세요</option>
											<c:forEach items="${list }" var="petinfo">
												<option value="${petinfo.name }">${petinfo.name }</option>
											</c:forEach>
									</select></td>
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
									<table id="table1" name="table1" cellspacing="0" class="shop_table cart">
										<thead>
											<tr>
												<th>날짜</th>
												<th colspan="2">몸무게</th>
											</tr>
										</thead>
										<tbody>
											<tr class="cart_item">
												<td><input type="button" value=" + " class="addDay"
													name="1" id="addBtn1" style="padding: 3px 3px">
													<input type="text" placeholder="0000-00-00"
													id="day1" value="" style="width: 100px" readonly></td>
												<td> <input type="text" class="VcDate" placeholder="00"
													id="wt1" readonly> kg </td>
												<td><input type="button" value="입력" class="uploadBtn"
													name="1" id='uploadBtn1' style="padding: 3px 3px"></td>
											</tr>
											<!--                               <tr> -->
											<!--                                  <td><input type="text" placeholder="0000-00-00" value="" -->
											<!--                                       style="width: 100px"></td> -->

											<!--                                  <td><input type="text" placeholder="kg" value="" -->
											<!--                                       style="width: 80px"> -->
											<!--                                     kg</td> -->
											<!--                                  <td><input type="submit" value="등록"  -->
											<!--                                     class="button" style="padding: 5px 5px"></td> -->
											<!--                               </tr> -->
											<!--                               <tr> -->
											<!--                                  <td><input type="text" placeholder="0000-00-00" value="" -->
											<!--                                       style="width: 100px"></td> -->

											<!--                                  <td><input type="text" placeholder="kg" value="" -->
											<!--                                      style="width: 80px" > -->
											<!--                                     kg</td> -->
											<!--                                  <td>등록</td> -->
											<!--                               </tr> -->
											<!--                               <tr> -->
											<!--                                  <td><input type="text" placeholder="0000-00-00" value="" -->
											<!--                                       style="width: 100px"></td> -->

											<!--                                  <td><input type="text" placeholder="kg" value="" -->
											<!--                                      style="width: 80px" > -->
											<!--                                     kg</td> -->
											<!--                                  <td>등록</td> -->
											<!--                               </tr> -->
											<!--                               <tr> -->
											<!--                                  <td><input type="text" placeholder="0000-00-00" value="" -->
											<!--                                       style="width: 100px"></td> -->

											<!--                                  <td><input type="text" placeholder="kg" value="" -->
											<!--                                       style="width: 80px"> -->
											<!--                                     kg</td> -->
											<!--                                  <td>등록</td> -->
											<!--                               </tr> -->


										</tbody>
									</table>
								</form>

							</div>
						</div>
					</div>



					<!-- 그래프 구역 -->
					<div class="col-md-6">
						<svg id="myGraph"></svg>
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
							<input type="radio" name="activity" id="activity" value="1.8"
								checked="checked">운동량 없음 <input type="radio"
								name="activity" id="activity" value="2.0">가벼운 운동 <input
								type="radio" name="activity" id="activity" value="3.0">적당한
							운동 <input type="radio" name="activity" id="activity" value="4.0">심한
							운동 <input type="button" value="Calculate" id="calculate"
								onclick=""> <br>
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

</body>
</html>