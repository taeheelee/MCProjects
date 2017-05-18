nv.addGraph(function() {
	var chart = nv.models.lineChart().margin({
		left : 100
	}) // x축에 margin을 설정
	.useInteractiveGuideline(true) // 마우스 올릴 시 가이드라인 출력
//	.transitionDuration(350) // 애니메이션 효과를 동작시킬 시간, 에러 발생 가능성있으므로 주석처리
	.showLegend(true) // 범례 출력 여부, 범례는 켜고 끌 수 있음
	.showYAxis(true) // Y축 출력 여부
	.showXAxis(true) // X축 출력 여부
	;

	chart.xAxis // x축 설정
    .showMaxMin(false)
    .tickFormat(function(d) { return d3.time.format('%x')(new Date(d)) });
	
	chart.yAxis // y축 설정
	.axisLabel('Weight(Kg)').tickFormat(d3.format('.02f')); //소수점 2자리까지

	//세팅값대로 그래프를 render
	var idxList = getIdx(); //idx 리스트 받아오기
	//idx는 애완동물마다 고유의 값이 있음. 즉, idx리스트는 강아지 목록임
//	alert(idxList.idx); //idxList.idx는 json데이터에서 idx 리스트를 저장한 키값
	var weightList = []; //
	var myData = []; // You need data...

	for(var i = 0; i < idxList.idx.length; i++) {
		var temp = getData(idxList.idx[i]); // idxList.idx[i]는 인덱스번호를 나타냄
		var inner = [];
		for (var j = 0; j < temp.length; j++) {
//			alert(temp[j].date); // 'temp[j].key값'으로 접근가능
			inner.push({x : temp[j].date, y : temp[j].weight});
		}
		weightList.push(inner);
		myData.push({
		    values: weightList[i],
		    key: idxList.idx[i]
		  });
	}
		
	d3.select('#chart svg') // Select the <svg> element you want to render the
							// chart in.
	.datum(myData) // Populate the <svg> element with chart data...
	.call(chart); // Finally, render the chart!

	// Update the chart when window resizes.
	nv.utils.windowResize(function() {
		chart.update()
	});
	return chart;
});


function getIdx() {
	var idxList;
	$.ajax({
		async : false,
		dataType : 'json',
		url : 'getIdxList.do',
		success : function(data) {
			idxList = data;
		}
	});
	return idxList;
}

function getData(idx) {
	var result;
	$.ajax({
		url : 'dataupload.do',
		async : false,
		dataType : 'json',
		type : 'GET',
		data : {"idx" : idx},
		
		//idx에 맞는 몸무게 기록들을 받아왔을 경우
		success : function(data) {
			result = data.data;
		},
		error : function() {
			alert("getData AJAX 에러발생");
		}
	});
	
	return result;
}
