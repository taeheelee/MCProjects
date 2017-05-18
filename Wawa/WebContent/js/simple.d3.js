nv.addGraph(function() {
	var chart = nv.models.lineChart().margin({
		left : 100
	}) // Adjust chart margins to give the x-axis some breathing room.
	.useInteractiveGuideline(true) // We want nice looking tooltips and a
									// guideline!
//	.transitionDuration(350) // how fast do you want the lines to transition?
	.showLegend(true) // Show the legend, allowing users to turn on/off line
						// series.
	.showYAxis(true) // Show the y-axis
	.showXAxis(true) // Show the x-axis
	;

//	chart.xAxis // Chart x-axis settings
//	.axisLabel('Day(yymmdd)').tickFormat(d3.format(',r'));
//	chart.xAxis // X축 날짜 표시
//    .showMaxMin(false)
//    .tickFormat(function(d) {
//      var dx = data[0].values[d] && data[0].values[d][0] || 0;
//      return d3.time.format('%x')(new Date(dx))
//    });
	chart.xAxis
    .showMaxMin(false)
    .tickFormat(function(d) { return d3.time.format('%x')(new Date(d)) });
	
	chart.yAxis // Chart y-axis settings
	.axisLabel('Weight(Kg)').tickFormat(d3.format('.02f'));

	/* Done setting the chart up? Time to render it! */
	var idxList = getIdx(); //idx 리스트 받아오기
//	alert(idxList.idx);
	var weightList = [];
//	getData(idxList.idx); //idxList.idx는 idx 목록 전체임.
	var myData = []; // You need data...

	for(var i = 0; i < idxList.idx.length; i++) {
//		alert("인덱스 잘 받아옴? : " + idxList.idx[i]);	
		var temp = getData(idxList.idx[i]);
		var inner = [];
		for (var j = 0; j < temp.length; j++) {
//			alert(temp[j].date); // temp[j].이름으로 접근가능
			inner.push({x : temp[j].date, y : temp[j].weight});
		}
		weightList.push(inner);
		myData.push({
		    values: weightList[i],
		    key: idxList.idx[i]
		  });
//		alert(getData(idxList.idx[i]));
//		for(var j = 0; j < getData(idxList.idx[i]).length; j++) {
//			alert("이중for문 " + getData(idxList.idx[i][0]));
//		}
//		weightList.push(getData(idxList.idx[i]));
//		alert("idxList.idx의 for 테스트 : " + idxList.idx[i]);
	}
//	alert(myData.length + "myData 길이");
	
	//myData 값 테스트
//	for(var i = 0; i < myData.length; i++) {
//		alert(myData[i].values[0].x);
//	}
//	weightList.push(getData(idxList.idx));
//	alert("nv.addGraph 끝");
	
	
	
		
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
/*******************************************************************************
 * Simple test data generator
 */
//function sinAndCos() {
//  var sin = [],sin2 = [],
//      cos = [];
//
//  // Data is represented as an array of {x,y} pairs.
//  for (var i = 0; i < 100; i++) {
//    sin.push({x: i, y: Math.sin(i/10)});
//    sin2.push({x: i, y: Math.sin(i/10) *0.25 + 0.5});
//    cos.push({x: i, y: .5 * Math.cos(i/10)});
//  }
//
//  //Line chart data should be sent as an array of series objects.
//  return [
//    {
//      values: sin,      //values - represents the array of {x,y} data points
//      key: 'Sine Wave', //key  - the name of the series.
//      color: '#ff7f0e'  //color - optional: choose your own line color.
//    },
//    {
//      values: cos,
//      key: 'Cosine Wave',
//      color: '#2ca02c'
//    },
//    {
//      values: sin2,
//      key: 'Another sine wave',
//      color: '#7777ff',
//      area: true      //area - set to true if you want this line to turn into a filled area chart.
//    }
//  ];
//}

function getIdx() {
	var idxList;
	$.ajax({
		async : false,
		dataType : 'json',
		url : 'getIdxList.do',
		success : function(data) {
//			alert(data.idx);
			idxList = data;
//			alert(idxList.idx);
		}
	});
	return idxList;
}

function getData(idx) {
//	alert("getData AJAX 함수 진입, data : " + idx);
	var result;
//	var params = {"idxList" : idx};
	$.ajax({
		url : 'dataupload.do',
		async : false,
		dataType : 'json',
		type : 'GET',
		data : {"idx" : idx},
		
		//idx에 맞는 몸무게 기록들을 받아왔을 경우
		success : function(data) {
//			alert("getData AJAX - 성공시 출력");
			result = data.data;
//			alert("idx별 몸무게 기록 : " + data.data);
//			alert(data.data[0].weight);\
//			alert(data.data.length);
			
//			alert(data.idx);
//			alert(data.data[0][0]);
//			alert(data.data[0][1]);
			
			
//			var weightList = [];
//			for(var i = 0; i < data.wList.length; i++) {
//				var petWeight = [];
//				petWeight.push(data.wList[i]);
//			}
//			for (var i = 0; i < data.length; i++)
//				weightList.push({
//					key : "Pet " + (i + 1),
//					values : data[i]
//				})

//			$.each(data, function(i, d) {
//				weightList[(d.class_id) - 1]['values'].push(d)
//			});
//			result = weightList;
		},
		error : function() {
//			alert("getData AJAX 에러발생");
		}
	});
	
	return result;
}
