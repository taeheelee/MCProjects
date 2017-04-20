<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                        <h2>애견정보/상식</h2>
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
                                    <h2 class="sidebar-title">글 목록</h2>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
    
		<form method="post" action="#">
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th>글번호</th>
                        <th>카테고리</th>
                        <th>글제목</th>
                        <th>글쓴이</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                
                    <tr class="cart_item">
                        <td>3</td>
                        <td>[훈련정보]</td>
                        <td><a href="#">훈련법</a></td>
                        <td>개장수</td>
    					<td>0</td>
                        <td>2017-03-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>2</td>
                        <td>[애견상식]</td>
                        <td><a href="#">3대 지랄견 소개</a></td>
                        <td>핫도그</td>
    					<td>0</td>
                        <td>2017-02-01</td>
                    </tr>
                    <tr class="cart_item">
                        <td>1</td>
                        <td>[애견간식레시피]</td>
                        <td><a href="#">몸에좋은 수제간식</a></td>
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
                                                
                                                
                                    <form action="/Wawa/infoSearch.do">
                                                <select class="country_to_state country_select" id="category" name="category">
                                                    <option selected="selected" value="GB">애견상식</option>
                                                    <option value="DE">훈련정보</option>
                                                    <option value="DE">애견간식레시피</option>
                                                    <option value="DE">기타</option>
                                                </select>
                                            </p>
                                            <br>
                                    
                             		<p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">검색<abbr title="required" class="required">*</abbr></label>
                                                <input type="text" id="keyword" name="keyword" placeholder="" value="" class="input-text ">
                        
                                            </p>
                                            <br>
                                	<div class="form-row place-order" style="float: right">
												<input type="submit" data-value="Place order" value="SEARCH" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
								</form>
										      
											</div>   
												<div class="form-row place-order" style="float: right">
												<input type="button" id="write" onclick="location.href='/Wawa/infoWrite.do'" value="WRITE" />
											</div>        
                                            
                                            
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
   
  


  </body>
</html>