<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script
  	src="https://code.jquery.com/jquery-2.2.4.min.js"
  	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
 	crossorigin="anonymous"></script>
    <link href="tabstyle.css" rel="stylesheet">
    
    <!--  JQuery -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
 	<!-- summernote -->
	<link rel="stylesheet" href="summernote/dist/summernote.css">
    <script src="summernote/dist/summernote.js"></script>
	<script src="summernote/dist/summernote.min.js"></script>
<!-- 	<script src="summernote/dist/lang/summernote-ko-KR.js"></script> -->
	

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function(){
		$('.postLink').click(function() {
		    var p = $(this).attr('href').split('?');
		    var action = p[0];
		    var params = p[1].split('&');
		    var form = $(document.createElement('form')).attr('action', action).attr('method','post');
		    $('body').append(form);
		    for (var i in params) {
		        var tmp= params[i].split('=');
		        var key = tmp[0], value = tmp[1];
		        $(document.createElement('input')).attr('type', 'hidden').attr('name', key).attr('value', value).appendTo(form);
		    }
		    $(form).submit();
		    return false;
		});
		
		if(${sessionScope.petName != null}){
	         
			//태어난지 몇년 몇개월 됬는지 계산하기
			         
			          var petBirth = "${sessionScope.petBirth}";//생일을 받아온다
			          var today = new Date();//오늘날짜

			          var arrPetBirth = petBirth.split('-');
			          var PetBirthDateForm = new Date(arrPetBirth[0], arrPetBirth[1]-1, arrPetBirth[2]);

			          // 날짜 차이 알아 내기
			          var diff = today - PetBirthDateForm; //날짜 빼면?!?!?
			          var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
			          var countDay =  parseInt(diff/currDay); //태어난지 몇일째인지
			          var countYear = parseInt(countDay/365); //몇년
			          var countMonth = parseInt((countDay- countYear*365) /12);//몇개월
			         
			          //그럼 이제 화면 출력을 바꿔볼까요?!
			          var petage_year = document.getElementById('petage_year');
			          var petage_month = document.getElementById('petage_month');
			          if(countYear != 0){
			               petage_year.innerHTML = countYear+"년";
			            }
			         if(countMonth != 0){
			               petage_month.innerHTML = countMonth+"개월";
			            }
			      
			//미용 예정일 계산하기
			         //1.D-day 구하기 : 미용알림시작일 + 미용 알림 주기 - 오늘 날짜
			         var groomingStart = "${sessionScope.groomingStart}";
			         var groomingPeriod = "${sessionScope.groomingPeriod}";
			         var d_day="";
			         var arrgroomingStart = groomingStart.split('-');
			         var groomingStartDateForm = new Date(arrgroomingStart[0], arrgroomingStart[1]-1, arrgroomingStart[2]);
			            
			         if(groomingStart == null || groomingPeriod == 0){
			            d_day="미설정";
			         }
			         
			         else{
			            var diffGrooming = groomingStartDateForm - today;
			            var countday = parseInt(diffGrooming/currDay);
			            var groomingPeriodInt = parseInt(groomingPeriod);
			            var dDay = countday + groomingPeriodInt;
			            d_day = "D-" + dDay;
			            
			            if(dDay == "0"){//디데이일때
			               d_day = "D-DAY";
			            }

//			             //2. D-day 가 마이너스가 되면, 미용알림시작일 += 미용 알림 주기
			            if(dDay < 0){
			            var multiple = (parseInt( dDay/groomingPeriodInt))*-1+1;
			            dDay += multiple *groomingPeriodInt
			            d_day = "D-" + dDay;      
			             } 

			          
			         }
			         
			         //그럼 이제 화면 출력을 바꿔볼까요?!
			          var grooming_dDay = document.getElementById('grooming_dDay');

			          grooming_dDay.innerHTML = d_day;

			      }
			
	});
	
	
</script>

</head>
<body>


<div class="header-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="user-menu">
					<ul>
						
						<c:choose>
							<c:when test="${sessionScope.id != null}">
								<li><a href="logout.do"><i class="fa fa-user"></i> Logout</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="joinForm.do"><i class="fa fa-heart"></i> Join us</a></li>
								<li><a href="loginForm.do"><i class="fa fa-user"></i> Login</a></li>
							</c:otherwise>
						</c:choose>
					</ul>	
				</div>
			</div>
		</div>
	</div>
