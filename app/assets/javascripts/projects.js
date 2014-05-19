function band_chart_exception (num) {
	var percentage = (100/num)+'%';
	$('.test_fail_each').css('width',percentage);
}

var resizeFunctions = [];
d3.select(window).on("resize",function () {
	for (var i in resizeFunctions){
		resizeFunctions[i]();
	}
});

function drawFailByDevice (data) {

	var fail_by_device_svg = d3.select("#test_fail_bar_graph").append("svg")
								.attr("width",700).attr("height",350);

	var y_domain = [];
	for (var each in data) {
		y_domain.push(data[each].device_name);
	}

	var x_extent = [0,data[0].fail_data.A.length+data[0].fail_data.B.length+data[0].fail_data.C.length+data[0].fail_data.D.length];

	var x_scale = d3.scale.linear().domain(x_extent).range([120,600]);
	var y_scale = d3.scale.ordinal().domain(y_domain).rangeRoundBands([300,30],0.3,0.3);

	var x_axis = fail_by_device_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,300)")
				.call(d3.svg.axis()
					.scale(x_scale)
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = fail_by_device_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate(120,0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.orient("left"));

	var columns = fail_by_device_svg.selectAll("g column")
		.data(data).enter().append("g")
			.attr("class","device_row")
			.attr("transform",function (d) {return "translate(120,"+y_scale(d.device_name)+")"});
	
	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.A.length)-x_scale(0);}).attr("height",40)
			.attr("x",function (d) {return x_scale(0)-x_scale(0);}).attr("y",0)
			.attr("fill","#EA7C4B")
			.on("click",function (d) {renewDetailTable("A", d.device_name, d.fail_data.A)});

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.B.length)-x_scale(0);}).attr("height",40)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length)-x_scale(0);}).attr("y",0)
			.attr("fill","#ED9FBD")
			.on("click",function (d) {renewDetailTable("B", d.device_name, d.fail_data.B)});

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.C.length)-x_scale(0);}).attr("height",40)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length+d.fail_data.B.length)-x_scale(0);}).attr("y",0)
			.attr("fill","#52C4D0")
			.on("click",function (d) {renewDetailTable("C", d.device_name, d.fail_data.C)});

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.D.length)-x_scale(0);}).attr("height",40)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length+d.fail_data.B.length+d.fail_data.C.length)-x_scale(0);}).attr("y",0)
			.attr("fill","#D6B6EF")
			.on("click",function (d) {renewDetailTable("D", d.device_name, d.fail_data.D)});


	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.A.length)-x_scale(0);}).attr("height",8)
			.attr("x",function (d) {return x_scale(0)-x_scale(0);}).attr("y",32)
			.attr("fill","#C1633E");

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.B.length)-x_scale(0);}).attr("height",8)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length)-x_scale(0);}).attr("y",32)
			.attr("fill","#BF7593");

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.C.length)-x_scale(0);}).attr("height",8)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length+d.fail_data.B.length)-x_scale(0);}).attr("y",32)
			.attr("fill","#34989A");

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.D.length)-x_scale(0);}).attr("height",8)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length+d.fail_data.B.length+d.fail_data.C.length)-x_scale(0);}).attr("y",32)
			.attr("fill","#A28BBC");

	function renewDetailTable (rank, device_name, error_array) {

		d3.select("#table_title_rank").text(rank);
		d3.select("#table_title_device_name").text(device_name);

		//TODO: hyperlink to specific report page

		d3.select("#detail_table").remove();
		var detail_table = d3.select("#test_fail_chart").append("table").attr("id","detail_table");
		var table_label = detail_table.append("tr").attr("class","table_head");
		table_label.append("td").attr("class","name").text("Name");
		table_label.append("td").attr("class","error").text("Error");

		for (var row in error_array) {
			var row_tr = detail_table.append("tr");
			row_tr.append("td").text(error_array[row].scenario_name);
			row_tr.append("td").text(error_array[row].error_message);
		}
	}

}


