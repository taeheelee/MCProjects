<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  
  
<!--   <div style="width: 50%; margin: 0 auto;"> -->
<!--     <div id="summernote"><p>Hello Summernote</p><p>Hello Summernote</p><p>Hello Summernote</p><p>Hello Summernote</p></div> -->
<!-- 	</div> -->
	
   
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>자유게시판</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- 여기부터 안에 들어가면 안되는 이유찾기 -->
    <div class="single-product-area">
 
        <div class="container">
<!--             <div class="row"> -->
                
                <div class="col-md-55">
     
<!--                     <div class="product-content-right"> -->
<!--                         <div class="woocommerce" > -->
                         
                     

                            <form enctype="multipart/form-data" action="freeboardWrite.do" class="checkout" method="get" name="checkout">
								<input type="hidden" name="content" id="content">
								<input type="hidden" name="boardCode" value="6">
								<input type="hidden" name="writer" value="${sessionScope.name }">
								
                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">글쓰기</h2>
                                        <div class="woocommerce-billing-fields">
                                            
                                            <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">카테고리 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select class="country_to_state country_select" id="category" name="category">
                                                    <option selected="selected" value="1">애견상식</option>
                                                    <option value="2">훈련정보</option>
                                                    <option value="3">애견간식레시피</option>
                                                    <option value="4">기타</option>
                                                </select>
                                            </p>
                                            <br>
                                            
											<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">글 제목<abbr title="required" class="required">*</abbr></label>
                                                <input type="text" id="title" name="title" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                            
             
                                       
                                            
                                      
                                        

				 
  <div style="width: 100%; margin: 0 auto;">
    <div id="summernote"></div>
	</div>
<br>

<!--<div class="clear"></div> -->


											<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="WRITE" id="ok" name="woocommerce_checkout_place_order" class="button alt" onclick="return infoBoardCheck()">
											</div>
											</form>


										</div>
                                    </div>

                                   

                                </div>




 									















                              

                                   
                                </div>
                          

                </div>

        </div>

  </body>
</html>