</div> <!-- End header area -->
    
    
    
<!-- 좌측 로고 및 우측 미니애견정보창 영역(하얀색 부분) -->
<div class="site-branding-area">
	<div class="container">
		<div class="row">
			<!--좌측 로고 -->
			<div class="col-sm-6">
				<div class="logo">
					<h1><a href="main.do"><img src="img/paw-print.png" id="paw-print"><span>WAWA!</span></a></h1>
				</div>
			</div>
			<!-- 우측 미니애견정보창 -->
			<div class="col-sm-6" style="margin: 0">
			<c:choose>
				<c:when test="${sessionScope.id != null and sessionScope.petName != null}">
					<div class="shopping-item" >
						<a href="myPetInfo.do?id=${sessionScope.id}"  >
						
							<table id="mini" style="margin-left: 5px;width:330px; height: 100px;">
								<tr>
									<td rowspan="4" style="width: 90px;" id="petmainimage">
									<div class="circular" style="margin-right: 10px;">
										<img src="PetInfoImage/${sessionScope.fileId }.do" onerror="this.src='img/noImage.png'" ></td>
									</div>
									<td colspan="3" id="nickname">${sessionScope.name}</td>
								</tr>
								<tr style="font-size: small;">
									<td id="petname"><b style="font-size: 14px;">${sessionScope.petName}</b></td>
									<td id="petsex">${sessionScope.petSex}</td>
									<td id="petage"><span id="petage_year"></span> <span id="petage_month"></span></td>
								</tr>
								<tr style="font-size: small;">
									<td colspan="2">다음 예방접종</td>
									<td id="dday" style="text-align: center;">D-00</td>
								</tr>
								<tr style="font-size: small;">
									<td colspan="2">다음 미용예정</td>
                           <td id="" style="text-align: center;"><span id="grooming_dDay"></span></td>
								</tr>
							</table>
						</a>
					</div>
				</c:when>
				<c:when test="${sessionScope.id != null}">
					<div class="shopping-item" >
		               <a href="addPetForm.do?id=${sessionScope.id}"  class="postLink">
		                  <table id="mini" style="margin-left: 5px;width:330px; height: 100px;">
		                     <tr>
		                        <td style="width: 90px;" id="petmainimage">
		                        <img src="img/paw-print.png" style="width: 80px;height: 80px"></td>
		                        <td >펫 추가하기</td>
		                     </tr>
		                     
		                  </table>
		               </a>
            		</div>
				</c:when>
			</c:choose>
		</div>
			
		</div>
	</div>
</div> <!-- End site branding area -->






<!-- 메뉴바   -->
<div class="mainmenu-area">
	<div class="container">
		<div class="row">
 			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div> 
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="main.do">HOME</a></li>
					<li><a href="userinfoForm.do">내정보</a></li>
					<li class="dropdown">
						<a href="single-product.html" class="dropdown-toggle" data-toggle="dropdown">나의펫 <b class="caret"></b></a>
	                    <ul class="dropdown-menu">
							<li><a href="myPetInfo.do?id=${sessionScope.id}" >나의 펫 정보</a></li>
							<li><a href="healthcare.do?id=${sessionScope.id}" >나의 펫 헬스케어</a></li>
							<li><a href="medicalcareForm.do?id=${sessionScope.id}" >나의 펫 메디컬케어</a></li>		
	                    </ul>
					</li>
					<li><a href="infoMain.do?id=${sessionScope.id}">애견정보/상식</a></li>
					<li><a href="reviewMain.do">제품리뷰</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="boastMain.do">뽐내기</a></li>
							<li><a href="lostMain.do">유기견찾기</a></li>
							<li><a href="partnerMain.do">짝꿍찾기</a></li>
							<li><a href="freeboardMain.do">자유게시판</a></li>	                            
						</ul>
					</li>                            
					<li><a href="search.do?"  class="postLink">위치정보</a></li>
				</ul>
			</div>  
		</div>
	</div>
</div> <!-- End mainmenu area -->


</body>
</html>