function drawTestResults(test_results_data) {

	var width = d3.select("#test-results").style("width").split("px")[0];
	var height = d3.select("#test-results").style("height").split("px")[0]-40;
	var margin = {top:10,right:40,bottom:20,left:40};

	var test_results_svg = d3.select("#test-results")
							.append("svg")
							.attr("width",width)
							.attr("height",height);

	var run_scale = d3.scale.linear().domain([0.7,10.3]).range([margin.left,width-margin.right]);
	var y_scale = d3.scale.linear().domain([0,110]).range([height-margin.bottom,margin.top]);

	var x_axis = test_results_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(d3.svg.axis()
					.scale(run_scale)
					.tickFormat(function (d) {return "run "+d})
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = test_results_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate("+margin.left+",0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.tickSize(-(width-margin.left-margin.right),0)
					.ticks(5)
					.orient("left"));

	function Field (svg, field_name) {
		var line = d3.svg.line();
		var area = d3.svg.area()
		var path = svg.append("path").attr("class",field_name+"-path");
		var shade = svg.append("path").attr("class",field_name+"-area");
		return {line: line, area: area, path: path, shade: shade};
	}

	var failure = new Field(test_results_svg, 'failure');
	var warning = new Field(test_results_svg, 'warning');
	var pass = new Field(test_results_svg, 'pass');

	failure.path.moveToFront();
	warning.path.moveToFront();
	pass.path.moveToFront();
	
	function fieldResize() {
		failure.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.failure/(d.failure+d.warning+d.pass)*100)});
		failure.path.attr("d",failure.line(test_results_data));
		failure.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.failure/(d.failure+d.warning+d.pass)*100)});
		failure.shade.attr("d",failure.area(test_results_data));

		warning.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale((d.failure+d.warning)/(d.failure+d.warning+d.pass)*100)});
		warning.path.attr("d",warning.line(test_results_data));
		warning.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale((d.failure+d.warning)/(d.failure+d.warning+d.pass)*100)});
		warning.shade.attr("d",warning.area(test_results_data));

		pass.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(100)});
		pass.path.attr("d",pass.line(test_results_data));
		pass.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(100)});
		pass.shade.attr("d",pass.area(test_results_data));
	};
	fieldResize();

	function onResize () {
		width = d3.select("#test-results").style("width").split("px")[0];
		test_results_svg.attr("width",width);
		run_scale.range([margin.left,width-margin.right]);
		fieldResize();
		x_axis.call(d3.svg.axis()
					.scale(run_scale)
					.tickFormat(function (d) {return "run "+d})
					.innerTickSize(3)
					.outerTickSize(0));
		y_axis.call(d3.svg.axis()
					.scale(y_scale)
					.tickSize(-(width-margin.left-margin.right),0)
					.ticks(5)
					.orient("left"));
	}
	resizeFunctions.push(onResize);

	// var legend = test_results_svg.append("g").attr("class","legend")
	// 			.attr("transform","translate(830,70)");
	// legend.append("line").attr("x1",0).attr("x2",24).attr("y1",15).attr("y2",15)
	// 	.attr("stroke-width",2.5).attr("stroke","#E4603C");
	// legend.append("circle").attr("r",6).attr("cx",12).attr("cy",15)
	// 	.attr("stroke-width",2.5).attr("stroke","#E4603C").attr("fill","white");
	// legend.append("text").attr("transform","translate(30,18)")
	// 	.text("MAX");
	// legend.append("line").attr("x1",0).attr("x2",24).attr("y1",30).attr("y2",30)
	// 	.attr("stroke-width",2.5).attr("stroke","#F7CE25");
	// legend.append("circle").attr("r",6).attr("cx",12).attr("cy",30)
	// 	.attr("stroke-width",2.5).attr("stroke","#F7CE25").attr("fill","white");
	// legend.append("text").attr("transform","translate(30,33)")
	// 	.text("AVG");
	// legend.append("line").attr("x1",0).attr("x2",24).attr("y1",45).attr("y2",45)
	// 	.attr("stroke-width",2.5).attr("stroke","#5DBE88");
	// legend.append("circle").attr("r",6).attr("cx",12).attr("cy",45)
	// 	.attr("stroke-width",2.5).attr("stroke","#5DBE88").attr("fill","white");
	// legend.append("text").attr("transform","translate(30,48)")
	// 	.text("MIN");
}

function drawCPUusage(cpu_trend_data) {

	var width = d3.select("#cpu-trend").style("width").split("px")[0];
	var height = d3.select("#cpu-trend").style("height").split("px")[0]-40;
	var margin = {top:10,right:40,bottom:20,left:40};

	var cpu_trend_svg = d3.select("#cpu-trend")
							.append("svg")
							.attr("width",width)
							.attr("height",height);

	var run_scale = d3.scale.linear().domain([0.7,10.3]).range([margin.left,width-margin.right]);
	var y_scale = d3.scale.linear().domain([0,110]).range([height-margin.bottom,margin.top]);

	var x_axis = cpu_trend_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(d3.svg.axis()
					.scale(run_scale)
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = cpu_trend_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate("+margin.left+",0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.tickSize(-(width-margin.left-margin.right),0)
					.ticks(5)
					.orient("left"));

	function Field (svg, field_name) {
		var line = d3.svg.line();
		var area = d3.svg.area()
		var path = svg.append("path").attr("class",field_name+"-path");
		var shade = svg.append("path").attr("class",field_name+"-area");
		return {line: line, area: area, path: path, shade: shade};
	}

	var max = new Field(cpu_trend_svg, 'max');
	var avg = new Field(cpu_trend_svg, 'avg');
	var min = new Field(cpu_trend_svg, 'min');

	max.path.moveToFront();
	avg.path.moveToFront();
	min.path.moveToFront();
	
	function fieldResize() {
		max.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.max)});
		max.path.attr("d",max.line(cpu_trend_data));
		max.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.max)});
		max.shade.attr("d",max.area(cpu_trend_data));

		avg.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.avg)});
		avg.path.attr("d",avg.line(cpu_trend_data));
		avg.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.avg)});
		avg.shade.attr("d",avg.area(cpu_trend_data));

		min.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.min)});
		min.path.attr("d",min.line(cpu_trend_data));
		min.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.min)});
		min.shade.attr("d",min.area(cpu_trend_data));
	};
	fieldResize();

	function onResize () {
		width = d3.select("#cpu-trend").style("width").split("px")[0];
		cpu_trend_svg.attr("width",width);
		run_scale.range([margin.left,width-margin.right]);
		fieldResize();
		x_axis.call(d3.svg.axis()
					.scale(run_scale)
					.innerTickSize(3)
					.outerTickSize(0));
		y_axis.call(d3.svg.axis()
					.scale(y_scale)
					.tickSize(-(width-margin.left-margin.right),0)
					.ticks(5)
					.orient("left"));
	}
	resizeFunctions.push(onResize);
}