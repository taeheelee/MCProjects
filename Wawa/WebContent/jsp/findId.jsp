<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script type="text/javascript" src="js/nv.d3.js"></script>
<script type="text/javascript" src="js/simple.d3.js"></script>
 
<script type="text/javascript">
	$(document).ready(function(){
		var targetNode = document.getElementById("lTable");
		if(targetNode.hasAttribute("class")){
		  targetNode.removeAttribute("class");
		}
	});
</script>
<body>
	 <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-left">
                        <h2>아이디/비밀번호 찾기</h2>
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
                                             
                                          <table cellspacing="20px" class="shop_table cart" id="lTable">
								
											<tr class="cart_item">
													<td>
													&nbsp;
													이름: 
													&nbsp;
													</td>
													<td colspan="2">
													&nbsp;
													<input type="text" id="way" name="way" value="" class="input-text ">
													&nbsp;
													</td>
												</tr>
												<tr>
													<td>
													&nbsp;
													<select class="country_to_state country_select" name="name" id="name">
														<option value="defaultValue">선택하세요</option>
														<option value="byPhone">등록된 번호로 찾기</option>
														<option value="byEmail">등록된 이메일로 찾기</option>
													</select>
													&nbsp;
													</td>
													<td>
													&nbsp;
													<input type="text" id="way" name="way" value="" class="input-text ">
													&nbsp;
													</td>
													<td>
													&nbsp;
														<span id="wayError"></span>
													&nbsp;
													</td>
												</tr>
										</table>
                                             
                                             
                                          	<br>
											    <label class="" for="billing_state">이름</label>
                                                <input type="text" id="name" name="name" placeholder="" value="" class="input-text ">
                                                <br>
                                                <span id="nameError"></span>
                                            <br>
                                            <select class="country_to_state country_select" name="name" id="name">
												<option value="defaultValue">선택하세요</option>
												<option value="byPhone">등록된 번호로 찾기</option>
												<option value="byEmail">등록된 이메일로 찾기</option>
											</select>
												<input type="text" id="way" name="way" value="" class="input-text ">
<!-- 											 placeholder="000-0000-0000" -->
<!-- 											    <label class="" for="billing_state">연락처</label> -->
                                                
                                                <br>
                                                <span id="wayError"></span>
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