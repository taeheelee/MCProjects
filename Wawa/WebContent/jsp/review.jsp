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
                                    <h2 class="sidebar-title">제품리뷰 목록</h2>
                       
                                    
    
		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th>글번호</th>
                        <th>카테고리</th>
                        <th>글제목</th>
                        <th>제품별점</th>
                        <th>글쓴이</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                
                    <tr class="cart_item">
                        <td>3</td>
                        <td>[사료]</td>
                        <td><a href="#">맛좋은사료 	</a></td>
                        <td>★★★★☆</td>
                        <td>와와아빠</td>
    					<td>0</td>
                        <td>2017-03-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>2</td>
                        <td>[목욕/미용]</td>
                        <td><a href="#">윤기나는 샴푸</a></td>
                        <td>★★★☆☆</td>
                        <td>핫도그</td>
    					<td>0</td>
                        <td>2017-02-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>1</td>
                        <td>[간식]</td>
                        <td><a href="#">영양 간식</a></td>
                        <td>★★★☆☆</td>
                        <td>도그맘</td>
    					<td>0</td>
                        <td>2017-01-01</td>
                    </tr>
                  
           
				</tbody>
			</table>
        </form>
                                    
                                    
                                              <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">카테고리 <abbr title="required" class="required">*</abbr>
                                                </label>
                                                
                                   <form action="/Wawa/reviewSearch.do">
                                                
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
                                                <label class="" for="billing_state">검색<abbr title="required" class="required">*</abbr></label>
                                                <input type="text" id="billing_state" name="billing_state" placeholder="" value="" class="input-text ">
                                            </p>
                                            <br>
                                	<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="SEARCH" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
								</form>	
											
											
											</div>   
												<div class="form-row place-order" style="float: right">
												<input type="button" id="write" onclick="location.href='/Wawa/reviewWriteForm.do'" value="WRITE" />
											</div>        
                                            
                                            
                                    </div>

                                </div>
 									

				<div class="col-md-12">
					<div class="product-pagination text-center">
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">6</a></li>
								<li><a href="#">7</a></li>
								<li><a href="#">8</a></li>
								<li><a href="#">9</a></li>
								<li><a href="#">10</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>

                                   
                                </div>
                            </form>

<!--                         </div>                        -->
<!--                     </div>                     -->
                </div>
<!--             </div> -->
        </div>
                </div>
   
<!-- 여기부터 안에 들어가면 안되는 이유찾기  end-->     



  </body>
</html>