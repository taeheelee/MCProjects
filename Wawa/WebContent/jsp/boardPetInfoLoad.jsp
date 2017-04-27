<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(${boardCode == 3}){
			var form = $('<form action="boast${type}Form.do" method="post">' +
					 	 '<input type="hidden" name="idx" value="${pet.idx}" />' +
					 	 '<input type="hidden" name="boardIdx" value="${boardIdx}" />' +
			 			 '</form>');
		}
		else if(${boardCode == 4}){
			var form = $('<form action="lost${type}Form.do" method="post">' +
					 	 '<input type="hidden" name="idx" value="${pet.idx}" />' +
					 	 '<input type="hidden" name="boardIdx" value="${boardIdx}" />' +
			 			 '</form>');
		}
		else if(${boardCode == 5}){
			var form = $('<form action="partner${type}Form.do" method="post">' +
					 	 '<input type="hidden" name="idx" value="${pet.idx}" />' +
					 	 '<input type="hidden" name="boardIdx" value="${boardIdx}" />' +
			 			 '</form>');
		}
		$('body').append(form);
		form.submit();
	}			
</script>
</head>
<body>
	
</body>
</html>