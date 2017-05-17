<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/boardCheck.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500,
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i],  editor, welEditable);
					}
				}
			}
		});
		
		$("#age").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
        });
		 $("#age").blur(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
        });
		
		$('#ok').click(function() {
			var content = $('#summernote').summernote('code');
			$('#content').val(content);	
		});

		if(${load != 0}){
			$('#name').val('${pet.name}');
			$('#resist').val('${pet.resist}')
			var year = '${pet.birthday}'.split('-');
			var now = new Date().getFullYear();
			var age = now - year[0];
			$('#age').val(age);
				
			$('#sex[value=${pet.sex}]').attr('checked', true);
			$('#sex[value!=${pet.sex}]').attr('checked', false);
				
			$('#weight').val('${pet.weight}');
			$('#kind > option[value="${pet.kind}"]').attr('selected', true);
		}
		else{
			$('#kind > option[value="${board.kind}"]').attr('selected', true);		
		}
	});
</script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="summernote/dist/summernote.css">
<script src="summernote/dist/summernote.js"></script>
<script src="summernote/dist/summernote.min.js"></script>
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
						<h2>유기견 찾기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="single-product-area">

		<div class="container">


			<div class="col-md-55">



				<form action="lostUpdate.do" enctype="multipart/form-data"
					class="checkout" method="post" name="checkout">
					<input type="hidden" name="boardIdx" value="${board.boardIdx }">
					<input type="hidden" name="content" id="content"> <input
						type="hidden" name="boardCode" value="4"> <input
						type="hidden" name="writer" value="${sessionScope.name }">

					<div id="customer_details" class="col2-set">
						<div class="col-3">
							<h2 class="sidebar-title">글쓰기</h2>
							<div class="woocommerce-billing-fields">

								<div class="form-row place-order" style="float: right">
									<input type="button" id="petinfo"
										onclick="window.open('lostGetPetinfoForm.do?id=${sessionScope.id}&boardIdx=${board.boardIdx }&boardCode=4&type=Update', 'pet' ,'left=400, top=200, width=500, height=300')"
										value="애견정보 불러오기" />
								</div>

								<label class="" for="billing_state">애견 이름</label> <input
									type="text" id="name" name="name" placeholder=""
									value="${board.name }" class="input-text " maxlength="20">

								<br> <br> <label class="" for="billing_state">등록번호</label>
								<input type="text" id="resist" name="resist"
									placeholder="15자리 숫자로 입력해주세요" value="${board.resist }"
									class="input-text " maxlength="15"> <br> <br>

								<label class="" for="billing_country">품종 <abbr
									title="required" class="required">*</abbr>
								</label> <select class="country_to_state country_select" id="kind"
									name="kind">
									<c:forEach var="kindList" items="${kindList }" varStatus="idx">
										<c:choose>
											<c:when test="${kindList.kind =='기타 소형견' }">
												<option selected="selected" value="${kindList.kind }">${kindList.kind }</option>
											</c:when>
											<c:otherwise>
												<option value="${kindList.kind }">${kindList.kind }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>

								</select> <br>
								<br> <label class="" for="billing_first_name">성별 <abbr
									title="required" class="required">*</abbr></label>
								<div id="payment">
									<ul class="payment_methods methods">
										<li class="payment_method_paypal"><c:if
												test="${board.sex == '수컷' }">
												<input type="radio"
													data-order_button_text="Proceed to PayPal" value="male"
													name="sex" class="input-radio" id="sex" checked="checked"> 수컷
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio"
													data-order_button_text="Proceed to PayPal" value="female"
													name="sex" class="input-radio" id="sex"> 암컷
										</c:if> <c:if test="${board.sex == '암컷' }">
												<input type="radio"
													data-order_button_text="Proceed to PayPal" value="male"
													name="sex" class="input-radio" id="sex"> 수컷
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" data-order_button_text="Proceed to PayPal"
													value="female" name="sex" class="input-radio" id="sex"
													checked="checked"> 암컷
									</c:if></li>
									</ul>
								</div>

								<br> <label class="" for="billing_state">나이</label> <input
									type="text" id="age" name="age" placeholder=""
									value="${board.age }" class="input-text " maxlength="10">

								<br> <br> <label class="" for="billing_state">몸무게(kg)</label>
								<input type="text" id="weight" name="weight" placeholder=""
									value="${board.weight }" class="input-text " maxlength="10">

								<br> <br> <label class="" for="billing_country">카테고리
									<abbr title="required" class="required">*</abbr>
								</label> <select class="country_to_state country_select"
									id="billing_country" name="category">
									<c:if test="${board.category == '찾고있어요'}">
										<option selected="selected" value="find">찾고있어요</option>
										<option value="protect">보호중입니다</option>
									</c:if>
									<c:if test="${board.category == '보호중입니다' }">
										<option value="find">찾고있어요</option>
										<option selected="selected" value="protect">보호중입니다</option>
									</c:if>
								</select> <br> <label class="" for="billing_state"> 잃어버린 날짜/
									발견된 날짜</label> <input type="text" id="lostdate" name="lostdate"
									placeholder="0000-00-00" value="${board.lostDate }"
									class="datepicker" maxlength="10"> <br> <br>
								<label class="" for="billing_state"> 잃어버린 장소/ 발견된 장소</label> <input
									type="text" id="lostplace" name="lostplace"
									value="${board.lostPlace }" class="input-text " maxlength="30">

								<br> <br> <label class="" for="billing_state">연락처</label>
								<input type="text" id="phone" name="phone" placeholder=""
									value="${board.phone }" class="input-text " maxlength="13">

								<br> <br> <label class="" for="billing_state">e-mail</label>
								<input type="text" id="email" name="email" placeholder=""
									value="${board.email }" class="input-text " maxlength="30">

								<br> <br> <label class="" for="billing_first_name">애견
									프로필 사진 등록<abbr title="required" class="required">*</abbr>
								</label>
								<table border="0">
									<tr>
										<td width="10%">
											<div class="file_input_div">
												<input type="button" value="파일 선택" class="file_input_button" />
												<input type="file" name="ufile" class="file_input_hidden"
													onchange="javascript:document.getElementById('fileName').value = this.value" />
											</div>
										</td>
										<td width="90%"><input type="text" id="fileName"
											class="file_input_textbox" readonly="readonly"
											style="border: 0px;"></td>
									</tr>
								</table>
								<br> <label class="" for="billing_state">글 제목</label> <input
									type="text" id="title" name="title" placeholder=""
									value="${board.title }" class="input-text " maxlength="20">

								<br>




								<div style="width: 100%; margin: 0 auto;">
									<div id="summernote">${board.content }</div>
								</div>
								<br>

								<!--<div class="clear"></div> -->


								<div class="form-row place-order" style="float: right">
									<input type="submit" data-value="Place order" value="WRITE"
										id="ok" name="woocommerce_checkout_place_order"
										class="button alt" onclick="return lostBoardCheck()">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



	<!-- Bootstrap JS form CDN -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- jQuery sticky menu -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>

	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- Main Script -->
	<script src="js/main.js"></script>
</body>
</html>