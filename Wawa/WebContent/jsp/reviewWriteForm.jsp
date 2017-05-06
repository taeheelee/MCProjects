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
<!--         <div class="zigzag-bottom"></div> -->
        <div class="container">
<!--             <div class="row"> -->
                
                <div class="col-md-55">
     
<!--                     <div class="product-content-right"> -->
<!--                         <div class="woocommerce" > -->
                         
                     

                            <form enctype="multipart/form-data" action="reviewWrite.do" class="checkout" method="get" name="checkout">
								<input type="hidden" name="content" id="content">
								<input type="hidden" name="boardCode" value="2">
								<input type="hidden" name="writer" value="${sessionScope.name}">

                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">제품리뷰 글쓰기</h2>
                                        <div class="woocommerce-billing-fields">
                                            <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">카테고리 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select class="country_to_state country_select" id="category" name="category">
                                                    <option selected="selected" value="1">사료</option>
                                                    <option value="2">간식</option>
                                                    <option value="3">영양제/건강/위생</option>
                                                    <option value="4">목욕/미용</option>
                                                    <option value="5">식기/배변</option>
                                                    <option value="6">장남감/하우스/이동장</option>
                                                    <option value="7">패션/줄/인식표</option>
                                                    <option value="8">기타</option>
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
                                                <select class="country_to_state country_select" id="starPoint" name="starPoint">
                                                    <option selected="selected" value="5">★★★★★</option>
                                                    <option value="4">★★★★☆</option>
                                                    <option value="3">★★★☆☆</option>
                                                    <option value="2">★★☆☆☆</option>
                                                    <option value="1">★☆☆☆☆</option>
                                                </select>
                                                </p>
                                            
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">글 쓰기</label>
                                                </p>
                                        

				 
  <div style="width: 100%; margin: 0 auto;">
    <div id="summernote"></div>
	</div>
<br>

<!--<div class="clear"></div> -->


											<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="WRITE" id="ok" name="woocommerce_checkout_place_order" class="button alt" onclick="return reviewBoardCheck()">
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