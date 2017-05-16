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
	chart.xAxis // X축 날짜 표시
    .showMaxMin(false)
    .tickFormat(function(d) {
      var dx = data[0].values[d] && data[0].values[d][0] || 0;
      return d3.time.format('%x')(new Date(dx))
    });
	
	chart.yAxis // Chart y-axis settings
	.axisLabel('Weight(Kg)').tickFormat(d3.format('.02f'));

	/* Done setting the chart up? Time to render it! */
//	var myData = sinAndCos(); // You need data...
	var myData = getData(); // You need data...

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
function sinAndCos() {
  var sin = [],sin2 = [],
      cos = [];

  // Data is represented as an array of {x,y} pairs.
  for (var i = 0; i < 100; i++) {
    sin.push({x: i, y: Math.sin(i/10)});
    sin2.push({x: i, y: Math.sin(i/10) *0.25 + 0.5});
    cos.push({x: i, y: .5 * Math.cos(i/10)});
  }

  //Line chart data should be sent as an array of series objects.
  return [
    {
      values: sin,      //values - represents the array of {x,y} data points
      key: 'Sine Wave', //key  - the name of the series.
      color: '#ff7f0e'  //color - optional: choose your own line color.
    },
    {
      values: cos,
      key: 'Cosine Wave',
      color: '#2ca02c'
    },
    {
      values: sin2,
      key: 'Another sine wave',
      color: '#7777ff',
      area: true      //area - set to true if you want this line to turn into a filled area chart.
    }
  ];
}

function getData() {
	var result;
	$.ajax({
		async : false,
		dataType : 'json',
		url : 'dataupload.do',
		success : function(data) {
			var weightList = [];
			for (var i = 0; i < data.length; i++)
				weightList.push({
					key : "Pet " + (i + 1),
					values : data[i]
				})

//			$.each(data, function(i, d) {
//				weightList[(d.class_id) - 1]['values'].push(d)
//			});
			result = weightList;
		}
	});
	return result;
}
// var result;
// $.ajax({
// async:false,
// dataType:'json',
// url:'dataupload.do',
// success: function(data){
//	        var wines = [];
//	        for (var i=0; i<3; i++)
//	          wines.push({key:"Class " + (i+1), values:[]})
//	        
//	        $.each(data, function(i, d){
//	          wines[(d.class_id)-1]['values'].push(
//	              {
//	                x: d.Alcohol,
//	                y: d.Color_intensity,
//	                size: d.Hue
//	              }
//	            )
//	        });
//	        result = wines;
//	      }
//	    });
//	  return result;
//	}
