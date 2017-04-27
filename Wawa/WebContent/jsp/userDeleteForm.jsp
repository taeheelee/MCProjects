<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	
	
	$('#cancel').click(function() {
		window.close();
	})
	$('#delete').click(function(){
		
		var chk = prompt('탈퇴하시려면 ID를 한번 더 입력해주세요', '탈퇴를 원하시면 ID를 입력해주세요');
		$.ajax({ 
		 	    url : "deleteCheck.do",
		    	type : 'POST',
		     	data : 'id=' + $('#id').val() + "&password=" + $('#password').val() + "&chk=" + chk ,
		     	dataType: 'json',
			    success : function (data) {
			    	//alert('sdsd');
			        if(data.result){
			        	alert('탈퇴완료'); 
			      		window.opener.parent.location.href = "main.do";
			      		window.close();
			    	}
			        else 
			        	alert('아이디와 비밀번호를 다시 확인해주세요');
			    },
		     	error : function(){
		    	 	alert('잠시 후 다시 시도해주세요');
		     	}
		 	});
		//if($('#password').val() == )
		//alert(inputString)
		
	});
	$('#conformPassword').blur(function(){
		if($('#password').val() != $('#conformPassword').val()){
			 $("#delete").attr("disabled",true);
		}else {
			$('#delete').attr("disabled",false);
		}
	});
	
});
</script>
</head>
<body>
	<center>
	<br>
		<h3>회원탈퇴</h3>
			<table border="0">
				<tr>
					<td align="center" style="height: 50px">아이디</td>
					<td>
						<input type="text" value="${sessionScope.id }" name="id" id="id" readonly="readonly">
					</td>
				</tr>
				<Tr>
					<td align="center" style="height: 50px">비밀번호</td><td><input type="text" value="" name="password" id="password"> </td>
				</Tr>
				<Tr>
					<td align="center" style="height: 50px">비밀번호 확인</td><td><input type="text" value="" name="chkPass" id="conformPassword"> </td>
				</Tr>

				<tr>
					
					<td align="center" style="height: 50px" colspan="2">
						<input type="button" id="delete" value="삭제" disabled="disabled">
						<input type="button" id="cancel" value="취소">
					</td>
				</tr>
			</table>
	</center>
</body>
</html>