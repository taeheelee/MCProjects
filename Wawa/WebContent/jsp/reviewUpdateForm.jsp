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
    
<!-- 여기부터 안에 들어가면 안되는 이유찾기 -->
    <div class="single-product-area">
<!--         <div class="zigzag-bottom"></div> -->
        <div class="container">
<!--             <div class="row"> -->
                
                <div class="col-md-55">
     
<!--                     <div class="product-content-right"> -->
<!--                         <div class="woocommerce" > -->
                         
                     

                            <form action="/Wawa/reviewUpdate.do" enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">


                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">글 수정하기</h2>
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
                                            
                   
				 
  <div style="width: 100%; margin: 0 auto;">
    <div id="summernote"><p>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				</p></div>
	</div>
<br>

<!--<div class="clear"></div> -->


											<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="DELETE" id="place_order" class="button alt">
											</div>	
							</form>
											<div class="form-row place-order" style="float: right">
												<input type="button" id="delete"  onclick="location.href='/reviewDelete.do?boardIdx='#{boardIdx}''" value="DELETE" />
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