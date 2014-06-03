var resizeFunctions = [];
d3.select(window).on("resize",function () {
	for (var i in resizeFunctions){
		resizeFunctions[i]();
	}
});

function drawRatePieChart(div_id, data) {
	var width = d3.select("#"+div_id).style("width").split("px")[0];
	var height = 200;
	var diameter = 180 //(width<height)?width-20:height-20;
	var keys = Object.keys(data);

	var svg = d3.select("#"+div_id).append("svg")
				.attr("width",width).attr("height",height);

	var arc = d3.svg.arc().outerRadius(diameter/2-20).innerRadius(0);
	var arc_text = d3.svg.arc().outerRadius(diameter/2-20).innerRadius(diameter/2-40);

	var pie = d3.layout.pie().sort(null).value(function(d) {return data[d]});

	var pie_g = svg.append("g")
				.attr("transform","translate("+width/2+","+(height/2+20)+")");

	var palette = d3.scale.category10();

	var pieces = pie_g.selectAll(".arc").data(pie(keys)).enter()
				.append("g").attr("class","arc")

	pieces.append("path").attr("d",arc).style("fill",function (d, i) {return palette(i)});

	pieces.append("text").attr("class","piece-label")
		.attr("transform", function(d) {return "translate("+arc_text.centroid(d)+")"; })
		.attr("dy", ".35em").style("text-anchor", "middle")
		.text(function(d) {return d.value});

	var legend = svg.append("g").attr("class","legend");
	var entries = [];
	for (i in keys) {
		var entry = legend.append("g").attr("transform","translate("+legendPosition(i)+")");
		entry.append("circle").attr("r",5).attr("fill",palette(i));
		entry.append("text").attr("dx","10px").attr("dy","3px").text(keys[i]);
		entries.push(entry);
	}

	function legendPosition (i) {
		var LENGTH = 50;
		var index = i*LENGTH+10;
		return ""+(index%(width-LENGTH))+","+(10+Math.floor(index/(width-LENGTH))*15);
	}

	function onResize() {
		width = d3.select("#"+div_id).style("width").split("px")[0];
		svg.attr("width",width);
		pie_g.attr("transform","translate("+width/2+","+(height/2+20)+")");
		for (i in entries) {
			entries[i].attr("transform","translate("+legendPosition(i)+")");
		}
	}
	resizeFunctions.push(onResize);
}