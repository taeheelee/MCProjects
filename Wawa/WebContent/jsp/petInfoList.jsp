<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table border="1">
			<tr><th>번호</th><th>펫이름</th><th>품종</th><th>선택</th></tr>
			<c:forEach items="${petList }" var="pet" varStatus="st">
				<tr>
					<td>${st.index+1 }</td>
					<td>${pet.name }</td>
					<td>${pet.kind }</td>
					<td><input type="button" value="선택" onclick="window.close();window.opener.parent.location.href='boastGetPetinfo.do?idx=${pet.idx}'"></td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>