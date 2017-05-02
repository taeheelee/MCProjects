function draw(d){
	var data = d;
	var weightList = JSON.parse(data);
	var dateArr = [];
	var weightArr = [];
	var dataSet = [];
	
	for(var i = 0; i < weightList.length; i++) {
		dateArr.push(weightList[i].date);
		dataSet.push(weightList[i].weight);
	}
	
//	console.log(dataSet);
//	var dataSet = [ 210, 400, 110, 130, 200, 80 ];
			var svgWidth = 200;
			var svgHeight = 500;
			var offsetX = 30;
			var offsetY = 20;
			var barWidth = 25;
			var scale = 2.0;
			var margin = (svgWidth-dataSet.length*barWidth)/(dataSet.length - 1);
			var dataMax = 300;
			
			var barElements = d3.select("#d3g")
			.selectAll("rect")
			.data(dataSet)
			
			barElements.enter()
			.append("rect")
			.attr("height", 0)
			.attr("width", barWidth)
			.attr("x", function(d,i){
				return i *(barWidth+margin)+offsetX;
			})
			.attr("y", svgHeight-offsetY)
			.transition()
			.duration(2500) //ms 시간
			.attr("y", function(d,i){
				return svgHeight-d-offsetY;
			})
			.attr("height", function(d,i){
				return d;
			});
			
			//눈금표시를 위한 선형스케일 설정
			var yScale = d3.scale.linear()
			.domain([0, 3])
			.range([300, 0]);
			
			//눈금을 설정
			d3.select("#d3g")
			.append("g")
			.attr("class", "axis")
			//표시위치 조정
			.attr("transform", "translate("+offsetX+","+((svgHeight-300)-offsetY)+")")
			.call(
				d3.svg.axis()
				.orient("left")
				.scale(yScale)
			);
			
			//가로방향 선표시
			d3.select("#d3g")
			.append("rect")
			.attr("class", "axis_x")
			.attr("width", svgWidth)
			.attr("height", 1)
			.attr("transform", "translate("+offsetX+","+(svgHeight-offsetY)+")");
}