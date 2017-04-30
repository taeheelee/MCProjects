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
	
		var isPet = false;
		var header = function header(num){
			var table = $('#table' + num + ' thead');
			var tr = $('<tr>');
			$('<th>').attr('colspan', '2').text('접종일정').appendTo(tr);
			$('<th>').text('D-day').appendTo(tr);
			$('<th>').attr('colspan', '3').text('실제접종일').appendTo(tr);
			table.append(tr);
		}	
	
		function addShotday(data, count){
			var table = $('#table' + data + ' tbody');
			var vaccineCode = data*100 + count;
			var id = '${myid }';
			var petname = $("#name option:selected").text();
			
			var tr = $('<tr>');
			var inputTxt = $('<input type="text" class="VcDate" placeholder="0000-00-00" id="ddd">');
			var updateBtn = $('<input type="button" value="입력" id="DuploadBtn6" style="padding: 4px 4px"><span id="DSpan6" value="결과">　　</span>');
			var deleteBtn = $('<input type="button" value="삭제" id="DdeleteBtn6" style="padding: 4px 4px">');
			$('<td>').attr('colspan','2').html('<a title="Remove this item" class="remove" href="#">추가접종</a>').appendTo(tr);
			$('<td>').text('추천일').appendTo(tr);
			$('<td>').text('D-day').appendTo(tr);
			$('<td>').append(inputTxt).appendTo(tr);
			$('<td>').attr('colspan','2').append(updateBtn).appendTo(tr);
			$('<td>').append(deleteBtn).appendTo(tr);
			table.append(tr);
			
			updateBtn.on('click', function(){
				$.ajax({
					url: 'uploadMedical.do',
					data: "shotday=" + inputTxt + "&vaccineCode="+vaccineCode+"&id="+id+"&petname="+petname,
					dataType: 'json',
					type: 'get',
					succescc: function(data){
						alert(data.result);
						if(data.result){
							alert('성공');
						}else {
							alert('실패');
						}
					},
					error: function(data){
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			deleteBtn.on('click', function(){
				$.ajax({
					url : 'deleteMedical.do',
					data : "vaccineCode="+vaccineCode+"&id="+id+"&name="+petname,
					dataType : 'json',
					type : 'post',
					success : function(data){
						alert(data.result);
						if(data.result){
							alert('성공');
						}else {
							alert('실패');
						}
					},
					error : function(data){
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
		}
		
		function addPetinfo(data){
			var table = $('#lTable tbody');
			var tr1 = $('<tr>');
			var tr2 = $('<tr>');
			var tr3 = $('<tr>');
			var tr4 = $('<tr>');
			var tr5 = $('<tr>');
			$('tr:gt(0)', table).remove();
			$('<td>').attr('align', 'center').attr('colspan', '2').text(data.pet.kind).appendTo(tr1);
			$('<td>').attr('align', 'center').text(data.pet.sex).appendTo(tr2);
			$('<td>').attr('align', 'center').text(data.pet.neutral).appendTo(tr2);
			$('<td>').attr('align', 'center').text("00년00개월").appendTo(tr3);
			$('<td>').attr('align', 'center').attr('colspan', '2').text(data.pet.weight).appendTo(tr4);
			$('<td>').attr('align', 'center').attr('colspan', '2').text('하루필요열량 000kcal').appendTo(tr5);
			table.append(tr1);
			table.append(tr2);
			table.append(tr3);
			table.append(tr4);
			table.append(tr5);
		}
		
		function chkDateFmt(data){
			var regDate = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			if(!regDate.test($('#DValue' + data).val())){
				alert('날짜 형식을 확인하세요');
			}
		}
		
		function createList(ch, num, code){
			var id = '${myid }';
			var shotday = $('#' + ch + 'Value' + num).val();
			var petname = $("#name option:selected").text();
			var vaccineCode = code;
			$.ajax({
				type: 'get',
				url: 'uploadMedical.do',
				data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
				dataType: 'json',
				success : function (data) {
   			    	if(data.result){
   			    		$('#' + ch + 'Span' + num).html('<font color="green">성공</font>');
   			    	}else {
   			    		$('#' + ch + 'Span' + num).html('<font color="red">실패</font>');
   			    	}
   			    },
				error: function(data) {
					alert('잠시 후 다시 시도해주세요');
				}
			});
		}
		
		$(document).ready(function(){
			
			var count = 6;
			$('.addBtn').click(function(){
				var num = $(this).attr('name');
				addShotday(num, count);
				count ++;
			});
			
			$('#name').change(function(){
				var name = $("#name option:selected").text();
				var id = '${myid }';
// 				if(pname = ' 선택하세요'){
// 					isPet = false;
// 				}else {
// 					isPet = true;
// 				}
				$.ajax({
					type: 'get',
					url: 'selectPet.do',
					data: "id="+id+"&name="+name,
					dataType: "json",
					success: function(data) {
						addPetinfo(data);
					},
					error: function(data){
						alert("잠시 후 다시 시도해주세요.");
					}
				});
			});
			
			$('.uploadBtn').click(function(){
// 				if(isPet == false){
// 					alert('반려견을 선택하세요');
// 					return false;
// 				}
				var num = $(this).attr('name');
				var btnId = $(this).attr('id');
				var ch = btnId.substring(0,1);
				var code = btnId.substring(1,4);
				chkDateFmt(num);
				createList(ch, num, code);
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
						<table cellspacing="0" name="lTable" id="lTable" class="shop_table cart">
							<thead>
								<tr>
									<th colspan="2" id="mypetmainimage">
										<img src="img/dog_04.jpg" alt="">
									</th>
								</tr>
							</thead>
							<tbody>
								<tr class="cart_item">
									<td colspan="2">
										<select class="country_to_state country_select" name="name" id="name">
                                             <option value="defaultValue"> 선택하세요 </option>
                                             <c:forEach items="${list }" var="petinfo">
                                               	<option value="${petinfo.name }">${petinfo.name }</option>
                                             </c:forEach>
                                        </select>
									</td>
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
	<li><a href="#" name="#tab3">켄넬코프  Kennel Cough</a></li>
	<li><a href="#" name="#tab4">광견병 Rabies</a></li>
</ul>
<div id="content">
	<div id="tab1" >
		<h2>종합백신 DHPPL</h2>
		<p>개 홍역(Distemper), 전염성 간염(Infectious Hepatitis), 파보바이러스성 장염(Pavovirus Enteritis), 파라인플루엔자성 기관지염(Parainflluenza) 및 렙토스피라증(Leptospirosis) 등의 질병을 예방해주는 가장 중요한 예방접종이다.</p>
		<p>6~8주부터 시작해서 2~3주 간격으e 3~5회 접종, 매년 1회 추가접종한다. 접종 뒤 1주일간 목욕금지.</p>

		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart" id="table1" name="table1">
				<thead>
					<script type="text/javascript">
						header(1)
					</script>
				</thead>
                <tbody>
                    <tr class="cart_item">
                        <td class="product-remove" rowspan="5"><a>기초접종</a>
                        <input type="button" class="addBtn" id="addBtn1" name="1" value=" + " style="padding: 1px 3px" align="right"/></td>
                     	<td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" class="VcDate" placeholder="0000-00-00" id="DValue1"></td>
                    	<td><input type="button" value="입력" class="uploadBtn" name="1" id="D101" style="padding: 3px 3px">
                    	<span id="DSpan1" value="D">　　</span></td>
                    </tr>
                    <c:forEach var="i" begin="2" end="5" step="1">
					   <tr>
	                        <td><a>${i}차</a></td>
	                        <td>추천일</td>
	                        <td>D-day</td>
	                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="DValue" + ${i}></td>
	                       	<td><input type="button" value="입력" class="uploadBtn" name="${i}" id="D10"+${i} style="padding: 3px 3px">
	                       	<span id="DSpan" + ${i} value="D">　　</span></td>
	                    </tr>
				   </c:forEach>
             
				</tbody>
			</table>
        </form>
</div>

<div id="tab2">
	<h2>코로나 Corona Virus</h2>
	<p>코로나바이러스성 장염은 피가 섞인 설사를 하고, 구토를 하며, 열이 나고, 식욕이 없어지는 증세가 특징.</p>
	<p>생후 6~8주부터 2~3주 간격으로 2회 접종, 매년 1회 추가접종한다.</p>
		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart" id="table2" name="table2">
				<thead>
					<script type="text/javascript">
						header(2)
					</script>
				</thead>
                <tbody>
                	 <tr class="cart_item">
                        <td class="product-remove" rowspan="5"><a>기초접종</a>
                        <input type="button" class="addBtn" id="addBtn2" name="2" value=" + " style="padding: 1px 3px" align="right"/></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" class="VcDate" placeholder="0000-00-00" id="CValue1"></td>
                    	<td><input type="button" value="입력" class="uploadBtn" name="1" id="C201" style="padding: 3px 3px">
                    	<span id="CSpan1" value="C">　　</span></td>
                    </tr>
                    
                   	<c:forEach var="i" begin="2" end="5" step="1">
					   <tr>
	                        <td><a>${i}차</a></td>
	                        <td>추천일</td>
	                        <td>D-day</td>
	                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="CValue" + ${i}></td>
	                       	<td><input type="button" value="입력" class="uploadBtn" name="${i}" id="C20"+${i} style="padding: 3px 3px">
	                       	<span id="CSpan" + ${i} value="C">　　</span></td>
	                    </tr>
				   </c:forEach>
				   
                </tbody>
			</table>
        </form>
</div>

<div id="tab3">
	<h2>켄넬코프  Kennel Cough</h2>
	<p>주로 강아지들이 대량으로 있는 곳에서 공기를 통해 쉽게 감염되며 심한 마른기침을 일으키며 폐렴으로 진행되기도 한다.</p>
	<p>생후 6~8주부터 2~3주 간격으로 2회 접종, 매년 1회 추가접종한다.</p>
		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart" id="table3" name="table3">
				<thead>
					<script type="text/javascript">
						header(3)
					</script>
				</thead>
                <tbody>
                 <tr class="cart_item">
                        <td class="product-remove" rowspan="5"><a>기초접종</a>
                        <input type="button" class="addBtn" id="addBtn3" name="3" value=" + " style="padding: 1px 3px" align="right"/></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" class="VcDate" placeholder="0000-00-00" id="KValue1"></td>
                    	<td><input type="button" value="입력" class="uploadBtn" name="1" id="K301" style="padding: 3px 3px">
                    	<span id="KSpan1" value="K">　　</span></td>
                    	<input type="hidden" id="1" value="1">
                    </tr>
                    <c:forEach var="i" begin="2" end="5" step="1">
					   <tr>
	                        <td><a>${i}차</a></td>
	                        <td>추천일</td>
	                        <td>D-day</td>
	                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="KValue" + ${i}></td>
	                       	<td><input type="button" value="입력" class="uploadBtn" name="${i}" id="K30"+${i} style="padding: 3px 3px">
	                       	<span id="KSpan" + ${i} value="K">　　</span></td>
	                    </tr>
				   </c:forEach>
				  
                </tbody>
			</table>
        </form>

</div>

<div id="tab4">
	<h2>광견병 Rabies</h2>
	<p>광견병 바이러스가 매개하는 감염증으로 광견병은 공수병이라고도 한다. 모든 온혈동물에서 발생되는 질병으로 감염 동물로부터 교상(물리거나 할퀸 상처)을 통해 동물 및 사람에게 전파되는 중요한 인수공통전염병이다.</p>
	<p>생후 3개월 이상 된 강아지에게 1회 접종한 후 6개월 후 재접종한다. 매년 추가접종을 해야 한다</p>
		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart" id="table4" name="table4">
				<thead>
					<script type="text/javascript">
						header(4)
					</script>
				</thead>
                <tbody>
                     <tr class="cart_item">
                        <td class="product-remove" rowspan="5"><a>기초접종</a>
                        <input type="button" class="addBtn" id="addBtn4" name="4" value=" + " style="padding: 1px 3px" align="right"/></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" class="VcDate" placeholder="0000-00-00" id="RValue1"></td>
                    	<td><input type="button" value="입력" class="uploadBtn" name="1" id="R401" style="padding: 3px 3px">
                    	<span id="RSpan1" value="R">　　</span></td>
                    </tr>
                    <c:forEach var="i" begin="2" end="5" step="1">
					   <tr>
	                        <td><a>${i}차</a></td>
	                        <td>추천일</td>
	                        <td>D-day</td>
	                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="RValue" + ${i}></td>
	                       	<td><input type="button" value="입력" class="uploadBtn" name="${i}" id="R40"+${i} style="padding: 3px 3px">
	                       	<span id="RSpan" + ${i} value="R">　　</span></td>
	                    </tr>
				   </c:forEach>
                    
                </tbody>
			</table>
        </form>
</div>
</div><!-- tab end -->
                        
          
                        </div>                 
                    </div>                    
                </div>
            </div>
        </div>
    </div>

  

  </body>
</html>