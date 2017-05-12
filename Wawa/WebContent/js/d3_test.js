function draw(d){
	var data = d;
	var weightList = JSON.parse(data);
	var dateArr = [];
	var weightArr = [];
	
	for(var i = 0; i < weightList.length; i++) {
		dateArr.push(weightList[i].date); //db에서꺼낸 날짜 목록
		weightArr.push(weightList[i].weight); //db에서 꺼낸 무게 목록
	}
//	for(var i = 0; i < dateArr.length; i++) {
//		var d = new Date(dateArr[i]);
//		alert(d.getDate());
//	}
	var svgWidth = 200;
	var svgHeight = 350;
	var offsetX = 30; //그래프의 막대 위치 조정하기 위함
	var offsetY = 220; //모서리에서 일정 간격 띄워 배치
	var barElements;
	var dataMax = 50;
	var barWidth = 10;
	var barMargin = 5;
	
	barElements = d3.select("#myGraph")
	.selectAll("rect")
	.data(weightArr)
	
	barElements.enter()
	.append("rect")
	.attr("class", "bar")
	.attr("height", 0) //세로축 애니메이션
// 	.attr("height", function(d,i) {
// 		return d;
// 	})
	.attr("width", barWidth)
	.attr("x", function(d,i) {
		return i * (barWidth + barMargin) + offsetX;
	})
	.attr("y", svgHeight - offsetY)//세로축 애니메이션
	//이벤트 추가
	.on("mouseover", function() {
		d3.select(this)
		.style("fill", "red")
	})
	.on("mouseout", function() {
		d3.select(this)
		.style("fill", "orange")
	})
	
	//애니메이션 처리
	.transition()
	.duration(1500) //시간지정
	.delay(function(d, i) {//가로축 애니메이션
		return i * 100;
	})
	.attr("y", function(d, i){
		return svgHeight - d - offsetY;
	})
	.attr("height", function(d,i) {
		return d;
	})
// 	.attr("y", function(d,i) {
// 		return svgHeight - d - offsetY;
// 	})

	barElements.enter()
		.append("text")
		.attr("class", "barNum")
		.attr("x", function(d, i) {
			return i * (barWidth + barMargin) + 10 + offsetX;
		})
		.attr("y", svgHeight - 5 - offsetY)
		.text(function(d,i) {
			return d;
		})

	//눈금을 표시하기 위한 스케일 설정
	var yScale = d3.scale.linear()
		.domain([0, dataMax])
		.range([dataMax, 0])
		
	//눈금 설정하여 표시하기
	d3.select("#myGraph")
		.append("g")
		.attr("class", "axis")
//		.attr("transform", "translate("+offsetX+", "+((svgHeight-300)-offsetY)+")")
		.attr("transform", "translate("+ 30 +", "+ 30 +")")
		.call(
			d3.svg.axis()
			.scale(yScale)
			.orient("left")//눈금 표시 위치
//			.ticks(10)//눈금 간격
	// 		.tickValues([10, 20, 30, 50, 100, 150, 200, 250, 300])
		)
	d3.select("#myGraph")//그래프 바닥에 가로줄
		.append("rect")
		.attr("class", "axis_x")
		.attr("width", svgWidth)
		.attr("height", 1)
		.attr("transform", "translate("+offsetX+", "+(svgHeight-offsetY)+")")
	//막대 레이블 표시
	barElements.enter()//그래프 레이블
		.append("text")
		.attr("class", "barName")
		.attr("x", function(d, i) {
			return i * (barWidth + barMargin) + 10 + offsetX;
		})
		.attr("y", svgHeight - offsetY + 15)
		.text(function(d,i) {
			return dateArr[i];
		})
}
