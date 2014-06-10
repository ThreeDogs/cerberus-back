var resizeFunctions = [];
d3.select(window).on("resize",function () {
	for (var i in resizeFunctions){
		resizeFunctions[i]();
	}
});

function allErrorsTable(data) {
	var table = d3.select(".all-errors-table").html("");
	var row = table.append("tr");
	row.append("th").text("Rank");
	row.append("th").text("Error Count");
	row.append("th").text("Error Name");
	row.append("th").text("OS Version");
	
	row = table.selectAll("rows").data(data).enter().append("tr");
	row.append("td").append("div").attr("class",function (d) {return "rank "+d.error_rank}).text(function (d) {return d.error_rank});
	row.append("td").text(function (d) {return d.error_count});
	row.append("td").text(function (d) {return d.error_name});
	row.append("td").text(function (d) {
		var os_ver_string = "";
		for (i in d.os_versions) {
			os_ver_string = os_ver_string + d.os_versions[i] + " ";
		}
		return os_ver_string;
	})
	sidebarHeightCorrect();
}

function allTestsTable(data) {
	var table = d3.select(".all-tests-table").html("");
	var row = table.append("tr");
	row.append("th").text("Rank");
	row.append("th").text("Name");
	row.append("th").text("Status");
	row.append("th").text("Error");
	row.append("th").text("Device Count");
	row.append("th").text("Detail Report");
	
	row = table.selectAll("rows").data(data).enter().append("tr");
	row.append("td").append("div").attr("class",function (d) {return "rank "+d.get_rank}).text(function (d) {return d.get_rank});
	row.append("td").text(function (d) {return d.name});
	row.append("td").text(function (d) {return d.status});
	row.append("td").selectAll("crash").data(function (d) {return d.crashes}).enter()
		.append("p").text(function (d) {return d.error_name});
	row.append("td").text(function (d) {return d.device_count});
	row.append("td").text("link");

	sidebarHeightCorrect();
}

function allDevicesTable(data) {
	var div = d3.select(".device-error-list").html("");
	var each = div.selectAll(".device-error-each").data(data).enter()
				.append("div").attr("class","device-error-each");
	var detail = each.append("div").attr("class","device-error-detail");
	var table = each.append("div").attr("class","device-error-div")
				.append("table").attr("class","all-devices-table");

	detail.append("p").attr("class","device-name").append("u").text(function (d) {return d.model});
	detail.append("p").text(function (d) {return "OS Version: "+d.os_version});
	detail.append("p").text(function (d) {return "CPU: "+d.cpu});
	detail.append("p").text(function (d) {return "Country: "+d.country});

	var row = table.append("tr");
	row.append("th").text("Rank");
	row.append("th").text("Name");
	row.append("th").text("Status");
	row.append("th").text("Error");

	row = table.selectAll("rows").data(function (d) {return d.detail_reports}).enter().append("tr");
	row.append("td").text(function (d) {return d.rank});
	row.append("td").text(function (d) {return d.test_scenario_name});
	row.append("td").text(function (d) {
		if (d.status==-1){return "Fail"}
		else if (d.status==0){return "Warning"}
		else if (d.status==1){return "Success"}
	});
	row.append("td").text(function (d) {return d.error_name});
	sidebarHeightCorrect();
}

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

	var palette = function (i) {
		var colors = ["#EA7C4B","#ED9FBD","#52C4D0","#D6B6EF","#D36C44","#CE8AA6","#44ADB2","#B591D8"];
		return colors[i%(colors.length)];
	}
	
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

function crashPieChart(div_id, data) {
	var width = d3.select("#"+div_id).style("width").split("px")[0];
	var height = 120;
	var diameter = 120;
	var keys = Object.keys(data);

	var svg = d3.select("#"+div_id).append("svg")
				.attr("width",width).attr("height",height);

	var arc = d3.svg.arc().outerRadius(diameter/2).innerRadius(0);
	var arc_text = d3.svg.arc().outerRadius(diameter/2).innerRadius(diameter/2-40);

	var pie = d3.layout.pie().sort(null).value(function(d) {return data[d]});

	var pie_g = svg.append("g")
				.attr("transform","translate("+width*2/3+","+(height/2)+")");

	var palette = function (i) {
		var colors = ["#EA7C4B","#ED9FBD","#52C4D0","#D6B6EF","#D36C44","#CE8AA6","#44ADB2","#B591D8"];
		return colors[i%(colors.length)];
	}
	//d3.scale.category10();

	var pieces = pie_g.selectAll(".arc").data(pie(keys)).enter()
				.append("g").attr("class","arc")

	pieces.append("path").attr("d",arc).style("fill",function (d, i) {return palette(i)});

	pieces.append("text").attr("class","piece-label")
		.attr("transform", function(d) {return "translate("+arc_text.centroid(d)+")"; })
		.attr("dy", ".35em").style("text-anchor", "middle")
		.text(function(d) {return d.value});

	var title = svg.append("text").text("Error rate by rank")
		.attr("fill","#5E5E5E").attr("font-size","14px")
		.attr("transform","translate("+(width/3-10)+",20)");

	var legend = svg.append("g").attr("class","legend");
	var entries = [];
	for (i in keys) {
		var entry = legend.append("g").attr("transform","translate("+legendPosition(i)+")");
		entry.append("circle").attr("r",5).attr("fill",palette(i));
		entry.append("text").attr("dx","10px").attr("dy","3px").text(keys[i]);
		entries.push(entry);
	}

	function legendPosition (i) {
		return ""+(width/3 + i*40)+",80";
	}

	function onResize() {
		width = d3.select("#"+div_id).style("width").split("px")[0];
		svg.attr("width",width);
		title.attr("transform","translate("+(width/3-10)+",20)");
		pie_g.attr("transform","translate("+width*2/3+","+(height/2)+")");
		for (i in entries) {
			entries[i].attr("transform","translate("+legendPosition(i)+")");
		}
	}
	resizeFunctions.push(onResize);
}