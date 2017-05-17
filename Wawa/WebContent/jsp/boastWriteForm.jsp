<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
<script type="text/javascript" src="js/boardCheck.js"></script>
<script type="text/javascript">
function boastBoardCheck() {
	if ($('#name').val().replace(/ /gi, "") == "") {
		alert("애견이름을 입력해주세요");
		$('#name').focus();
		return false;
	}
	if ($('#age').val().replace(/ /gi, "") == "") {
		alert("나이를 입력해주세요");
		$('#age').focus();
		return false;
	}
	var age = $('#age').val().match(/[^0-9]/g);
	if (age == null) {
		alert("나이는 숫자로 입력해주세요");
		$('#age').focus();
		return false;
	}
	if ($.isNumeric($('#age').val()) == false) {
		alert("나이는 숫자로 입력해주세요");
		$('#age').focus();
		return false;
	}
	if ($('#title').val().replace(/ /gi, "") == "") {
		alert("제목을 입력해주세요");
		$('#title').focus();
		return false;
	}
	var content = $('#summernote').summernote('code');
	$('#content').val(content);
	if (content == "<p><br></p>") {
		alert("내용을 입력해주세요");
		return false;
	}
	return true;
}
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
				
			var year = '${pet.birthday}'.split('-');
			var now = new Date().getFullYear();
			var age = now - year[0];
			$('#age').val(age);
				
			$('#sex[value=${pet.sex}]').attr('checked', true);
			$('#sex[value!=${pet.sex}]').attr('checked', false);

			$('#kind > option[value="${pet.kind}"]').attr('selected', true);
		}
		});
	</script>
</head>
<body>


	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-left">
						<h2>뽐내기</h2>
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
									<h2 class="sidebar-title">뽐내기 후보 등록하기</h2>
									<div class="woocommerce-billing-fields">
										<div class="form-row place-order" style="float: right">
											<input type="button" id="petinfo" onclick="window.open('boastGetPetinfoForm.do?id=${sessionScope.id}&boardIdx=0&boardCode=3&type=Write', 'pet' ,'left=400, top=200, width=500, height=300')" value="애견정보 불러오기" />
											<span id="petList"></span>
										</div>


										<form action="boastWrite.do" enctype="multipart/form-data" class="checkout" method="POST" name="checkout">
											<input type="hidden" name="content" id="content">
											<input type="hidden" name="boardCode" value="3">
											<input type="hidden" name="writer" value="${sessionScope.name}">
											
											<label class="" for="billing_state">애견 이름<abbr title="required" class="required">*</abbr></label>
											<input type="text" id="name" name="name" placeholder="" value="" class="input-text " maxlength="20">

											<br><br>
											<label class="" for="billing_state">나이<abbr title="required" class="required">*</abbr></label>
											<input type="text" id="age" name="age" placeholder="" value="" class="input-text " maxlength="10">

											<br><br>

											<label class="" for="billing_first_name">성별 <abbr title="required" class="required">*</abbr></label>
											<div id="payment">
												<ul class="payment_methods methods">
													<li class="payment_method_paypal">
														<input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio" id="sex" checked="checked"> 수컷
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio" id="sex"> 암컷
													</li>
												</ul>
											</div>

											<br>

											<label class="" for="billing_country">품종 <abbr title="required" class="required">*</abbr>
											</label>
											<select class="country_to_state country_select" id="kind" name="kind">
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
                                                </select>
                                                
                                                <br><br>

											<label class="" for="billing_first_name">애견 프로필 사진 등록</label>
											<table>
												<tr>
													<td width="10%">
														<div class="file_input_div">
															<input type="button" value="파일 선택" class="file_input_button"/>
															<input type="file" name="ufile" class="file_input_hidden" onchange="javascript:document.getElementById('fileName').value = this.value" />
														</div>
													</td>
													<td width="90%">
														<input type="text" id="fileName" class="file_input_textbox" readonly="readonly" style="border: 0px;">
													</td>
												</tr>
											</table>

											<label class="" for="billing_state">글 제목<abbr title="required" class="required">*</abbr></label>
											<input type="text" id="title" name="title" placeholder="" value="" class="input-text " maxlength="20">

											<br>

											<div style="width: 100%; margin: 0 auto;">
												<div id="summernote"></div>
											</div>
											<br>

											<br>
											
											<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="WRITE" id="ok" name="woocommerce_checkout_place_order" class="button alt" onclick="return boastBoardCheck()">
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



</body>
</html>