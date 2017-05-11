<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
   
    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script> 
    <link href="tabstyle.css" rel="stylesheet">
    
    <!--  JQuery -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
</head>
<body>
	<center>
		<table cellspacing="0" class="shop_table cart" style="width: 80%;margin-top: 20px">
			<thead>
				<tr><th>번호</th><th>펫이름</th><th>품종</th><th>선택</th></tr>
			</thead>
			<tbody>
				<c:forEach items="${petList }" var="pet" varStatus="st">
					<tr>
						<td>${st.index+1 }</td>
						<td style="font-weight: bold;">${pet.name }</td>
						<td>${pet.kind }</td>
						
						<c:if test="${boardCode==3}">
						<td><input type="button" value="선택" onclick="window.close();window.opener.parent.location.href='boastGetPetinfo.do?idx=${pet.idx}&boardIdx=${boardIdx }&boardCode=3&type=${type }'"></td>
						</c:if>
						<c:if test="${boardCode==4}">
						<td><input type="button" value="선택" onclick="window.close();window.opener.parent.location.href='lostGetPetinfo.do?idx=${pet.idx}&boardIdx=${boardIdx }&boardCode=4&type=${type }'"></td>
						</c:if>
						<c:if test="${boardCode==5}">
						<td><input type="button" value="선택" onclick="window.close();window.opener.parent.location.href='partnerGetPetinfo.do?idx=${pet.idx}&boardIdx=${boardIdx }&boardCode=5&type=${type }'"></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</center>
</body>
</html>