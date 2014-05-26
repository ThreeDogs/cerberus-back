function band_chart_exception (id, num) {
	var percentage = (100/num)+'%';
	$(id).css('width',percentage);
}

var resizeFunctions = [];
d3.select(window).on("resize",function () {
	for (var i in resizeFunctions){
		resizeFunctions[i]();
	}
});

function drawFailByDevice (data) {

	var width = d3.select("#test_fail_bar_graph").style("width").split("px")[0];
	var height = d3.select("#test_fail_bar_graph").style("height").split("px")[0];
	var margin = {top: 10, right: 10, bottom: 30, left: 100};

	var svg = d3.select("#test_fail_bar_graph").append("svg")
				.attr("width",width).attr("height",height);

	var y_domain = [];
	for (var each in data) {
		y_domain.push(data[each].device_name);
	}

	var x_extent = [0,data[0].fail_data.A.length+data[0].fail_data.B.length+data[0].fail_data.C.length+data[0].fail_data.D.length];

	var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
	var y_scale = d3.scale.ordinal().domain(y_domain).rangeRoundBands([height-margin.bottom,margin.top],0.3,0.3);

	var x_axis = svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(d3.svg.axis()
					.scale(x_scale)
					.orient("bottom")
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate("+margin.left+",0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.orient("left")
					.innerTickSize(3)
					.outerTickSize(0));

	var columns = svg.selectAll("device-column")
				.data(data).enter().append("g")
				.attr("class","device_row")
				.style("cursor","pointer")
				.attr("transform",function (d) {return "translate("+margin.left+","+y_scale(d.device_name)+")"});

	var rect_height = (height-margin.top-margin.bottom) / data.length * 0.4;

	columns.each(function (d, i){
		var sum = 0;
		var ranks = ["A","B","C","D"]
		for (var index in ranks) {
			var rank = ranks[index];
			if(d.fail_data[rank]) {
				d3.select(this).append("rect").attr("class",rank)
					.attr("width",x_scale(d.fail_data[rank].length)-x_scale(0))
					.attr("height",rect_height)
					.attr("x",x_scale(sum)-margin.left)
					.attr("y",0)
					.on("click",function (d) {
						rank = d3.select(this).attr("class");
						renewDetailTable(rank, d.device_name, d.fail_data[rank]);
					})
				sum = sum + d.fail_data[rank].length;
			}
		}
	})

	function onResize() {
		width = d3.select("#test_fail_bar_graph").style("width").split("px")[0];
		svg.attr("width".width);
		x_scale.range([margin.left,width-margin.right]);
		x_axis.call(d3.svg.axis().scale(x_scale).orient("bottom").innerTickSize(3).outerTickSize(0));
		columns.each(function (d, i){
			var sum = 0;
			var ranks = ["A","B","C","D"]
			for (var index in ranks) {
				var rank = ranks[index];
				if(d.fail_data[rank]) {
					d3.select(this).select("."+rank)
						.attr("width",x_scale(d.fail_data[rank].length)-x_scale(0))
						.attr("x",x_scale(sum)-margin.left)
					sum = sum + d.fail_data[rank].length;
				}
			}
		});
	}
	resizeFunctions.push(onResize);

	function renewDetailTable (rank, device_name, error_array) {

		d3.select("#table_title_rank").attr("class","test_rank "+rank).text(rank);
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

	var dotgg = test_results_svg.append("g");
	var dotg = dotgg.selectAll(".dot")
					.data(test_results_data).enter().append("g").attr("opacity",0)
					.on("mouseover", function () {
						d3.select(this).transition().attr("opacity",1);
					})
					.on("mouseout", function () {
						d3.select(this).transition().attr("opacity",0);
					});

	function Field (svg, field_name) {
		var line = d3.svg.line();
		var area = d3.svg.area()
		var path = svg.append("path").attr("class",field_name+"-path");
		var shade = svg.append("path").attr("class",field_name+"-area");
		var dot = dotg.append("circle").attr("class",field_name+"-dot")
						.attr("r",8).attr("stroke","none");
		return {line: line, area: area, path: path, shade: shade, dot: dot};
	}

	var pass = new Field(test_results_svg, 'pass');
	var warning = new Field(test_results_svg, 'warning');
	var failure = new Field(test_results_svg, 'failure');

	failure.path.moveToFront();
	warning.path.moveToFront();
	pass.path.moveToFront();
	dotgg.moveToFront();

	function fieldResize() {
		failure.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.failure/(d.failure+d.warning+d.pass)*100)});
		failure.path.attr("d",failure.line(test_results_data));
		failure.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.failure/(d.failure+d.warning+d.pass)*100)});
		failure.shade.attr("d",failure.area(test_results_data));
		failure.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.failure/(d.failure+d.warning+d.pass)*100)+")"
		});

		warning.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale((d.failure+d.warning)/(d.failure+d.warning+d.pass)*100)});
		warning.path.attr("d",warning.line(test_results_data));
		warning.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale((d.failure+d.warning)/(d.failure+d.warning+d.pass)*100)});
		warning.shade.attr("d",warning.area(test_results_data));
		warning.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale((d.failure+d.warning)/(d.failure+d.warning+d.pass)*100)+")"
		});

		pass.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(100)});
		pass.path.attr("d",pass.line(test_results_data));
		pass.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(100)});
		pass.shade.attr("d",pass.area(test_results_data));
		pass.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(100)+")"
		});
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

	var dotgg = cpu_trend_svg.append("g");
	var dotg = dotgg.selectAll(".dot")
					.data(cpu_trend_data).enter().append("g").attr("opacity",0)
					.on("mouseover", function () {
						d3.select(this).transition().attr("opacity",1);
					})
					.on("mouseout", function () {
						d3.select(this).transition().attr("opacity",0);
					});

	function Field (svg, field_name) {
		var line = d3.svg.line();
		var area = d3.svg.area()
		var path = svg.append("path").attr("class",field_name+"-path");
		var shade = svg.append("path").attr("class",field_name+"-area");
		var dot = dotg.append("circle").attr("class",field_name+"-dot")
						.attr("r",8).attr("stroke","none");
		return {line: line, area: area, path: path, shade: shade, dot: dot};
	}

	var min = new Field(cpu_trend_svg, 'min');
	var avg = new Field(cpu_trend_svg, 'avg');
	var max = new Field(cpu_trend_svg, 'max');

	max.path.moveToFront();
	avg.path.moveToFront();
	min.path.moveToFront();
	dotgg.moveToFront();
	
	function fieldResize() {
		max.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.max)});
		max.path.attr("d",max.line(cpu_trend_data));
		max.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.max)});
		max.shade.attr("d",max.area(cpu_trend_data));
		max.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.max)+")";
		});

		avg.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.avg)});
		avg.path.attr("d",avg.line(cpu_trend_data));
		avg.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.avg)});
		avg.shade.attr("d",avg.area(cpu_trend_data));
		avg.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.avg)+")";
		});

		min.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.min)});
		min.path.attr("d",min.line(cpu_trend_data));
		min.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.min)});
		min.shade.attr("d",min.area(cpu_trend_data));
		min.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.min)+")";
		});
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

