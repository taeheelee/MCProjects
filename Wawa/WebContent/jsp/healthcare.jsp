<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WAWA-healthcare</title>
<!-- D3 -->
<!-- <script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script> -->
<!-- <script type="text/javascript" src="js/healthD3.js?version=3"></script> -->
<!-- <script type="text/javascript" src="js/d3_test.js?version=3"></script> -->
<script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script type="text/javascript" src="js/nv.d3.js"></script>
<script type="text/javascript" src="js/simple.d3.js"></script>
<link href="js/nv.d3.css" rel="stylesheet">

<script type="text/javascript">
	var myPet = '';
	var isPet = false;
	function addTable(year, month, petinfo) {
		var tmp = (petinfo.weight*30)+70;
		var kcal = tmp*1.8;
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
		$('<td>').attr('colspan', '2').attr('id', 'petWeight').text(petinfo.weight + 'kg').appendTo(tr4); 
		$('<td>').attr('colspan', '2').text(kcal + 'kcal').appendTo(tr5);
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
	function chkDateFmt(data) { 
		var regDate = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		if (!regDate.test(data)) {
			alert('날짜 형식을 확인하세요.');
			return false;
		}
		return true;
	}
	function chkNumFmt(data) {
		var regNum = /^[0-9]+[.][0-9]+$/;
		if (!regNum.test(data)) {
			alert("소수점 첫째자리까지 입력하세요.");
			return false;
		}
		return true;
	}
	function updateInfo(day, weight) {
		var id = '${id }';
		$.ajax({
			type : 'get',
			url : 'updateHealthcare.do',
			data : "id=" + id + "&name=" + myPet + "&day=" + day + "&weight="
					+ weight,
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					addManageTable(day, weight);
					$('#day').val('');
					$('#wt').val('');
				} else {
					alert('등록실패');
				}
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}
	
	function uploadInfo(day, weight) {
		var id = '${id }';
		$.ajax({
			type : 'get',
			url : 'uploadHealthcare.do',
			data : "id=" + id + "&name=" + myPet + "&day=" + day + "&weight="
					+ weight,
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					addManageTable(day, weight);
					$('#day').val('');
					$('#wt').val('');
				} else {
					alert('등록실패');
				}
				
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}
	
	function chkDupl(){
		var id = '${id }';
		var day = $('#day').val();
		var weight = $('#wt').val();
		$.ajax({
			type : 'get',
			url : 'chkDupl.do',
			data : "id=" + id + "&name=" + myPet + "&day=" + day,
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					updateInfo(day, weight);
				} else {
					uploadInfo(day, weight);
				}
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}
	
	// 중복 검사하고 현재 날짜 이후의 날짜를 입력했는지 체크해야돼
	function chkDate(){ // 날짜를 받아서 계산
		var id = '${id }';
		var name = myPet;
		var day = $('#day').val();
		$.ajax({
			type : 'get',
			url : 'chkDate.do',
			data : "id=" + id + "&name=" + myPet + "&day=" + day,
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					chkDupl(); // 지난날짜이므로 입력 가능 ㅇㅇ
					// + 생일 이후로 입력해야댐
				} else {
					alert('오늘 이후나 생일 이전의 날짜는 입력하실 수 없습니다.');
					// 이후의 날짜이므로 입력 불가 
				}
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}
	
	function callPetinfo(id, name) { 
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
	}
	
	function addManageTable(day, weight) {
		$('tr:gt(1)', table).remove();
		var id = '${id}';
		$.ajax({
			type : 'get',
			url : 'selectHealthcare.do',
			data : "id=" + id + "&name=" + myPet,
			dataType : "json",
			success : function(data) {
				setManageTable(data.list, data.dateList);
			},
			error : function(data) {
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	}
	
	function setManageTable(list, dateList) {
		$(list).each(function(index, value) {
			var table = $('#table tbody');
			var tr = $('<tr>');
			$('<td>').text(dateList[index]).appendTo(tr);
			$('<td>').text(value.weight).appendTo(tr);
			$('<td>').appendTo(tr);
			table.append(tr);
		});
	}
	
	function callManageInfo(id, name) {
		$.ajax({
			type : 'get',
			url : 'selectHealthcare.do',
			data : "id=" + id + "&name=" + name,
			dataType : "json",
			success : function(data) {
				// 아이디, 이름으로 인덱스 받아오기
// 				// 저장된 데이터로 테이블 만들기
				setManageTable(data.list, data.dateList);
			},
			error : function(data) {
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	}
	
	$(document).ready(function() {
		$('.addBtn').click(function() {
			if (isPet == false) {
				alert('반려견을 선택하세요');
				return false;
			}
			var flag1 = chkDateFmt($('#day').val());
			var flag2 = chkNumFmt($('#wt').val());
			if (flag1 == true && flag2 == true) {
				chkDate();
			}
		});
		
		$('#name').change(function() {
			$('tr:gt(1)', table).remove();
			//$("#table tr:not(:first)").remove();
			//$('tr:gt(0)', table).remove();
			var name = $("#name option:selected").text();
			myPet = name;
			var id = '${id }';
			if (name == ' 선택하세요 ') {
				isPet = false;
			} else {
				isPet = true;
			}
			callPetinfo(id, name);
			callManageInfo(id, name);
		});
		
		var calculate = document.getElementById('calculate');
		var calculateCalories = document.getElementById('calculateCalories');
		calculate.onclick = function() {
			if(isPet == false){
				alert('강아지를 선택하세요.');	
			}else {
				var id = '${id}';
				var name = myPet;
				$.ajax({
					type : 'get',
					url : 'selectPet.do',
					data : "id=" + id + "&name=" + name,
					dataType : "json",
					success : function(data) {
						if (data.pet != null) {
							var activity = $("input[name=activity]:checked").val();
							//몸무게 가져와서 뿌리기
							var weight = data.pet.weight;
							calculateCalories.innerHTML = Number(activity) * ((weight * 30) + 70);
						} else {
						}
					},
					error : function(data) {
						alert("잠시 후 다시 시도해주세요.");
					}
				});
			}
		};
		// 	alert('${weightList}');
		var data = '${weightList}';
		// 	for(var pet in weightList) {
		// 		console.log(pet);
		// 	}
// 		draw(data);
		nv.addGraph();
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
						<font size="1.5" color="red"> #정보는 상위 5개만 표시됨</font>
						<font size="1.5" color="red"> #운동량 : 최근 몸무게 기준</font>
						<div class="woocommerce">
							<form method="post" action="#"></form>
						</div>
					</div>
				</div>
 
				<div class="col-md-9">
					<div class="col-md-6">
						<div class="product-content-right">
							<div class="woocommerce">
								<br>
								<form method="post" action="#">
									<table id="table" name="table" cellspacing="0"
										class="shop_table cart">
										<thead>
											<tr>
												<th>날짜<span id="dtError"></span></th>
												<th>몸무게<span id="wtError"></span></th>
												<td></td>
											</tr>
										</thead>
										<tbody>
											<tr class="cart_item">
												<td><input type="text" placeholder="0000-00-00"
													id="day" value="" style="width: 130px; height: 35px"></td>
												<td><input type="text" class="VcDate" placeholder="0.0"
													id="wt" style="width: 100px; height: 35px"> kg</td>
												<td><input type="button" value="추가" class="addBtn"
													name="addBtn" id="addBtn" style="padding: 3px 3px"></td>
											</tr>
 
										</tbody>
									</table>
								</form>
 
							</div>
						</div>
					</div>
 
 
 
					<!-- 그래프 -->
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
 
</body>
</html>