<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	 <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>회원가입</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
     <div class="single-product-area">
<!--         <div class="zigzag-bottom"></div> -->
        <div class="container">
            <div class="row">
                
                <div class="col-md-55">
     
                    <div class="product-content-right">
                        <div class="woocommerce" >
                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title">아이디 찾기</h2>
                                        <div class="woocommerce-billing-fields">
			                            <form  action="" class="checkout" method="post" name="checkout">
                                             
                                            <br>
                                               <label class="" for="billing_first_name">닉네임<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" id="nick" name="nickname" class="input-text ">
                                                <br>
                                                <span id="nickError"></span>
                                            
                                          
                                            
                                            <br>
											    <label class="" for="billing_state">연락처</label>
                                                <input type="text" id="phoneNum" name="phone" placeholder="000-0000-0000" value="" class="input-text ">
                                                <br>
                                                <span id="pnumError"></span>
                                            <br>
                                            	<label class="" for="billing_state">이메일</label>
                                                <input type="text" id="email" name="email" placeholder="abc@naver.com" value="" class="input-text ">
                                                <br>
                                                <span id="emailError"></span>
                                            <br>
<!--<div class="clear"></div> -->
											<div class="form-row place-order" style="float: right">
												<input type="button" data-value="Place order" value="FIND ID" id="find" class="button alt">
											</div>
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