<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
      <script>
	    $(document).ready(function() {
	        $('#summernote').summernote();
	    });
  </script>
  
  </head>
  <body>
    
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>제품리뷰</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- 여기부터 안에 들어가면 안되는 이유찾기 -->
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
<!--             <div class="row"> -->
                
                <div class="col-md-55">
     
<!--                     <div class="product-content-right"> -->
<!--                         <div class="woocommerce" > -->
                         
                     

                            <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">


                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">제품리뷰 글쓰기</h2>
                                        <div class="woocommerce-billing-fields">
                                            <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">카테고리 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select class="country_to_state country_select" id="category" name="category">
                                                    <option selected="selected" value="GB">사료</option>
                                                    <option value="DE">간식</option>
                                                    <option value="DE">영양제/건강/위생</option>
                                                    <option value="DE">목욕/미용</option>
                                                    <option value="DE">식기/배변</option>
                                                    <option value="DE">장남감/하우스/이동장</option>
                                                    <option value="DE">패션/줄/인식표</option>
                                                    <option value="DE">기타</option>
                                                </select>
                                            </p>
                                            <br>
                                            
                                            
											<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">글 제목<abbr title="required" class="required">*</abbr></label>
                                                <input type="text" id="title" name="title" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            
             
                                        <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">제품 별점</label>
                                                <span>★★★★★</span>
                                                </p>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">글 쓰기</label>
                                                </p>
                                        

				 
  <div style="width: 100%; margin: 0 auto;">
    <div id="summernote"><p>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				</p></div>
	</div>
<br>

<!--<div class="clear"></div> -->


											<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="WRITE" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
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
   
  </body>
</html>