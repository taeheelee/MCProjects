nv.addGraph(function() {
	var chart = nv.models.lineChart().margin({
		left : 40,
		bottom : 75
	}) // x축에 margin을 설정함
	.useInteractiveGuideline(true) // 마우스 올릴 시 가이드라인 출력
//	.transitionDuration(350) // 애니메이션 효과를 동작시킬 시간, 에러 발생 가능성있으므로 주석처리
	.showLegend(true) // 범례 출력 여부, 범례는 켜고 끌 수 있음
	.showXAxis(true) // X축 출력 여부
	.showYAxis(true) // Y축 출력 여부
	;

	chart.xAxis // x축 설정
	.showMaxMin(false)
	. rotateLabels(-60)
//    .axisLabel('Day')
    .tickFormat(function(d) { return d3.time.format('%Y-%m-%d')(new Date(d)) });
//	chart.xAxis
//    .tickFormat(function(d) {
//      return d3.time.format('%x')(new Date(d))
//    });
	
	chart.yAxis // y축 설정
	.axisLabelDistance(-25).axisLabel('Weight(Kg)').tickFormat(d3.format('.01f')); //소수점 1자리까지
	
////////////////////////////////////////
	//세팅값대로 그래프를 render
	var param = getPetList(); //petInfo 객체 받아옴
	var weightList = [];
	var myData = [];

	// 한 주인이 여러 마리를 기를 수 있기에 for문을 통해 주인이 가진 모든 동물 데이터를 처리함
	for(var i = 0; i < param.petList.length; i++) {
//		alert("getPetList 인덱스 출력 : " + param.petList[i].idx);
		var temp = getData(param.petList[i].idx);
		var inner = []; //날짜와 무게를 뽑아 저장할 배열
//		alert(temp.weightList.length);
		for (var j = 0; j < temp.weightList.length; j++) {
//			alert(temp[j].date); // 'temp[j].key값'으로 value 접근가능
//			alert(temp.weightList[j].weight);
			inner.push({x : temp.weightList[j].timemil, y : temp.weightList[j].weight});
			//inner에는 x, y 좌표값을 json 형식으로 저장해야 함
			
		}
		
		weightList.push(inner); // inner에 담긴 x, y 좌표값을 하나로 저장하는 배열
		//weightList의 인덱스 1개는 애완동물 1마리를 뜻함
		myData.push({
			//그래프를 그리기 위한 데이터 형식은 key, values이므로 형식에 맞게 데이터를 입력해줌
			values: weightList[i],
			key: param.petList[i].name // 범례에 표시할 이름.
		});
	}

////////////////////////////////////////////////////////////////////////
//	//세팅값대로 그래프를 render
//	var idxList = getIdx(); //idx 리스트 받아오기
//	//idx는 애완동물마다 고유의 값이 있음. 즉, idx리스트는 강아지 목록임
////	alert(idxList.idx); //idxList.idx는 json 데이터에서 idx 리스트를 저장한 키값임
//	var weightList = [];
//	var myData = [];
//	
//	// 한 주인이 여러 마리를 기를 수 있기에 for문을 통해 주인이 가진 모든 동물 데이터를 처리함
//	for(var i = 0; i < idxList.idx.length; i++) {
//		var temp = getData(idxList.idx[i]); // idxList.idx[i]는 인덱스번호를 나타냄
//		var inner = []; //날짜와 무게를 뽑아 저장할 배열
//		for (var j = 0; j < temp.length; j++) {
////			alert(temp[j].date); // 'temp[j].key값'으로 value 접근가능
//			inner.push({x : temp[j].date, y : temp[j].weight});
//			//inner에는 x, y 좌표값을 json 형식으로 저장해야 함
//		}
//		weightList.push(inner); // inner에 담긴 x, y 좌표값을 하나로 저장하는 배열
//		//weightList의 인덱스 1개는 애완동물 1마리를 뜻함
//		myData.push({
//			//그래프를 그리기 위한 데이터 형식은 key, values이므로 형식에 맞게 데이터를 입력해줌
//			values: weightList[i],
//			key: idxList.idx[i] // 범례에 표시할 이름.
//		});
//	}
/////////////////////////////////////////////////////////
		
	d3.select('#chart svg') //<svg> 요소 선택
	.datum(myData) // 데이터 삽입
	.call(chart); // 그래프 render

	//창 크기가 변경되면 그래프 크기를 변경
	nv.utils.windowResize(function() {
		chart.update()
	});
	return chart;
});

//한 주인이 기르는 애완동물 목록을 모두 받아옴
function getPetList() {
//	alert("getPetList 진입");
	var petList;
	$.ajax({
		async : false,
		dataType : 'json',
		url : 'getPetList.do',
		success : function(data) {
			petList = data;
		}
	});
	return petList;
}
////한 주인이 기르는 애완동물 목록을 모두 받아옴
//function getIdx() {
//	var idxList;
//	$.ajax({
//		async : false,
//		dataType : 'json',
//		url : 'getIdxList.do',
//		success : function(data) {
//			idxList = data;
//		}
//	});
//	return idxList;
//}

//애완동물 목록에서 하나씩 선택해 해당 동물의 체중 변화 기록을 가져옴
function getData(idx) {
	var result;
	$.ajax({
		url : 'getPetWeightList.do',
		async : false,
		dataType : 'json',
		type : 'GET',
		data : {"idx" : idx},
		
		//idx에 맞는 몸무게 기록들을 받아왔을 경우
		success : function(data) {
			result = data;
		},
		error : function() {
			alert("getData AJAX 에러발생");
		}
	});
	return result;
}
