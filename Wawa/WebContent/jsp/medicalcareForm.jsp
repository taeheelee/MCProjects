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
<script type="text/javascript">
	var myPet = '';
	var id = '${id}';
	var isPet = false;
	function header(num) {
		var table = $('#table' + num + ' thead');
		var tr = $('<tr>');
		$('<th>').attr('colspan', '1').text('접종일정').appendTo(tr);
		$('<th>').attr('colspan', '2').text('다음접종일').appendTo(tr);
		$('<th>').text('실제접종일').appendTo(tr);
		$('<th>').appendTo(tr);
		table.append(tr);
	}

	function addPetinfo(data) {
		var petinfo = data.pet;
		var id = '${id }';
		var year = 0;
		var month = 0;
		$.ajax({
			type : 'get',
			url : 'calcAge.do',
			data : "name=" + petinfo.name + "&id=" + id,
			dataType : 'json',
			success : function(data) {
				if (data.year != null && data.month != null) {
					addTable(data.year, data.month, petinfo);
				} else {
				}
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}

	
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
		$('<td>').attr('colspan', '2').text(petinfo.weight+'kg').appendTo(tr4);
		$('<td>').attr('colspan', '2').text(kcal + 'kcal').appendTo(tr5);
		table.append(tr1);
		table.append(tr2);
		table.append(tr3);
		table.append(tr4);
		table.append(tr5);
	}
	
	function getMedicalTable(list, tableNum, ch){
		var mtable = $('#table' + tableNum + ' tbody');
		$('tr:gt(0)', mtable).remove();
		var id = '${id }';
		var petname = $("#name option:selected").text();
		
		$(list).each(function(index, value) {
			var vaccineCode = value.vaccineCode;
			var tr = $('<tr>');
			var dDay;
			if(parseInt(value.dDay) > 0){
				dDay = '+'+Math.abs(value.dDay);
			}else {
				dDay = '-'+Math.abs(value.dDay);
			}
			var code = 0;
			if(parseInt(vaccineCode%100) < 10){
				code = parseInt(vaccineCode%10);
			}else {
				code = parseInt(vaccineCode%100);
			}
			var deleteBtn = $('<input type="button" value="삭제" class="deleteBtn" name="' + parseInt(index+1) + '" id= "delete' + ch + parseInt(index+1) + '" style="padding: 3px 3px">');
			$('<td>').html('<a>' + code + '차</a>').appendTo(tr);
			$('<td>').attr('id', ch + 'now' + parseInt(index+1)).text(value.nextday).appendTo(tr);
			$('<td>').attr('id', ch + 'next' + parseInt(index+1)).text('D' + dDay).appendTo(tr);
			$('<td>').attr('id', ch + 'day' + parseInt(index+1)).text(value.realShotDate).appendTo(tr);
			$('<td>').append(deleteBtn).appendTo(tr);
			mtable.append(tr);

			deleteBtn.on('click', function() {
				$.ajax({
					type : 'get',
					url : 'deleteMedical.do',
					data : "id=" + id + "&name=" + myPet + "&vaccineCode=" + vaccineCode,
					dataType : 'json',
					success : function(data) {
						if (data.result) {
							$("#delete" + ch + index).closest('tr').remove();
							addShotday2(tableNum, ch);
						} else {
						}
					},
					error : function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
		});
		
	}

	function addShotday2(tableNum, ch) {
		var id = '${id}';
		$.ajax({
			type : 'get',
			url : 'selectMedical.do',
			data : "id=" + id + "&name=" + myPet + "&ch=" + ch,
			dataType : "json",
			success : function(data) {
				getMedicalTable(data.careList, tableNum, ch); // 정보가져와서 테이블 만들어라
			},
			error : function(data) {
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	}
	
	function addShotday(ch, date, vGubun, nGubun, vaccineCode, nextShotday, dDay) {
		var id = '${id}';
		$.ajax({
			type : 'get',
			url : 'selectMedical.do',
			data : "id=" + id + "&name=" + myPet + "&ch=" + ch,
			dataType : "json",
			success : function(data) {
				getMedicalTable(data.careList, vGubun, ch); // 정보가져와서 테이블 만들어라
			},
			error : function(data) {
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	}
	
	function getNextDate(flag, date, ch, vGubun, nGubun, vaccineCode) {
		var tableNum = vGubun;
		$.ajax({
			type : 'get',
			url : 'calcShotday.do',
			data : "vaccineCode=" + vaccineCode + "&shotday=" + date,
			dataType : 'json',
			success : function(data) {
				if (data.nextDate != null) {
					var date = data.realDate;
					var nextDate = data.nextDate;
					$.ajax({
						type : 'get',
						url : 'calcDday.do',
						data : "nextShotday=" + nextDate,
						dataType : 'json',
						success : function(data) {
							if (data.dDay != null) {
								var dDay = data.dDay;
								if(flag == 0){
									updateShotday(ch, date, vGubun, nGubun, vaccineCode, nextDate, dDay);
								}else {
									uploadShotday(ch, date, vGubun, nGubun, vaccineCode, nextDate, dDay);
								}						
							} else {
								alert('에러');
							}
						},
						error : function(data) {
							alert('잠시 후 다시 시도해주세요');
						}
					});
				} else {
					alert('에러');
				}
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}
	
	function callPetinfo(id, name){
		$.ajax({
			type : 'get',
			url : 'selectPet.do',
			data : "id=" + id + "&name=" + name,
			dataType : "json",
			success : function(data) {
				addPetinfo(data);
			},
			error : function(data) {
				alert("잠시 후 다시 시도해주세요.");
			}
		});
	}
	
	function uploadShotday(ch, date, vGubun, nGubun, vaccineCode, nextShotday, dDay) {
		var id = '${id }';
		$.ajax({
			type : 'get',
			url : 'uploadMedical.do',
			data : "id=" + id + "&name=" + myPet + "&shotday=" + date
					+ "&vaccineCode=" + vaccineCode + "&nextShotday=" + nextShotday
					+ "&dDay=" + dDay,
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					addShotday(ch, date, vGubun, nGubun, vaccineCode, nextShotday, dDay);
					$('#' + ch + 'date').val('');
					$('#num' + vGubun).val('');
				} else {
					alert('실패');
				}
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}
	
	function updateShotday(ch, date, vGubun, nGubun, vaccineCode, nextShotday, dDay) {
		var id = '${id }';
		$.ajax({
			type : 'get',
			url : 'updateMedical.do',
			data : "id=" + id + "&name=" + myPet + "&shotday=" + date
					+ "&vaccineCode=" + vaccineCode + "&nextShotday=" + nextShotday
					+ "&dDay=" + dDay,
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					addShotday(ch, date, vGubun, nGubun, vaccineCode, nextShotday, dDay);
					$('#' + ch + 'date').val('');
					$('#num' + vGubun).val('');
				} else {
				}
			},
			error : function(data) {
				alert('잠시 후 다시 시도해주세요');
			}
		});
	}
	
	function chkDupl2(ch, vGubun, nGubun, vaccineCode){
		var id = '${id }';
		var date = $('#' + ch + 'date').val();
		$.ajax({
			type : 'get',
			url : 'chkDupl2.do',
			data : "id=" + id + "&name=" + myPet + "&vaccineCode=" + vaccineCode,
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					getNextDate(0, date, ch, vGubun, nGubun, vaccineCode); // 중복, update
				} else {
					getNextDate(1, date, ch, vGubun, nGubun, vaccineCode); 
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
			alert('날짜 형식을 확인하세요');
			return false;
		}
		return true;
	}
	
	$(document).ready(function() {

		$('.addBtn').click(function() {
			if (isPet == false) {
				alert('반려견을 선택하세요');
				return false;
			}
			// 백신 뒷자리에 있는 정보...
			var btnId = $(this).attr('id');
			var btnName = $(this).attr('name');
			var ch = btnId.substring(0,1);
			var vGubun = btnName; // 백신 이름(앞자리)대한 정보
			var nGubun = $("#num"+btnName).val(); // 백신 이름 (뒷자리) 대한 정보
			
			var vaccineCode = parseInt(vGubun*100) + parseInt(nGubun);
			var flag = chkDateFmt($('#' + ch + 'date').val());
			if(flag == true){
				chkDupl2(ch, vGubun, nGubun, vaccineCode);
			}
		});
		
		$('#name').change(function() {
			$('#petImg').attr('src', 'PetInfoImage/' + $('#name').val() + '.do');
			var name = $("#name option:selected").text();
			myPet = name;
			var id = '${id }';
			if (name == ' 선택하세요 ') {
				isPet = false;
			} else {
				isPet = true;
			}
			callPetinfo(id, name);
			addShotday2(1, 'D');
			addShotday2(2, 'C');
			addShotday2(3, 'K');
			addShotday2(4, 'R');
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

					<form method="post" action="#">
						<table cellspacing="0" name="lTable" id="lTable"
							class="shop_table cart">
							<thead>
								<tr>
									<th colspan="2" id="mypetmainimage">
										<img onerror="this.src='img/noImage.png'" alt="" width="200" height="150" id="petImg">
									</th>
								</tr>
							</thead>
							<tbody>
								<tr class="cart_item">
									<td colspan="2"><select
										class="country_to_state country_select" name="name" id="name">
											<option value="defaultValue">선택하세요</option>
											<c:forEach items="${list }" var="petinfo">
												<option value="${petinfo.fileId }">${petinfo.name }</option>
											</c:forEach>
											<input type="hidden" id="selectedPet" val="">
									</select></td>
								</tr>
							</tbody>
						</table>
				</div>

				<!-- 여기여기여기부터 -->
				<div class="col-md-8">
					<div class="product-content-right">
						<h2 class="sidebar-title">예방 접종 관리</h2>
						<p>이 홈페이지에서 안내하는 사항은 참고용입니다. 전문의와 상담 후 예방접종 일정을 조율 하십시오.</p>

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
									<p>개 홍역(Distemper), 전염성 간염(Infectious Hepatitis), 파보바이러스성
										장염(Pavovirus Enteritis), 파라인플루엔자성 기관지염(Parainflluenza) 및
										렙토스피라증(Leptospirosis) 등의 질병을 예방해주는 가장 중요한 예방접종이다.</p>
									<p>6~8주부터 시작해서 2~3주 간격으로 3~5회 접종, 매년 1회 추가접종한다. 접종 뒤 1주일간
										목욕금지.</p>
									<form method="post" action="#">
										<table cellspacing="0" class="shop_table cart" id="table1"
											name="table1">
											<thead>
												<script type="text/javascript">
													header(1)
												</script>
											</thead>
											<tbody>
												<tr id="tr1">
													<td>
														<input type="text" class="VcDate" placeholder="0"
														id="num1" style="width: 50px; height: 30px"> 차
													</td>
													<td>
													</td>
													<td></td>
													<td><input type="text" class="VcDate" placeholder="0000-00-00"
														id="Ddate" style="width: 130px; height: 35px"></td>
													<td><input type="button" value="입력" class="addBtn"
														name="1" id='Dbutton' style="padding: 3px 3px"></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>

								<div id="tab2">
									<h2>코로나 Corona Virus</h2>
									<p>코로나바이러스성 장염은 피가 섞인 설사를 하고, 구토를 하며, 열이 나고, 식욕이 없어지는 증세가
										특징.</p>
									<p>생후 6~8주부터 2~3주 간격으로 2회 접종, 매년 1회 추가접종한다.</p>

									<form method="post" action="#">
										<table cellspacing="0" class="shop_table cart" id="table2"
											name="table2">
											<thead>
												<script type="text/javascript">
													header(2)
												</script>
											</thead>
											<tbody>
												<tr id="tr2">
													<td>
														<input type="text" class="VcDate" placeholder="0"
														id="num2" style="width: 50px; height: 30px"> 차
													</td>
													<td>
													</td>
													<td></td>
													<td><input type="text" class="VcDate" placeholder="0000-00-00"
														id="Cdate" style="width: 130px; height: 35px"></td>
													<td><input type="button" value="입력" class="addBtn"
														name="2" id='Cbutton' style="padding: 3px 3px"></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>

								<div id="tab3">
									<h2>켄넬코프 Kennel Cough</h2>
									<p>주로 강아지들이 대량으로 있는 곳에서 공기를 통해 쉽게 감염되며 심한 마른기침을 일으키며 폐렴으로
										진행되기도 한다.</p>
									<p>생후 6~8주부터 2~3주 간격으로 2회 접종, 매년 1회 추가접종한다.</p>
									<form method="post" action="#">
										<table cellspacing="0" class="shop_table cart" id="table3"
											name="table3">
											<thead>
												<script type="text/javascript">
													header(3)
												</script>
											</thead>
											<tbody>
												<tr id="tr3">
													<td>
														<input type="text" class="VcDate" placeholder="0"
														id="num3" style="width: 50px; height: 30px"> 차
													</td>
													<td>
													</td>
													<td></td>
													<td><input type="text" class="VcDate" placeholder="0000-00-00"
														id="Kdate" style="width: 130px; height: 35px"></td>
													<td><input type="button" value="입력" class="addBtn"
														name="3" id='Kbutton' style="padding: 3px 3px"></td>
												</tr>
											</tbody>
										</table>
									</form>

								</div>

								<div id="tab4">
									<h2>광견병 Rabies</h2>
									<p>광견병 바이러스가 매개하는 감염증으로 광견병은 공수병이라고도 한다. 모든 온혈동물에서 발생되는
										질병으로 감염 동물로부터 교상(물리거나 할퀸 상처)을 통해 동물 및 사람에게 전파되는 중요한 인수공통전염병이다.</p>
									<p>생후 3개월 이상 된 강아지에게 1회 접종한 후 6개월 후 재접종한다. 매년 추가접종을 해야 한다</p>
									<form method="post" action="#">
										<table cellspacing="0" class="shop_table cart" id="table4"
											name="table4">
											<thead>
												<script type="text/javascript">
													header(4)
												</script>
											</thead>
											<tbody>
												<tr id="tr4">
													<td>
														<input type="text" class="VcDate" placeholder="0"
														id="num4" style="width: 50px; height: 30px"> 차
													</td>
													<td>
													</td>
													<td></td>
													<td><input type="text" class="VcDate" placeholder="0000-00-00"
														id="Rdate" style="width: 130px; height: 35px"></td>
													<td><input type="button" value="입력" class="addBtn"
														name="4" id='Rbutton' style="padding: 3px 3px"></td>
												</tr>

											</tbody>
										</table>
									</form>
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