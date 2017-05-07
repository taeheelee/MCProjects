function infoBoardCheck() {
	if ($('#title').val().replace(/ /gi, "") == "") {
		alert("제목을 입력해주세요");
		$('#title').focus();
		return false;
	}
	var content = $('#summernote').summernote('code');
	$('#content').val(content);
	if (content == "<p><br></p>") {
		alert("내용을 입력해주세요");
		return false;
	}
	return true;
}

function reviewBoardCheck() {
	if ($('#title').val().replace(/ /gi, "") == "") {
		alert("제목을 입력해주세요");
		$('#title').focus();
		return false;
	}
	var content = $('#summernote').summernote('code');
	$('#content').val(content);
	if (content == "<p><br></p>") {
		alert("내용을 입력해주세요");
		return false;
	}
	return true;
}

function boastBoardCheck() {
	if ($('#name').val().replace(/ /gi, "") == "") {
		alert("애견이름을 입력해주세요");
		$('#name').focus();
		return false;
	}
	if ($('#age').val().replace(/ /gi, "") == "") {
		alert("나이를 입력해주세요");
		$('#age').focus();
		return false;
	}
	if ($.isNumeric($('#age').val()) == false) {
		alert("나이는 숫자로 입력해주세요");
		$('#age').focus();
		return false;
	}
	if ($('#title').val().replace(/ /gi, "") == "") {
		alert("제목을 입력해주세요");
		$('#title').focus();
		return false;
	}
	var content = $('#summernote').summernote('code');
	$('#content').val(content);
	if (content == "<p><br></p>") {
		alert("내용을 입력해주세요");
		return false;
	}
	return true;
}

function lostBoardCheck() {
	if ($('#lostdate').val().replace(/ /gi, "") == "") {
		alert("날짜를 입력해주세요");
		$('#lostdate').focus();
		return false;
	}
		var param = $('#lostdate').val();
        param = param.replace(/-/g,'');

        // 자리수가 맞지않을때
        if( isNaN(param) || param.length!=8 ) {
        	alert("날짜형식이 올바르지않습니다.");
            return false;
        }
         
        var year = Number(param.substring(0, 4));
        var month = Number(param.substring(4, 6));
        var day = Number(param.substring(6, 8));

        var dd = day / 0;

         
        if( month<1 || month>12 ) {
        	alert("날짜가 올바르지않습니다.");
            return false;
        }
         
        var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        var maxDay = maxDaysInMonth[month-1];
         
        // 윤년 체크
        if( month==2 && ( year%4==0 && year%100!=0 || year%400==0 ) ) {
            maxDay = 29;
        }
         
        if( day<=0 || day>maxDay ) {
        	alert("날짜가 올바르지않습니다.");
            return false;
        }
    
	if ($('#lostplace').val().replace(/ /gi, "") == "") {
		alert("장소를 입력해주세요");
		$('#lostplace').focus();
		return false;
	}
	if ($('#name').val().replace(/ /gi, "") == "") {
		alert("애견이름을 입력해주세요");
		$('#name').focus();
		return false;
	}
	if ($('#age').val().replace(/ /gi, "") == "") {
		alert("나이를 입력해주세요");
		$('#age').focus();
		return false;
	}
	if ($.isNumeric($('#age').val()) == false) {
		alert("나이는 숫자로 입력해주세요");
		$('#age').focus();
		return false;
	}
	if ($('#weight').val().replace(/ /gi, "") == "") {
		alert("몸무게를 입력해주세요");
		$('#weight').focus();
		return false;
	}
	if ($.isNumeric($('#weight').val()) == false) {
		alert("몸무게는 숫자로 입력해주세요");
		$('#weight').focus();
		return false;
	}
	if ($('#title').val().replace(/ /gi, "") == "") {
		alert("제목을 입력해주세요");
		$('#title').focus();
		return false;
	}
	var content = $('#summernote').summernote('code');
	$('#content').val(content);
	if (content == "<p><br></p>") {
		alert("내용을 입력해주세요");
		return false;
	}
	return true;
}

function partnerBoardCheck() {
	if ($('#name').val().replace(/ /gi, "") == "") {
		alert("애견이름을 입력해주세요");
		$('#name').focus();
		return false;
	}
	if ($('#age').val().replace(/ /gi, "") == "") {
		alert("나이를 입력해주세요");
		$('#age').focus();
		return false;
	}
	if ($.isNumeric($('#age').val()) == false) {
		alert("나이는 숫자로 입력해주세요");
		$('#age').focus();
		return false;
	}
	if ($('#weight').val().replace(/ /gi, "") == "") {
		alert("몸무게를 입력해주세요");
		$('#weight').focus();
		return false;
	}
	if ($.isNumeric($('#weight').val()) == false) {
		alert("몸무게는 숫자로 입력해주세요");
		$('#weight').focus();
		return false;
	}
	if ($('#title').val().replace(/ /gi, "") == "") {
		alert("제목을 입력해주세요");
		$('#title').focus();
		return false;
	}
	var content = $('#summernote').summernote('code');
	$('#content').val(content);
	if (content == "<p><br></p>") {
		alert("내용을 입력해주세요");
		return false;
	}
	return true;
}

function sendFile(file, editor, welEditable) {
    var form_data = new FormData();
    form_data.append('file', file);
    $.ajax({
      data: form_data,
      type: "POST",
      url: 'image.do',
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(data) {
        $('#summernote').summernote('insertImage', "imageShow/"+data.id+".do");
      },
	  error : function(xhrReq, status, error){
		alert("실패");
	  }
    });
  }