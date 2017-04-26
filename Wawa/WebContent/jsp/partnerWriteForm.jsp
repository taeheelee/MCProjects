<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/boardCheck.js"></script>
      <script type="text/javascript">
	  $(document).ready(function() {
	      $('#summernote').summernote({
	    	  height : 500
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
					
				 if(${pet.kind == '치와와'})
			      		$('#kind > option[value=1]').attr('selected', true);
			      	else if(${pet.kind == '요크셔 테리어'})
			      		$('#kind > option[value=2]').attr('selected', true);
			      	else if(${pet.kind == '말티즈'})
			      		$('#kind > option[value=3]').attr('selected', true);
			      	else if(${pet.kind == '시츄'})
			      		$('#kind > option[value=4]').attr('selected', true);
			      	else if(${pet.kind == '비글'})
			      		$('#kind > option[value=5]').attr('selected', true);
			      	else if(${pet.kind == '퍼그'})
			      		$('#kind > option[value=6]').attr('selected', true);
			      	else if(${pet.kind == '페키니즈'})
			      		$('#kind > option[value=7]').attr('selected', true);
			      	else if(${pet.kind == '미니어쳐 슈나우저'})
			      		$('#kind > option[value=8]').attr('selected', true);
			      	else if(${pet.kind == '기타 소형견'})
			      		$('#kind > option[value=9]').attr('selected', true);
			      	else if(${pet.kind == '기타 중형견'})
			      		$('#kind > option[value=10]').attr('selected', true);
			      	else if(${pet.kind == '기타 대형견'})
			      		$('#kind > option[value=11]').attr('selected', true);
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


<!-- 여기부터 안에 들어가면 안되는 이유찾기 -->
    <div class="single-product-area">
<!--         <div class="zigzag-bottom"></div> -->
        <div class="container">
<!--             <div class="row"> -->
                
                <div class="col-md-55">
     
<!--                     <div class="product-content-right"> -->
<!--                         <div class="woocommerce" > -->
                         
                     

                            <form enctype="multipart/form-data" action="partnerWrite.do" class="checkout" method="get" name="checkout">
								<input type="hidden" name="content" id="content">
								<input type="hidden" name="boardCode" value="5">
								<input type="hidden" name="writer" value="${sessionScope.name}">

                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">글쓰기</h2>
                                        <div class="woocommerce-billing-fields">
             
                                    
                                            
                                            <div class="form-row place-order" style="float: right">
												<input type="button" id="petinfo" onclick="window.open('partnerGetPetinfoForm.do?id=${sessionScope.id}&boardCode=3', 'pet' ,'left=400, top=200, width=500, height=300')" value="애견정보 불러오기" />
											</div>
                                        
                                            
											<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">애견 이름</label>
                                                <input type="text" id="name" name="name" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                       
                                             <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">품종 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select class="country_to_state country_select" id="kind" name="kind">
                                                    <option selected="selected" value="1">치와와</option>
                                                    <option value="2">요크셔 테리어</option>
                                                    <option value="3">말티즈</option>
                                                    <option value="4">시츄</option>
                                                    <option value="5">비글</option>
                                                    <option value="6">퍼그</option>
                                                    <option value="7">페키니즈</option>
                                                    <option value="8">미니어쳐 슈나우저</option>
                                                    <option value="9">기타 소형견</option>
                                                    <option value="10">기타 중형견</option>
                                                    <option value="11">기타 대형견</option>
                                                </select>
                                            </p>
                                            <br>
                                            
                                             <p id="billing_first_name_field" class="form-row form-row-first validate-required">
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
                                            </p>
                                            <br>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">나이</label>
                                                <input type="text" id="age" name="age" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">몸무게(kg)</label>
                                                <input type="text" id="weight" name="weight" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">연락처</label>
                                                <input type="text" id="phone" name="phone" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            
                                          <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">e-mail</label>
                                                <input type="text" id="email" name="email" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                      
                                            
                                            	<p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">애견 프로필 사진 등록 <abbr title="required" class="required">*</abbr>
                                                </label>
                                               
                                            <div class="form-row place-order">
												<input type="button" data-value="Place order" value="ADD PHOTO" id="place_order" name="woocommerce_checkout_place_order" class="button alt" >

											</div>
                                            </p>
     
                                         <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">글 제목</label>
                                                <input type="text" id="title" name="title" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            
                                           

				 
  <div style="width: 100%; margin: 0 auto;">
    <div id="summernote"></div>
	</div>
<br>

<!--<div class="clear"></div> -->


											<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="WRITE" id="ok" name="woocommerce_checkout_place_order" class="button alt" onclick="return partnerBoardCheck()">
							</form>
											</div>



										</div>
                                    </div>

                                   

                                </div>


       
                                </div>
                            

<!--                         </div>                        -->
<!--                     </div>                     -->
                </div>
<!--             </div> -->
        </div>
                </div>
   
<!-- 여기부터 안에 들어가면 안되는 이유찾기  end-->     



  </body>
</html>