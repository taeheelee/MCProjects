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
		
		function addShotday(data){
			var table = $('#table1 tbody');
			var tr = $('<tr>');
			$('<td>').text().appendTo(tr);
			$('<td>').text('추천일').appendTo(tr);
			$('<td>').text('D-day').appendTo(tr);
			$('<td>').text().appendTo(tr);
			$('<td>').text().appendTo(tr);
			$('<td>').text().appendTo(tr);
			$('<td>').text().appendTo(tr);
			table.append(tr);
		}
	
		$(document).ready(function(){
			
			var count = 0;
			$('#addBtn1').click(function(){
				var table = $('#table1 tbody');
				var row="<tr>"; 
				row += "<td class=\"\"colspan=\"2\"><a title=\"Remove this item\" class=\"remove\" href=\"#\">추가접종</a></td>";
				row += "<td>추천일</td>";
				row += "<td>D-day</td>"; 
				row += "<td><input type=\"text\" class=\"VcDate\" placeholder=\"0000-00-00\" id=\"ddd" + count + "\"></td>";
				row += "<td><input type=\"button\" value=\"입력\" id=\"DuploadBtn6\" style=\"padding: 4px 4px\">"; 
				row += "<span id=\"DSpan6\" value=\"결과\">　　</span></td>";
				row += "</tr>";
				table.append(row);
				alert(count);
				count ++;
				//$('tr:gt(0)', table).remove();
			});
			 
			$('#addBtn2').click(function(){
				var table = $('#table2 tbody');
				var row="<tr>"; 
				row += "<td class=\"\"colspan=\"2\"><a title=\"Remove this item\" class=\"remove\" href=\"#\">추가접종</a></td>";
				row += "<td>추천일</td>";
				row += "<td>D-day</td>"; 
				row += "<td><input type=\"text\" class=\"VcDate\" placeholder=\"0000-00-00\" id=\"DValue6\"></td>";
				row += "<td><input type=\"button\" value=\"입력\" id=\"DuploadBtn6\" style=\"padding: 4px 4px\">"; 
				row += "<span id=\"DSpan6\" value=\"결과\">　　</span></td>";
				row += "</tr>";
				table.append(row);
				//$('tr:gt(0)', table).remove();
			});
			
			$('#addBtn3').click(function(){
				var table = $('#table3 tbody');
				var row="<tr>"; 
				row += "<td class=\"\"colspan=\"2\"><a title=\"Remove this item\" class=\"remove\" href=\"#\">추가접종</a></td>";
				row += "<td>추천일</td>";
				row += "<td>D-day</td>"; 
				row += "<td><input type=\"text\" class=\"VcDate\" placeholder=\"0000-00-00\" id=\"DValue6\"></td>";
				row += "<td><input type=\"button\" value=\"입력\" id=\"DuploadBtn6\" style=\"padding: 4px 4px\">"; 
				row += "<span id=\"DSpan6\" value=\"결과\">　　</span></td>";
				row += "</tr>";
				table.append(row);
				//$('tr:gt(0)', table).remove();
			});
			
			$('#addBtn4').click(function(){
				var table = $('#table4 tbody');
				var row="<tr>"; 
				row += "<td class=\"\"colspan=\"2\"><a title=\"Remove this item\" class=\"remove\" href=\"#\">추가접종</a></td>";
				row += "<td>추천일</td>";
				row += "<td>D-day</td>"; 
				row += "<td><input type=\"text\" class=\"VcDate\" placeholder=\"0000-00-00\" id=\"DValue6\"></td>";
				row += "<td><input type=\"button\" value=\"입력\" id=\"DuploadBtn6\" style=\"padding: 4px 4px\">"; 
				row += "<span id=\"DSpan6\" value=\"결과\">　　</span></td>";
				row += "</tr>";
				table.append(row);
				//$('tr:gt(0)', table).remove();
			});
			
			$('#name').change(function(){
				var name = $("#name option:selected").text();
				var id = '${myid }';
				
				$.ajax({
					type: 'get',
					url: 'selectPet.do',
					data: "id="+id+"&name="+name,
					dataType: "json",
					success: function(data) {
// 						alert(data.pet.kind);
						var table = $('#lTable tbody');
						$('tr:gt(0)', table).remove();
						var row="<tr>"; 
						row += "<td align=\"center\" colspan=\"2\" id=\"kind\">" + data.pet.kind +"</td>";
						row += "</tr>";
						row += "<tr>";
						row += "<td align=\"center\" id=\"petsex\">" + data.pet.sex + "</td>";
						row += "<td align=\"center\" id=\"neutral\">" + data.pet.neutral + "</td>"; 
						row += "</tr>";
						row += "<tr>";
						row += "<td align=\"center\" colspan=\"2\" id=\"age\">00년00개월</td>"; 
						row += "</tr>";
						row += "<tr>";
						row += "<td align=\"center\" colspan=\"2\" id=\"weight\">" + data.pet.weight + "</td>"; 
						row += "</tr>";
						row += "<tr>";
						row += "<td align=\"center\" colspan=\"2\" id=\"caloriesbyday\">하루필요열량 000kcal</td>"; 
						row += "</tr>";
						table.append(row);
					},
					error: function(data){
						alert("잠시 후 다시 시도해주세요.");
					}
				});
			});
			
			var regDate = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
				
			$('#DuploadBtn1').click(function(){
				
				if(!regDate.test($('#DValue1').val())){
						alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#DValue1').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 101;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#DSpan1').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#DSpan1').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#DuploadBtn2').click(function(){
				
				if(!regDate.test($('#DValue2').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#DValue2').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 102;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#DSpan2').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#DSpan2').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#DuploadBtn3').click(function(){
			
				if(!regDate.test($('#DValue3').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#DValue3').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 103;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#DSpan3').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#DSpan3').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#DuploadBtn4').click(function(){
				
				if(!regDate.test($('#DValue4').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#DValue4').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 104;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#DSpan4').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#DSpan4').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#DuploadBtn5').click(function(){
				
				if(!regDate.test($('#DValue5').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#DValue5').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 105;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#DSpan5').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#DSpan5').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#CuploadBtn1').click(function(){
				
				if(!regDate.test($('#CValue1').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#CValue1').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 201;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
// 	   			    	alert(data.result);
	   			    	if(data.result){
	   			    		$('#CSpan1').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#CSpan1').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#CuploadBtn2').click(function(){
				
				if(!regDate.test($('#CValue2').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#CValue2').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 202;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#CSpan2').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#CSpan2').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#CuploadBtn3').click(function(){
				
				if(!regDate.test($('#CValue3').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#CValue3').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 203;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#CSpan3').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#CSpan3').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#CuploadBtn4').click(function(){
				
				if(!regDate.test($('#CValue4').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#CValue4').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 204;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#CSpan4').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#CSpan4').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#CuploadBtn5').click(function(){
				
				if(!regDate.test($('#CValue5').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#CValue5').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 205;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#CSpan5').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#CSpan5').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#KuploadBtn1').click(function(){
				
				if(!regDate.test($('#KValue1').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#KValue1').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 301;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#KSpan1').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#KSpan1').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#KuploadBtn2').click(function(){
				
				if(!regDate.test($('#KValue2').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#KValue2').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 302;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#KSpan2').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#KSpan2').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#KuploadBtn3').click(function(){
				
				if(!regDate.test($('#KValue3').val())){
					alert('날짜 형식을 확인하세요');
				}
					
				var id = '${myid }';
				var shotday = $('#KValue3').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 303;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#KSpan3').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#KSpan3').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#KuploadBtn4').click(function(){
				
				if(!regDate.test($('#KValue4').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#KValue4').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 304;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#KSpan4').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#KSpan4').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#KuploadBtn5').click(function(){
				
				if(!regDate.test($('#KValue5').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#KValue5').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 305;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#KSpan5').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#KSpan5').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#RuploadBtn1').click(function(){
				
				if(!regDate.test($('#RValue1').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#RValue1').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 401;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#RSpan1').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#RSpan1').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			
			$('#RuploadBtn2').click(function(){
				
				if(!regDate.test($('#RValue2').val())){
					alert('날짜 형식을 확인하세요');
				}	
				
				var id = '${myid }';
				var shotday = $('#RValue2').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 402;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#RSpan2').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#RSpan2').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#RuploadBtn3').click(function(){
				
				if(!regDate.test($('#RValue3').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#RValue3').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 403;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#RSpan3').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#RSpan3').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#RuploadBtn4').click(function(){
				
				if(!regDate.test($('#RValue4').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#RValue4').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 404;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#RSpan4').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#RSpan4').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
			});
			
			$('#RuploadBtn5').click(function(){
				
				if(!regDate.test($('#RValue5').val())){
					alert('날짜 형식을 확인하세요');
				}
				
				var id = '${myid }';
				var shotday = $('#RValue5').val();
				var petname = $("#name option:selected").text();
				var vaccineCode = 405;
				$.ajax({
					type: 'get',
					url: 'uploadMedical.do',
					data: "id="+id+"&petname="+petname+"&shotday="+shotday+"&vaccineCode="+vaccineCode,
					dataType: 'json',
					success : function (data) {
	   			    	if(data.result){
	   			    		$('#RSpan5').html('<font color="green">성공</font>');
	   			    	}else {
	   			    		$('#RSpan5').text('<font color="red">실패</font>');
	   			    	}
	   			    },
					error: function(data) {
						alert('잠시 후 다시 시도해주세요');
					}
				});
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
		
<!-- 		<span style="float:right"><input type="button" id="addBtn1" value="추가" style="padding: 3px 3px" align="right"/></span> -->
<!-- 		<br> -->
<!-- 		<br> -->
		<form method="post" action="#">
		
			<table cellspacing="0" class="shop_table cart" id="table1" name="table1">
				<thead>
					<tr>
						<th colspan="2">접종일정</th>
                        <th>접종예정일</th>
                        <th>D-day</th>
                        <th colspan="2">실제접종일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="cart_item">
                        <td class="product-remove" rowspan="5"><a>기초접종</a>
                        <input type="button" id="addBtn1" value=" + " style="padding: 1px 3px" align="right"/></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" class="VcDate" placeholder="0000-00-00" id="DValue1"></td>
                    	<td><input type="button" value="입력" id="DuploadBtn1" style="padding: 3px 3px">
                    	<span id="DSpan1" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>2차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="DValue2"></td>
                       	<td><input type="button" value="입력" id="DuploadBtn2" style="padding: 3px 3px">
                       	<span id="DSpan2" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>3차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="DValue3"></td>
                        <td><input type="button" value="입력" id="DuploadBtn3" style="padding: 3px 3px">
                        <span id="DSpan3" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>4차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="DValue4"></td>
                        <td><input type="button" value="입력" id="DuploadBtn4" style="padding: 3px 3px">
                        <span id="DSpan4" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>5차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="DValue5"></td>
                        <td><input type="button" value="입력" id="DuploadBtn5" style="padding: 3px 3px">
                        <span id="DSpan5" value="결과">　　</span></td>
                    </tr>
             
                    
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
					<tr>
						<th colspan="2">접종일정</th>
                        <th>접종예정일</th>
                        <th>D-day</th>
                        <th colspan="2">실제접종일</th>
                    </tr>
                </thead>
                <tbody>
                	 <tr class="cart_item">
                        <td class="product-remove" rowspan="5"><a>기초접종</a>
                        <input type="button" id="addBtn2" value=" + " style="padding: 1px 3px" align="right"/></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" class="VcDate" placeholder="0000-00-00" id="CValue1"></td>
                    	<td><input type="button" value="입력" id="CuploadBtn1" style="padding: 3px 3px">
                    	<span id="CSpan1" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>2차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="CValue2"></td>
                       	<td><input type="button" value="입력" id="CuploadBtn2" style="padding: 4px 4px">
                       	<span id="CSpan2" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>3차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="CValue3"></td>
                        <td><input type="button" value="입력" id="CuploadBtn3" style="padding: 4px 4px">
                        <span id="CSpan3" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>4차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="CValue4"></td>
                        <td><input type="button" value="입력" id="CuploadBtn4" style="padding: 3px 3px">
                        <span id="CSpan4" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>5차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="CValue5"></td>
                        <td><input type="button" value="입력" id="CuploadBtn5" style="padding: 3px 3px">
                        <span id="CSpan5" value="결과">　　</span></td>
                    </tr>
                   
                    
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
					<tr>
						<th colspan="2">접종일정</th>
                        <th>접종예정일</th>
                        <th>D-day</th>
                        <th colspan="2">실제접종일</th>
                    </tr>
                </thead>
                <tbody>
                
                 <tr class="cart_item">
                        <td class="product-remove" rowspan="5"><a>기초접종</a>
                        <input type="button" id="addBtn3" value=" + " style="padding: 1px 3px" align="right"/></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" class="VcDate" placeholder="0000-00-00" id="KValue1"></td>
                    	<td><input type="button" value="입력" id="KuploadBtn1" style="padding: 3px 3px">
                    	<span id="KSpan1" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>2차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="KValue2"></td>
                       	<td><input type="button" value="입력" id="KuploadBtn2" style="padding: 3px 3px">
                       	<span id="KSpan2" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>3차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="KValue3"></td>
                        <td><input type="button" value="입력" id="KuploadBtn3" style="padding: 3px 3px">
                        <span id="KSpan3" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>4차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="KValue4"></td>
                        <td><input type="button" value="입력" id="KuploadBtn4" style="padding: 4px 4px">
                        <span id="KSpan4" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>5차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="KValue5"></td>
                        <td><input type="button" value="입력" id="KuploadBtn5" style="padding: 4px 4px">
                        <span id="KSpan5" value="결과">　　</span></td>
                    </tr>
                    
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
					<tr>
						<th colspan="2">접종일정</th>
                        <th>접종예정일</th>
                        <th>D-day</th>
                        <th colspan="2">실제접종일</th>
                    </tr>
                </thead>
                <tbody>
                     <tr class="cart_item">
                        <td class="product-remove" rowspan="5"><a>기초접종</a>
                        <input type="button" id="addBtn4" value=" + " style="padding: 1px 3px" align="right"/></td>
                        <td><a>1차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
    					<td><input type="text" class="VcDate" placeholder="0000-00-00" id="RValue1"></td>
                    	<td><input type="button" value="입력" id="RuploadBtn1" style="padding: 3px 3px">
                    	<span id="RSpan1" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>2차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="RValue2"></td>
                       	<td><input type="button" value="입력" id="RuploadBtn2" style="padding: 3px 3px">
                       	<span id="RSpan2" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>3차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="RValue3"></td>
                        <td><input type="button" value="입력" id="RuploadBtn3" style="padding: 3px 3px">
                        <span id="RSpan3" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>4차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="RValue4"></td>
                        <td><input type="button" value="입력" id="RuploadBtn4" style="padding: 3px 3px">
                        <span id="RSpan4" value="결과">　　</span></td>
                    </tr>
                    <tr>
                        <td><a>5차</a></td>
                        <td>추천일</td>
                        <td>D-day</td>
                        <td><input type="text" class="VcDate" placeholder="0000-00-00" id="RValue5"></td>
                        <td><input type="button" value="입력" id="RuploadBtn5" style="padding: 3px 3px">
                        <span id="RSpan5" value="결과">　　</span></td>
                    </tr>
                    
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