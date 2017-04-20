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
         
        <div class="container">
<!--             <div class="row"> -->
                
                <div class="col-md-55">
     
<!--                     <div class="product-content-right"> -->
<!--                         <div class="woocommerce" > -->
                         
                     

                            <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">


                                <div id="customer_details" class="col2-set" >
                                    <div class="col-3">
                                    <h2 class="sidebar-title2">제품리뷰 목록</h2>
                                    <div class="form-row place-order" style="float: right">
										<input type="button" data-value="Place order" value="WRITE" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
	                                    <h2> &nbsp;</h2>
									</div>  
                                    
                                    
                                    
                                    
                                    
                                    
                                    
    
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
                                    
                                    
                                    
                                    
                                            <label class="" for="billing_country">게시글 검색</label>
                                    			<table style="width: 100%">
                                    				<tr>
                                    					<td width="20%">
                                    						<select class="country_to_state country_select" id="billing_country" name="billing_country">
			                                                    <option selected="selected" value="GB">애견상식</option>
			                                                    <option value="DE">훈련정보</option>
			                                                    <option value="DE">애견간식레시피</option>
			                                                    <option value="DE">기타</option>
			                                                </select>
                                    					</td>
                                    					<td width="3%">
                                    					</td>
                                    					<td width="62%">
                                    						<input type="text" id="billing_state" name="billing_state" placeholder="Search..." value="" class="input-text ">
                                    					</td>
                                    					<td width="3%">
                                    					</td>
                                    					<td width="12%" align="right">
                                    						<input type="submit" data-value="Place order" value="SEARCH" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
                                    					</td>
                                    				</tr>
                                    			</table>     
                                            
                                            
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