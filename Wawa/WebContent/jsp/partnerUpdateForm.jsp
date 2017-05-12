<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<
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

			$('#ok').click(function() {
				var content = $('#summernote').summernote('code');
				$('#content').val(content);		
			});

			if(${load != 0}){
				$('#name').val('${pet.name}');
				$('#weight').val('${pet.weight}');
				
				var year = '${pet.birthday}'.split('-');
				var now = new Date().getFullYear();
				var age = now - year[0];
				$('#age').val(age);
				
				$('#sex[value=${pet.sex}]').attr('checked', true);
				$('#sex[value!=${pet.sex}]').attr('checked', false);

				$('#kind > option[value="${pet.kind}"]').attr('selected', true);
			}
			else{
				$('#kind > option[value="${board.kind}"]').attr('selected', true);
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
						<h2>짝꿍찾기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="single-product-area">
		
		<div class="container">
		

			<div class="col-md-55">


				<form enctype="multipart/form-data" action="partnerUpdate.do"
				class="checkout" method="post" name="checkout">
				<input type="hidden" name="boardIdx" value="${board.boardIdx }">
				<input type="hidden" name="content" id="content"> 
				<input type="hidden" name="boardCode" value="5"> 
				<input type="hidden" name="writer" value="${sessionScope.name }">

				<div id="customer_details" class="col2-set">
					<div class="col-3">
						<h2 class="sidebar-title">글쓰기</h2>
						<div class="woocommerce-billing-fields">



							<div class="form-row place-order" style="float: right">
								<input type="button" id="petinfo"
								onclick="window.open('partnerGetPetinfoForm.do?id=${sessionScope.id}&boardIdx=${board.boardIdx }&boardCode=5&type=Update', 'pet' ,'left=400, top=200, width=500, height=300')"
								value="애견정보 불러오기" />
							</div>


							<label class="" for="billing_state">애견 이름</label> <input
							type="text" id="name" name="name" placeholder="" value="${board.name }"
							class="input-text ">

							<br><br>

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
								
                                                    <!-- <option selected="selected" value="치와와">치와와</option>
                                                    <option value="요크셔 테리어">요크셔 테리어</option>
                                                    <option value="말티즈">말티즈</option>
                                                    <option value="시츄">시츄</option>
                                                    <option value="비글">비글</option>
                                                    <option value="퍼그">퍼그</option>
                                                    <option value="페키니즈">페키니즈</option>
                                                    <option value="미니어쳐 슈나우저">미니어쳐 슈나우저</option>
                                                    <option value="기타 소형견">기타 소형견</option>
                                                    <option value="기타 중형견">기타 중형견</option>
                                                    <option value="기타 대형견">기타 대형견</option> -->
                                                </select>
                                                
                                                <br><br>


						<label class="" for="billing_first_name">성별 <abbr
							title="required" class="required">*</abbr></label>
							<div id="payment">
								<ul class="payment_methods methods">
									<li class="payment_method_paypal">
										<c:if test="${board.sex == '수컷' }">
										<input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio" id="sex" checked="checked"> 수컷
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio" id="sex"> 암컷
									</c:if>
									<c:if test="${board.sex == '암컷' }">
									<input type="radio" data-order_button_text="Proceed to PayPal" value="male" name="sex" class="input-radio" id="sex"> 수컷
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" data-order_button_text="Proceed to PayPal" value="female" name="sex" class="input-radio" id="sex" checked="checked"> 암컷
								</c:if>
							</ul>
						</div>

						<br>

						<label class="" for="billing_state">나이</label> <input
						type="text" id="age" name="age" placeholder="" value="${board.age }"
						class="input-text ">

						<br><br>

						<label class="" for="billing_state">몸무게(kg)</label> <input
						type="text" id="weight" name="weight" placeholder="" value="${board.weight }"
						class="input-text ">

						<br><br>

						<label class="" for="billing_state">연락처</label> <input
						type="text" id="phone" name="phone" placeholder="" value="${board.phone }"
						class="input-text ">

						<br><br>

						<label class="" for="billing_state">e-mail</label> <input
						type="text" id="email" name="email" placeholder="" value="${board.email }"
						class="input-text ">

						<br><br>


						<!-- 								<p id="billing_first_name_field" -->
						<!-- 									class="form-row form-row-first validate-required"> -->
						<!-- 									<label class="" for="billing_first_name">애견 프로필 사진 등록 <abbr -->
						<!-- 										title="required" class="required">*</abbr> -->
						<!-- 									</label> -->
						<!-- 								<div class="form-row place-order"> -->
						<!-- 									<input type="file" data-value="Place order" value="ADD PHOTO" -->
						<!-- 										id="ufile" name="ufile" -->
						<!-- 										class="button alt"> -->

						<!-- 								</div> -->
						<!-- 								</p> -->
						<label class="" for="billing_first_name">애견 프로필 사진 등록<abbr title="required" class="required">*</abbr></label>
						<table border="0">
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
						<p id="billing_state_field"
						class="form-row form-row-first address-field validate-state"
						data-o_class="form-row form-row-first address-field validate-state">
						<label class="" for="billing_state">글 제목</label> <input
						type="text" id="title" name="title" placeholder="" value="${board.title }"
						class="input-text ">
					</p>
					<br>




					<div style="width: 100%; margin: 0 auto;">
						<div id="summernote">${board.content }</div>
					</div>
					<br>




					<div class="form-row place-order" style="float: right">
						<input type="submit" data-value="Place order" value="WRITE"
						id="ok" name="woocommerce_checkout_place_order"
						class="button alt" onclick="return partnerBoardCheck()">
					</form>
				</div>



			</div>
		</div>





</body>
</html>