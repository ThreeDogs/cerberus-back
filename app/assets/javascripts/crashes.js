
function drawRatePieChart(div_id, data) {
	var width = d3.select("#"+div_id).style("width").split("px")[0];
	var height = width;

	var svg = d3.select("#"+div_id).append("svg")
				.attr("width",width).attr("height",height);

	var arc = d3.svg.arc().outerRadius(width/2-20).innerRadius(0);

	var pie = d3.layout.pie().sort(null).value(function(d) {return something});

	var pie_g = svg.append("g")
				.attr("transform","translate("+width/2+","+height/2+")");

	var pieces = svg.selectAll(".arc").data(pie(data)).enter()
				.append("g").attr("class","arc")

	pieces.append("path").attr("d",arc).style("fill","something")

	pieces.append("text")
		.attr("transform", function(d) {return "translate(" + arc.centroid(d) + ")"; })
		.attr("dy", ".35em").style("text-anchor", "middle")
		.text(function(d) {return "something"});

	function onResize() {
		
	}
}