function drawMemUsage(mem_trend_data) {

	var width = d3.select("#mem-trend").style("width").split("px")[0];
	var height = d3.select("#mem-trend").style("height").split("px")[0]-40;
	var margin = {top:10,right:40,bottom:20,left:40};

	var mem_trend_svg = d3.select("#mem-trend")
							.append("svg")
							.attr("width",width)
							.attr("height",height);

	var y_domain = [0, d3.max(mem_trend_data, function (d) {return d.max})];

	var run_scale = d3.scale.linear().domain([0.7,10.3]).range([margin.left,width-margin.right]);
	var y_scale = d3.scale.linear().domain(y_domain).range([height-margin.bottom,margin.top]);

	var x_axis = mem_trend_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(d3.svg.axis()
					.scale(run_scale)
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = mem_trend_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate("+margin.left+",0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.tickSize(-(width-margin.left-margin.right),0)
					.ticks(5)
					.orient("left"));

	var dotgg = mem_trend_svg.append("g");
	var dotg = dotgg.selectAll(".dot")
					.data(mem_trend_data).enter().append("g").attr("opacity",0)
					.on("mouseover", function () {
						d3.select(this).transition().attr("opacity",1);
					})
					.on("mouseout", function () {
						d3.select(this).transition().attr("opacity",0);
					});

	function Field (svg, field_name) {
		var line = d3.svg.line();
		var area = d3.svg.area()
		var path = svg.append("path").attr("class",field_name+"-path");
		var shade = svg.append("path").attr("class",field_name+"-area");
		var dot = dotg.append("circle").attr("class",field_name+"-dot")
						.attr("r",8).attr("stroke","none");
		return {line: line, area: area, path: path, shade: shade, dot: dot};
	}

	var min = new Field(mem_trend_svg, 'min');
	var avg = new Field(mem_trend_svg, 'avg');
	var max = new Field(mem_trend_svg, 'max');

	max.path.moveToFront();
	avg.path.moveToFront();
	min.path.moveToFront();
	dotgg.moveToFront();
	
	function fieldResize() {
		max.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.max)});
		max.path.attr("d",max.line(mem_trend_data));
		max.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.max)});
		max.shade.attr("d",max.area(mem_trend_data));
		max.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.max)+")";
		});

		avg.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.avg)});
		avg.path.attr("d",avg.line(mem_trend_data));
		avg.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.avg)});
		avg.shade.attr("d",avg.area(mem_trend_data));
		avg.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.avg)+")";
		});

		min.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.min)});
		min.path.attr("d",min.line(mem_trend_data));
		min.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.min)});
		min.shade.attr("d",min.area(mem_trend_data));
		min.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.min)+")";
		});
	};
	fieldResize();

	function onResize () {
		width = d3.select("#mem-trend").style("width").split("px")[0];
		mem_trend_svg.attr("width",width);
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

function drawNetworkTrend(network_trend_data) {

	var width = d3.select("#network-trend").style("width").split("px")[0];
	var height = d3.select("#network-trend").style("height").split("px")[0]-40;
	var margin = {top:10,right:40,bottom:20,left:40};

	var network_trend_svg = d3.select("#network-trend")
							.append("svg")
							.attr("width",width)
							.attr("height",height);

	var y_domain = [0, d3.max(network_trend_data, function (d) {return d.max})];

	var run_scale = d3.scale.linear().domain([0.7,10.3]).range([margin.left,width-margin.right]);
	var y_scale = d3.scale.linear().domain(y_domain).range([height-margin.bottom,margin.top]);

	var x_axis = network_trend_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(d3.svg.axis()
					.scale(run_scale)
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = network_trend_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate("+margin.left+",0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.tickSize(-(width-margin.left-margin.right),0)
					.ticks(5)
					.orient("left"));

	var dotgg = network_trend_svg.append("g");
	var dotg = dotgg.selectAll(".dot")
					.data(network_trend_data).enter().append("g").attr("opacity",0)
					.on("mouseover", function () {
						d3.select(this).transition().attr("opacity",1);
					})
					.on("mouseout", function () {
						d3.select(this).transition().attr("opacity",0);
					});

	function Field (svg, field_name) {
		var line = d3.svg.line();
		var area = d3.svg.area()
		var path = svg.append("path").attr("class",field_name+"-path");
		var shade = svg.append("path").attr("class",field_name+"-area");
		var dot = dotg.append("circle").attr("class",field_name+"-dot")
						.attr("r",8).attr("stroke","none");
		return {line: line, area: area, path: path, shade: shade, dot: dot};
	}

	var min = new Field(network_trend_svg, 'min');
	var avg = new Field(network_trend_svg, 'avg');
	var max = new Field(network_trend_svg, 'max');

	max.path.moveToFront();
	avg.path.moveToFront();
	min.path.moveToFront();
	dotgg.moveToFront();
	
	function fieldResize() {
		max.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.max)});
		max.path.attr("d",max.line(network_trend_data));
		max.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.max)});
		max.shade.attr("d",max.area(network_trend_data));
		max.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.max)+")";
		});

		avg.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.avg)});
		avg.path.attr("d",avg.line(network_trend_data));
		avg.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.avg)});
		avg.shade.attr("d",avg.area(network_trend_data));
		avg.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.avg)+")";
		});

		min.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.min)});
		min.path.attr("d",min.line(network_trend_data));
		min.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.min)});
		min.shade.attr("d",min.area(network_trend_data));
		min.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.min)+")";
		});
	};
	fieldResize();

	function onResize () {
		width = d3.select("#network-trend").style("width").split("px")[0];
		network_trend_svg.attr("width",width);
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

function drawBatteryTrend(battery_trend_data) {

	var width = d3.select("#battery-trend").style("width").split("px")[0];
	var height = d3.select("#battery-trend").style("height").split("px")[0]-40;
	var margin = {top:10,right:40,bottom:20,left:40};

	var battery_trend_svg = d3.select("#battery-trend")
							.append("svg")
							.attr("width",width)
							.attr("height",height);

	var y_domain = [0, d3.max(battery_trend_data, function (d) {return d.max})];

	var run_scale = d3.scale.linear().domain([0.7,10.3]).range([margin.left,width-margin.right]);
	var y_scale = d3.scale.linear().domain(y_domain).range([height-margin.bottom,margin.top]);

	var x_axis = battery_trend_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(d3.svg.axis()
					.scale(run_scale)
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = battery_trend_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate("+margin.left+",0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.tickSize(-(width-margin.left-margin.right),0)
					.ticks(5)
					.orient("left"));

	var dotgg = battery_trend_svg.append("g");
	var dotg = dotgg.selectAll(".dot")
					.data(battery_trend_data).enter().append("g").attr("opacity",0)
					.on("mouseover", function () {
						d3.select(this).transition().attr("opacity",1);
					})
					.on("mouseout", function () {
						d3.select(this).transition().attr("opacity",0);
					});

	function Field (svg, field_name) {
		var line = d3.svg.line();
		var area = d3.svg.area()
		var path = svg.append("path").attr("class",field_name+"-path");
		var shade = svg.append("path").attr("class",field_name+"-area");
		var dot = dotg.append("circle").attr("class",field_name+"-dot")
						.attr("r",8).attr("stroke","none");
		return {line: line, area: area, path: path, shade: shade, dot: dot};
	}

	var min = new Field(battery_trend_svg, 'min');
	var avg = new Field(battery_trend_svg, 'avg');
	var max = new Field(battery_trend_svg, 'max');

	max.path.moveToFront();
	avg.path.moveToFront();
	min.path.moveToFront();
	dotgg.moveToFront();
	
	function fieldResize() {
		max.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.max)});
		max.path.attr("d",max.line(battery_trend_data));
		max.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.max)});
		max.shade.attr("d",max.area(battery_trend_data));
		max.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.max)+")";
		});

		avg.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.avg)});
		avg.path.attr("d",avg.line(battery_trend_data));
		avg.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.avg)});
		avg.shade.attr("d",avg.area(battery_trend_data));
		avg.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.avg)+")";
		});

		min.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.min)});
		min.path.attr("d",min.line(battery_trend_data));
		min.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.min)});
		min.shade.attr("d",min.area(battery_trend_data));
		min.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.min)+")";
		});
	};
	fieldResize();

	function onResize () {
		width = d3.select("#battery-trend").style("width").split("px")[0];
		battery_trend_svg.attr("width",width);
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

function drawThreadTrend(thread_trend_data) {

	var width = d3.select("#thread-trend").style("width").split("px")[0];
	var height = d3.select("#thread-trend").style("height").split("px")[0]-40;
	var margin = {top:10,right:40,bottom:20,left:40};

	var thread_trend_svg = d3.select("#thread-trend")
							.append("svg")
							.attr("width",width)
							.attr("height",height);

	var y_domain = [0, d3.max(thread_trend_data, function (d) {return d.max})];

	var run_scale = d3.scale.linear().domain([0.7,10.3]).range([margin.left,width-margin.right]);
	var y_scale = d3.scale.linear().domain(y_domain).range([height-margin.bottom,margin.top]);

	var x_axis = thread_trend_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(d3.svg.axis()
					.scale(run_scale)
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = thread_trend_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate("+margin.left+",0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.tickSize(-(width-margin.left-margin.right),0)
					.ticks(5)
					.orient("left"));

	var dotgg = thread_trend_svg.append("g");
	var dotg = dotgg.selectAll(".dot")
					.data(thread_trend_data).enter().append("g").attr("opacity",0)
					.on("mouseover", function () {
						d3.select(this).transition().attr("opacity",1);
					})
					.on("mouseout", function () {
						d3.select(this).transition().attr("opacity",0);
					});

	function Field (svg, field_name) {
		var line = d3.svg.line();
		var area = d3.svg.area()
		var path = svg.append("path").attr("class",field_name+"-path");
		var shade = svg.append("path").attr("class",field_name+"-area");
		var dot = dotg.append("circle").attr("class",field_name+"-dot")
						.attr("r",8).attr("stroke","none");
		return {line: line, area: area, path: path, shade: shade, dot: dot};
	}

	var min = new Field(thread_trend_svg, 'min');
	var avg = new Field(thread_trend_svg, 'avg');
	var max = new Field(thread_trend_svg, 'max');

	max.path.moveToFront();
	avg.path.moveToFront();
	min.path.moveToFront();
	dotgg.moveToFront();
	
	function fieldResize() {
		max.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.max)});
		max.path.attr("d",max.line(thread_trend_data));
		max.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.max)});
		max.shade.attr("d",max.area(thread_trend_data));
		max.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.max)+")";
		});

		avg.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.avg)});
		avg.path.attr("d",avg.line(thread_trend_data));
		avg.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.avg)});
		avg.shade.attr("d",avg.area(thread_trend_data));
		avg.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.avg)+")";
		});

		min.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.min)});
		min.path.attr("d",min.line(thread_trend_data));
		min.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.min)});
		min.shade.attr("d",min.area(thread_trend_data));
		min.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.min)+")";
		});
	};
	fieldResize();

	function onResize () {
		width = d3.select("#thread-trend").style("width").split("px")[0];
		thread_trend_svg.attr("width",width);
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

function drawFrameTrend(frame_trend_data) {

	var width = d3.select("#frame-trend").style("width").split("px")[0];
	var height = d3.select("#frame-trend").style("height").split("px")[0]-40;
	var margin = {top:10,right:40,bottom:20,left:40};

	var frame_trend_svg = d3.select("#frame-trend")
							.append("svg")
							.attr("width",width)
							.attr("height",height);

	var y_domain = [0, d3.max(frame_trend_data, function (d) {return d.max})];

	var run_scale = d3.scale.linear().domain([0.7,10.3]).range([margin.left,width-margin.right]);
	var y_scale = d3.scale.linear().domain(y_domain).range([height-margin.bottom,margin.top]);

	var x_axis = frame_trend_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(d3.svg.axis()
					.scale(run_scale)
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = frame_trend_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate("+margin.left+",0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.tickSize(-(width-margin.left-margin.right),0)
					.ticks(5)
					.orient("left"));

	var dotgg = frame_trend_svg.append("g");
	var dotg = dotgg.selectAll(".dot")
					.data(frame_trend_data).enter().append("g").attr("opacity",0)
					.on("mouseover", function () {
						d3.select(this).transition().attr("opacity",1);
					})
					.on("mouseout", function () {
						d3.select(this).transition().attr("opacity",0);
					});

	function Field (svg, field_name) {
		var line = d3.svg.line();
		var area = d3.svg.area()
		var path = svg.append("path").attr("class",field_name+"-path");
		var shade = svg.append("path").attr("class",field_name+"-area");
		var dot = dotg.append("circle").attr("class",field_name+"-dot")
						.attr("r",8).attr("stroke","none");
		return {line: line, area: area, path: path, shade: shade, dot: dot};
	}

	var min = new Field(frame_trend_svg, 'min');
	var avg = new Field(frame_trend_svg, 'avg');
	var max = new Field(frame_trend_svg, 'max');

	max.path.moveToFront();
	avg.path.moveToFront();
	min.path.moveToFront();
	dotgg.moveToFront();
	
	function fieldResize() {
		max.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.max)});
		max.path.attr("d",max.line(frame_trend_data));
		max.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.max)});
		max.shade.attr("d",max.area(frame_trend_data));
		max.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.max)+")";
		});

		avg.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.avg)});
		avg.path.attr("d",avg.line(frame_trend_data));
		avg.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.avg)});
		avg.shade.attr("d",avg.area(frame_trend_data));
		avg.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.avg)+")";
		});

		min.line.x(function (d, i) {return run_scale(i+1)})
					.y(function (d, i) {return y_scale(d.min)});
		min.path.attr("d",min.line(frame_trend_data));
		min.area.x(function (d, i) {return run_scale(i+1)})
					.y0(function (d, i) {return y_scale(0)})
					.y1(function (d, i) {return y_scale(d.min)});
		min.shade.attr("d",min.area(frame_trend_data));
		min.dot.attr("transform",function (d, i) {
			return "translate("+run_scale(i+1)+","+y_scale(d.min)+")";
		});
	};
	fieldResize();

	function onResize () {
		width = d3.select("#frame-trend").style("width").split("px")[0];
		frame_trend_svg.attr("width",width);
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