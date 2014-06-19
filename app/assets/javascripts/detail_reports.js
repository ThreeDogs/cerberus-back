var resizeFunctions = [];
d3.select(window).on("resize",function () {
	for (var i in resizeFunctions){
		resizeFunctions[i]();
	}
});

function detailReportList (data) {
	var table = d3.select("#test-result-list").html("");
	var th = ["Rank","Status","Test Scenario","Device","OS Version","Running Time",""];
	table.append("tr").selectAll("th").data(th).enter().append("th").text(function (d) {return d});

	var tr = table.selectAll("row").data(data).enter().append("tr");

	tr.append("td").append("div")
		.attr("class",function (d) {return "rank "+d.rank})
		.text(function (d) {return d.rank});
	tr.append("td").text(function (d) {return d.get_status});
	tr.append("td").text(function (d) {return d.test_scenario_name});
	tr.append("td").text(function (d) {return d.device_name});
	tr.append("td").text(function (d) {return d.os_version});
	tr.append("td").text(function (d) {return d.get_running_time});
	tr.append("td").append("a").attr("href",function (d) {return d.link}).text("Show");

	sidebarHeightCorrect();
}


function drawDetailReports (data) {

	function drawEventScreenshot (data) {

		var inner_div = d3.select("#event-screenshot-inner");
		var per_screenshot = {width: 130, height: 200, margin_rl: 10, margin_tb: 10};

		inner_div.style("width",(per_screenshot.width+20)*data.length+"px");

		//process data to group activities
		var activities = [];
		for (var i in data) {
			var flag = true;
			var currentActivity = activities[activities.length-1];
			if ( (currentActivity!=null) && (data[i].activity_class == currentActivity.name) ){
				flag = false;
				currentActivity.events.push(data[i]);
				currentActivity.end_time=data[i].client_timestamp;
			}
			if (flag) activities.push({
				"name":data[i].activity_class,
				"events": [data[i]],
				"start_time":data[i].client_timestamp,
				"end_time":data[i].client_timestamp,
			});
		}

		var activity_div = inner_div.selectAll(".activity").data(activities).enter().append("div").attr("class","activity")
			.attr("width",function (d) {return (per_screenshot.width + per_screenshot.margin_rl) * d.events.length})
			.attr("height",per_screenshot.height+per_screenshot.margin_tb);

		activity_div.append("div").attr("class","activity-name")
			.text(function (d) {
				var name_string = d.name.split('.');
				return name_string[name_string.length-1]
			}).attr("title",function (d) {return d.name});

		var each_div = activity_div.selectAll(".event-screenshot-each").data(function (d) {return d.events}).enter()
			.append("div").attr("class","event-screenshot-each");

		each_div.append("img").attr("src",function (d) {return d.src});
		each_div.append("div").attr("class","view-each").text(function (d) {
			return d.view})
		each_div.append("div").attr("class","event-each").text(function (d) {
			return d.action_type+"("+d.param+")"});
		each_div.append("div").attr("class","sleep-each").text(function (d) {
			return d.sleep+"ms"})

	}

	function drawCPUChart (data) {
		//client_timestamp, usage

		var width = d3.select('#cpu-chart').style('width').split("px")[0];
		var height = d3.select('#cpu-chart').style('height').split("px")[0];
		var margin = {top:10, right: 10, bottom: 30, left: 30};
		var svg = d3.select('#cpu-chart').append('svg')
					.attr('width',width).attr('height',height);

		var x_extent = d3.extent(data, function (d) { return d.client_timestamp });
		var y_extent_max = d3.max(data, function (d) { return d.usage * 1.1});
		if (y_extent_max>100) {y_extent_max = 100};
		var y_extent = [0, y_extent_max];

		var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
		var y_scale = d3.scale.linear().domain(y_extent).range([height-margin.bottom,margin.top]);

		var x_axis = d3.svg.axis().scale(x_scale).orient('bottom').innerTickSize(3).outerTickSize([0]);
		var y_axis = d3.svg.axis().scale(y_scale).orient('left').innerTickSize(3).outerTickSize([0]);
	
		var line = d3.svg.line()
						.x(function (d) {return x_scale(d.client_timestamp)})
						.y(function (d) {return y_scale(d.usage)});
		var area = d3.svg.area()
						.x(function (d) {return x_scale(d.client_timestamp)})
						.y0(y_scale(0))
						.y1(function (d) {return y_scale(d.usage)});

		var cpu_area = svg.append("path").attr("class","cpu-area").attr("d",area(data));
		var cpu_line = svg.append("path").attr("class","cpu-line").attr("d",line(data));

		var cpu_x_axis = svg.append("g").attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(x_axis);

		var cpu_y_axis = svg.append("g").attr("class", "y axis")
				.attr("transform", "translate("+margin.left+",0)")
				.call(y_axis);

		function onResize () {
			width = d3.select('#cpu-chart').style('width').split("px")[0];
			svg.attr("width",width);
			x_scale.range([margin.left,width-margin.right]);
			x_axis.scale(x_scale);
			cpu_line.attr("d",line(data));
			cpu_area.attr("d",area(data));
			cpu_x_axis.call(x_axis);
		}
		resizeFunctions.push(onResize);
	}

	function drawMemChart (data) {
		//client_timestamp, dalvik_heap_alloc
		var width = d3.select('#mem-chart').style('width').split("px")[0];
		var height = d3.select('#mem-chart').style('height').split("px")[0];
		var margin = {top:10, right: 10, bottom: 30, left: 60};
		var svg = d3.select('#mem-chart').append('svg')
					.attr('width',width).attr('height',height);

		var x_extent = d3.extent(data, function (d) { return d.client_timestamp });
		var y_extent = [0, d3.max(data, function (d) { return d.dalvik_heap_alloc*1.1})];

		var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
		var y_scale = d3.scale.linear().domain(y_extent).range([height-margin.bottom,margin.top]);

		var x_axis = d3.svg.axis().scale(x_scale).orient('bottom').innerTickSize(3).outerTickSize([0]);
		var y_axis = d3.svg.axis().scale(y_scale).orient('left').innerTickSize(3).outerTickSize([0]);
	
		var line = d3.svg.line()
						.x(function (d) {return x_scale(d.client_timestamp)})
						.y(function (d) {return y_scale(d.dalvik_heap_alloc)});
		var area = d3.svg.area()
						.x(function (d) {return x_scale(d.client_timestamp)})
						.y0(y_scale(0))
						.y1(function (d) {return y_scale(d.dalvik_heap_alloc)});

		var mem_area = svg.append("path").attr("class","mem-area").attr("d",area(data));
		var mem_line = svg.append("path").attr("class","mem-line").attr("d",line(data));

		var mem_x_axis = svg.append("g").attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(x_axis);

		var mem_y_axis = svg.append("g").attr("class", "y axis")
				.attr("transform", "translate("+margin.left+",0)")
				.call(y_axis);

		function onResize () {
			width = d3.select('#mem-chart').style('width').split("px")[0];
			svg.attr("width",width);
			x_scale.range([margin.left,width-margin.right]);
			x_axis.scale(x_scale);
			mem_line.attr("d",line(data));
			mem_area.attr("d",area(data));
			mem_x_axis.call(x_axis);
		}
		resizeFunctions.push(onResize);
	}

	function drawBatteryChart (data) {

		var width = d3.select('#battery-chart').style('width').split("px")[0];
		var height = d3.select('#battery-chart').style('height').split("px")[0];
		var margin = {top:10, right: 10, bottom: 30, left: 40};
		var svg = d3.select('#battery-chart').append('svg')
					.attr('width',width).attr('height',height);

		for (index in data) {
			var one = data[index];
			for (key in one) {
				if (one[key] == null) {
					one[key] = 0;
				}
				else {
					one[key] = parseInt(one[key]);
				}
			}
			one.sum = one.cpu + one.gps + one.wifi + one.threeg + one.sound + one.lcd;
		}

		var x_extent = d3.extent(data, function (d) { return d.client_timestamp });
		var y_extent = [0, 100];

		var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
		var y_scale = d3.scale.linear().domain(y_extent).range([height-margin.bottom,margin.top]);

		var x_axis = d3.svg.axis().scale(x_scale).orient('bottom').innerTickSize(3).outerTickSize([0]);
		var y_axis = d3.svg.axis().scale(y_scale).orient('left').innerTickSize(3).outerTickSize([0]);
	
		var battery_x_axis = svg.append("g").attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(x_axis);

		var battery_y_axis = svg.append("g").attr("class", "y axis")
				.attr("transform", "translate("+margin.left+",0)")
				.call(y_axis);

		var fields = ["cpu","gps","wifi","threeg","sound","lcd"];

		var cpu_field = new Field("cpu");
		var gps_field = new Field("gps");
		var wifi_field = new Field("wifi");
		var threeg_field = new Field("threeg");
		var sound_field = new Field("sound");
		var lcd_field = new Field("lcd");

		function Field (field_name) {
			var area = d3.svg.area()
						.x(function (d) {return x_scale(d.client_timestamp)})
						.y0(function (d) {
							var sum = 0;
							for(var i=0; i<fields.indexOf(field_name); i++) {
								sum += d[fields[i]];
							}
							return y_scale((sum/d.sum) * 100);
						})
						.y1(function (d) {
							var sum = 0;
							for(var i=0; i<=fields.indexOf(field_name); i++) {
								sum += d[fields[i]];
							}
							return y_scale((sum/d.sum) * 100);
						})
			var path = svg.append("path").attr("class","battery-"+field_name)
						.attr("d",area(data));

			var resize = function () {
				path.attr("d",area(data));
			}

			return {area:area, path:path, resize:resize};
		}

		function onResize () {
			width = d3.select('#battery-chart').style('width').split("px")[0];
			svg.attr("width",width);
			x_scale.range([margin.left,width-margin.right]);
			x_axis.scale(x_scale);
			battery_x_axis.call(x_axis);
			cpu_field.resize();
			gps_field.resize();
			wifi_field.resize();
			threeg_field.resize();
			sound_field.resize();
		}
		resizeFunctions.push(onResize);
	}

	function drawDrawTimeChart (data) {

		var width = d3.select('#draw-time-chart').style('width').split("px")[0];
		var height = d3.select('#draw-time-chart').style('height').split("px")[0];
		var margin = {top:10, right: 10, bottom: 30, left: 40};
		var svg = d3.select('#draw-time-chart').append('svg')
					.attr('width',width).attr('height',height);

		data.sort(function (a, b) {
			if (a.load_start_timestamp < b.load_start_timestamp){
				return -1;
			} else if (a.load_start_timestamp > b.load_start_timestamp){
				return 1;
			} else {
				return 0;
			}
		});

		var zero = data[0].load_start_timestamp;
		for (index in data) {
			var one = data[index];
			one.client_timestamp = (one.load_start_timestamp - zero) /1000;
			one.delta = one.load_finish_timestamp - one.load_start_timestamp;
		}

		var x_extent = d3.extent(data, function (d) { return d.client_timestamp });
		var y_extent = [0,d3.max(data, function (d) { return d.delta * 1.1})];

		var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
		var y_scale = d3.scale.linear().domain(y_extent).range([height-margin.bottom,margin.top]);

		var x_axis = d3.svg.axis().scale(x_scale).orient('bottom').innerTickSize(3).outerTickSize([0]);
		var y_axis = d3.svg.axis().scale(y_scale).orient('left').innerTickSize(3).outerTickSize([0]);

		var draw_time_x_axis = svg.append("g").attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(x_axis);

		var draw_time_y_axis = svg.append("g").attr("class", "y axis")
				.attr("transform", "translate("+margin.left+",0)")
				.call(y_axis);

		var lines = svg.append("g").attr("class","draw-time-lines");
		lines.selectAll("lines").data(data).enter().append("line")
				.attr("class",function (d) {return d.view_type+"-line"})
				.attr("stroke-width",3)
				.attr("y1",function (d) {return y_scale(0)})
				.attr("y2",function (d) {return y_scale(d.delta)})	
				.attr("x1",function (d) {return x_scale(d.client_timestamp)})
				.attr("x2",function (d) {return x_scale(d.client_timestamp)});

		function onResize () {
			width = d3.select('#draw-time-chart').style('width').split("px")[0];
			svg.attr("width",width);
			x_scale.range([margin.left,width-margin.right]);
			x_axis.scale(x_scale);
			draw_time_x_axis.call(x_axis);
			lines.attr("x1",function (d) {return x_scale(d.client_timestamp)})
				.attr("x2",function (d) {return x_scale(d.client_timestamp)});

		}
		resizeFunctions.push(onResize);
	}

	function drawNetworkChart (data) {

		var width = d3.select('#network-chart').style('width').split("px")[0];
		var height = d3.select('#network-chart').style('height').split("px")[0];
		var margin = {top:10, right: 10, bottom: 30, left: 60};
		var svg = d3.select('#network-chart').append('svg')
					.attr('width',width).attr('height',height);

		var x_extent = d3.extent(data, function (d) { return d.client_timestamp });
		var y_extent = [0,d3.max(data, function (d) { return d.response_size * 1.1})];

		var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
		var y_scale = d3.scale.linear().domain(y_extent).range([height-margin.bottom,margin.top]);

		var x_axis = d3.svg.axis().scale(x_scale).orient('bottom').innerTickSize(3).outerTickSize([0]);
		var y_axis = d3.svg.axis().scale(y_scale).orient('left').innerTickSize(3).outerTickSize([0]);

		var draw_time_x_axis = svg.append("g").attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(x_axis);

		var draw_time_y_axis = svg.append("g").attr("class", "y axis")
				.attr("transform", "translate("+margin.left+",0)")
				.call(y_axis);

		var lines = svg.append("g").attr("class","network-lines");
		lines.selectAll("lines").data(data).enter().append("line")
				.attr("class","network-response-line")
				.attr("y1",function (d) {return y_scale(0)})
				.attr("y2",function (d) {return y_scale(d.response_size)})	
				.attr("x1",function (d) {return x_scale(d.client_timestamp)})
				.attr("x2",function (d) {return x_scale(d.client_timestamp)});

		function onResize () {
			width = d3.select('#network-chart').style('width').split("px")[0];
			svg.attr("width",width);
			x_scale.range([margin.left,width-margin.right]);
			x_axis.scale(x_scale);
			draw_time_x_axis.call(x_axis);
			lines.attr("x1",function (d) {return x_scale(d.client_timestamp)})
				.attr("x2",function (d) {return x_scale(d.client_timestamp)});

		}
		resizeFunctions.push(onResize);
	}

	drawEventScreenshot(dataProcess(data.motion_event_infos));
	drawCPUChart(dataProcess(data.cpu_infos));
	drawMemChart(dataProcess(data.memory_infos));
	drawBatteryChart(dataProcess(data.battery_infos));
	drawDrawTimeChart(dataProcess(data.frame_draw_times));
	drawNetworkChart(dataProcess(data.network_infos));

	// drawEventScreenshot(dataProcess(data.detail_report.motion_event_infos_attributes));
	// drawCPUChart(dataProcess(data.detail_report.cpu_infos_attributes));
	// drawMemChart(dataProcess(data.detail_report.memory_infos_attributes));
	// drawBatteryChart(dataProcess(data.detail_report.battery_infos_attributes));
	// drawDrawTimeChart(dataProcess(data.detail_report.frame_draw_times_attributes));
	// drawNetworkChart(dataProcess(data.detail_report.network_infos_attributes));
}

function dataProcess(data) {

	//to deal with null fields which cause NaN issue
	for (var i=0; i<data.length; i++) {
		for (key in data[i]) {
			if (data[i][key] == null) {
				data.splice(i,i);
				break;
			}
		}
	};

	data.sort(function (a, b) {
		if (a.client_timestamp < b.client_timestamp){
			return -1;
		} else if (a.client_timestamp > b.client_timestamp){
			return 1;
		} else {
			return 0;
		}
	});

	// Process the client java timestamp (ms)
	// into relative time in second with first element at 0s
	var zero = data[0].client_timestamp;
	data.forEach(function (element, index) {
		element.client_timestamp = (element.client_timestamp - zero) / 1000;
	});

	return data;
}

function methodProfiling (data) {

	data.sort(function (a, b) {
		if (a.tree_key < b.tree_key){
			return -1;
		} else if (a.tree_key > b.tree_key){
			return 1;
		} else {
			return 0;
		}
	});

	for (index in data) {
		data[index].children = [];
		data[index].children_time = 0;
		data[index].delta = data[index].end_timestamp - data[index].start_timestamp;
	}

	var parent_key;
	for (index in data) {
		parent_key = data[index].parent_key;
		if (parent_key !=0) {
			data[parent_key-1].children.push(data[index]);
			data[parent_key-1].children_time += data[index].delta;
		}
	}

	data = data.filter(function (d) {
		if (d.parent_key == 0) {return true}
		else {return false}
	})

	var root = d3.select("#cpu-method").append("ul").attr("class","method-list");
	var root_selection = root.selectAll("li").data(data).enter();

	appendLi(root_selection);
		
	function appendLi (selection) {
		var row = selection.append("li").attr("class","method-list-row")

		row.append("span").attr("class","activity-method").text(function (d) {return d.tree_key + " " + d.class_name + " " +d.method_name});
		row.append("span").attr("class","incl").text(function (d) {return d.delta});
		row.append("span").attr("class","excl").text(function (d) {return d.delta-d.children_time});
		var sub_selection = row.append("ul").selectAll("li").data(function (d) {return d.children}).enter();

		row.on("click",function (d) {
			event.stopPropagation();
			$("ul", this).toggle();
		})

		if (!sub_selection.empty()) { appendLi(sub_selection) }
	}
}

function drawCPUDeeper(cpudata) {
	var margin = {top: 10, right: 10, bottom: 30, left: 50};
	var width = d3.select('#cpu-deeper').style('width').split("px")[0]-80;
	var height = 420;

	var cpu_svg = d3.select("#cpu-deeper").append("svg")
					.attr("id","cpu_svg")
					.attr("height",height+margin.top+margin.bottom)
					.attr("width",width+margin.left+margin.right)
					.append("g")
					.attr("transform","translate("+margin.left+","+margin.top+")");

	var x = d3.scale.linear().range([0, width]);
	var y = d3.scale.linear().range([height, 0]);

	x_extent = [0, cpudata[cpudata.length-1].client_timestamp];
	y_extent = [0, 100];
	x.domain(x_extent);
	y.domain(y_extent);

	var xAxis = d3.svg.axis().scale(x).orient("bottom")
				    .tickSize(-height, 0).tickPadding(6);

	var yAxis = d3.svg.axis().scale(y).orient("left")
				    .tickSize(-width).tickPadding(6);

	cpu_svg.append("clipPath").attr("id","cpu_clip")
			.append("rect").attr("id","cpu_clip_rect")
			.attr("width",width).attr("height",height);

	var detail_box = d3.select("#cpu_graph_detail_info");

	var zoom = d3.behavior.zoom().on("zoom", onZoom)
				.scaleExtent([0.1,4]).x(x);

	var pane = cpu_svg.append("rect").attr("class", "pane")
	    .attr("width", width).attr("height", height).call(zoom);

	var line = d3.svg.line().interpolate("monotone")
					.x(function(d){return x(d.client_timestamp)})
					.y(function(d){return y(d.usage)});

	var cpu_usage = cpu_svg.append("path").attr("class","line")
							.attr("clip-path", "url(#cpu_clip)")
							.attr("id","cpu_usage")
							.attr("d", line(cpudata));

	var cpu_usage_dots = cpu_svg.append("g").attr("clip-path", "url(#cpu_clip)")
							.attr("id","dots")
							.selectAll("dots").data(cpudata).enter()
							.append("circle").attr("class","dot").attr("r",2)
							.attr("transform",function (d) {
								return "translate("+x(d.client_timestamp)+","+y(d.usage)+")";
							})
							.on("click",function (d) {
								// detail_box.selectAll("div").remove();
								// detail_box.append("div")
								// 	.text("cpu usage: "+d.usage+"%");
							});

	supportLine = new SupportLine();
	supportLine.x = x;
	supportLine.line = cpu_svg.append("line").attr("clip-path","url(#cpu_clip)")
						.attr("class","support-line")
						.attr("x1",x(0)).attr("x2",x(0))
						.attr("y1",y(0)).attr("y2",y(100));

	cpu_svg.append("g").attr("class", "y axis")

	cpu_svg.append("g").attr("class", "x axis")
	    .attr("transform", "translate(0,"+height+")");

	onZoom();

	function onZoom() {
		yAxis.tickSize(-width);
		cpu_svg.select("g.x.axis").call(xAxis);
		cpu_svg.select("g.y.axis").call(yAxis);
		cpu_svg.select("#cpu_usage").attr("d",line(cpudata));
		cpu_svg.selectAll("circle.dot").attr("transform",function (d) {
			return "translate("+x(d.client_timestamp)+","+y(d.usage)+")";
		});
		supportLine.line_renew();
	}

	var legend_width = 80;
	var legend_height = 30;
	var legend_margin = {top: 10, bottom: 10, left: 10, right: 10};

	var legend = cpu_svg.append("g")
			.attr("class", "legend")
			.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");

	legend.append("rect")
			.attr("class", "legend_bg")
			.attr("width",legend_width)
			.attr("height",legend_height)
			.attr("stroke","none")
			.attr("fill","#eeeeee");

	var field_list = legend.append("g").attr("class","field_list");

	field_list.append("rect").attr("width",5).attr("height",5)
				.attr("x",5).attr("y",5)
				.attr("stroke","none").attr("fill","#111111");

	field_list.append("text")
				.attr("x",15).attr("y",10)
				.text("cpu usage");

	var cpu_graph_resize = function onResize() {
		width = d3.select('#cpu-deeper').style('width').split("px")[0]-80;
		d3.select("#cpu_svg").attr("width",width+margin.left+margin.right);
		pane.attr("width",width);
		d3.select("#cpu_clip_rect").attr("width",width);
		x.range([0,width]);
		onZoom();
		legend.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");
	}

	resizeFunctions.push(cpu_graph_resize);

}

function drawMemDeeper(memdata) {
	var margin = {top: 10, right: 50, bottom: 30, left: 50};
	var width = d3.select('#memory-deeper').style('width').split("px")[0]-100;
	var height = 300;

	var mem_svg = d3.select("#memory-deeper").append("svg")
					.attr("id","mem_svg")
					.attr("height",height+margin.top+margin.bottom)
					.attr("width",width+margin.left+margin.right)
					.append("g")
					.attr("transform","translate("+margin.left+","+margin.top+")");

	var x = d3.scale.linear().range([0, width]);
	var y = d3.scale.linear().range([height, 0]);
	var y_percentage = d3.scale.linear().range([height, 0]);

	x_extent = [0, memdata[memdata.length-1].client_timestamp];
	y_extent = [0, d3.max(memdata, function(d) { return d.mem_total * 1.1; })];
	x.domain(x_extent);
	y.domain(y_extent);
	y_percentage.domain([0,100]);

	var xAxis = d3.svg.axis().scale(x).orient("bottom")
				    .tickSize(-height, 0).tickPadding(6);

	var yAxis = d3.svg.axis().scale(y).orient("left")
				    .tickSize(-width).tickPadding(6);

	var yAxis_percentage = d3.svg.axis().scale(y_percentage).orient("right")
				    .tickSize(-width).tickPadding(6);

	var clip = mem_svg.append("clipPath").attr("id", "mem_clip")
			.append("rect").attr("id","#mem_clip_rect")
			.attr("width",width).attr("height",height);

	var zoom = d3.behavior.zoom().on("zoom", onZoom)
				.scaleExtent([0.1,4]).x(x);

	supportLine = new SupportLine();
	supportLine.x = x;
	supportLine.line = mem_svg.append("line").attr("clip-path","url(#mem_clip)")
						.attr("class","support-line")
						.attr("x1",x(0)).attr("x2",x(0))
						.attr("y1",y(y_extent[0])).attr("y2",y(y_extent[1]));

	mem_svg.append("g").attr("class", "y axis");
	mem_svg.append("g").attr("class", "percent axis").attr("transform", "translate("+width+",0)");

	mem_svg.append("g").attr("class", "x axis").attr("transform", "translate(0,"+height+")");

	var pane = mem_svg.append("rect").attr("class", "pane")
	    .attr("width", width).attr("height", height).call(zoom);

	function MemGraph (value_name) {

		var detail_box = d3.select("#memory-deeper-detail");

		var line = d3.svg.line().interpolate("monotone")
					.x(function(d){return x(d.client_timestamp)})
					.y(function(d){return y(d[value_name])});

		var path = mem_svg.append("path")
					.attr("class","line")
					.attr("clip-path","url(#mem_clip)")
					.attr("id",value_name+"-path")
					.attr("d",line(memdata));

		var dots = mem_svg.append("g")
					.attr("clip-path", "url(#mem_clip)")
					.attr("id",value_name+"-dots")
					.selectAll(value_name+"-dots")
					.data(memdata)
					.enter()
					.append("circle")
					.attr("class",value_name+"dot dot")
					.attr("r",2)
					.attr("transform",function (d) {
						return "translate("+x(d.client_timestamp)+","+y(d[value_name])+")";
					})
					.on("click",function (d) {
						detail_box.selectAll("div").remove();
						detail_box.append("div")
							.text(value_name+" "+d[value_name]);
					});

		d3.select("#"+value_name).on("click",function (d) {
			if (this.checked) {
				visible();
			} else {
				transparent();
			}
		})

		function transparent() {
			path.transition().attr("visibility","hidden");
			dots.transition().attr("visibility","hidden");
		}

		function visible() {
			path.transition().attr("visibility","true");
			dots.transition().attr("visibility","true");
		}

		function renew() {
			path.attr("d",line(memdata));
			mem_svg.selectAll("."+value_name+"dot").attr("transform",function (d) {
				return "translate("+x(d.client_timestamp)+","+y(d[value_name])+")";
			});
		}

		var returnObj = new Object();
		returnObj.transparent = transparent;
		returnObj.visible = visible;
		returnObj.renew = renew;

		return returnObj;
	}

	function MemGraphPercentage (value_name, numerator, denominator) {

		var detail_box = d3.select("#memory-deeper-detail");

		var line = d3.svg.line().interpolate("monotone")
					.x(function(d){return x(d.client_timestamp)})
					.y(function(d){return y_percentage(d[numerator]/d[denominator]*100)});

		var path = mem_svg.append("path")
					.attr("class","line")
					.attr("clip-path","url(#mem_clip)")
					.attr("id",value_name+"-path")
					.attr("d",line(memdata));

		var dots = mem_svg.append("g")
					.attr("clip-path", "url(#mem_clip)")
					.attr("id",value_name+"-dots")
					.selectAll(value_name+"-dots")
					.data(memdata)
					.enter()
					.append("circle")
					.attr("class",value_name+"dot dot")
					.attr("r",2)
					.attr("transform",function (d) {
						return "translate("+x(d.client_timestamp)+","+y_percentage(d[numerator]/d[denominator]*100)+")";
					})
					.on("click",function (d) {
						detail_box.selectAll("div").remove();
						detail_box.append("div")
							.text(value_name+" "+parseInt(d[numerator]/d[denominator]*100));
					});

		d3.select("#"+value_name).on("click",function (d) {
			if (this.checked) {
				visible();
			} else {
				transparent();
			}
		})

		function transparent() {
			path.transition().attr("visibility","hidden");
			dots.transition().attr("visibility","hidden");
		}

		function visible() {
			path.transition().attr("visibility","true");
			dots.transition().attr("visibility","true");
		}

		function renew() {
			path.attr("d",line(memdata));
			mem_svg.selectAll("."+value_name+"dot").attr("transform",function (d) {
				return "translate("+x(d.client_timestamp)+","+y_percentage(d[numerator]/d[denominator]*100)+")";
			});
		}

		var returnObj = new Object();
		returnObj.transparent = transparent;
		returnObj.visible = visible;
		returnObj.renew = renew;

		return returnObj;
	}

	var native_heap_size = new MemGraph('native_heap_size');
	var native_heap_alloc = new MemGraph('native_heap_alloc');
	var dalvik_heap_size = new MemGraph('dalvik_heap_size');
	var dalvik_heap_alloc = new MemGraph('dalvik_heap_alloc');
	var mem_total =	new MemGraph('mem_total');
	var mem_alloc = new MemGraph('mem_alloc');

	var native_percentage = new MemGraphPercentage('native_percentage','native_heap_alloc','native_heap_size');
	var dalvik_percentage = new MemGraphPercentage('dalvik_percentage','dalvik_heap_alloc','dalvik_heap_size');
	var mem_percentage = new MemGraphPercentage('mem_percentage','mem_alloc','mem_total');

	function onZoom() {
		yAxis.tickSize(-width);
		mem_svg.select("g.x.axis").call(xAxis);
		mem_svg.select("g.y.axis").call(yAxis);
		mem_svg.select("g.percent.axis").call(yAxis_percentage);
		native_heap_size.renew();
		native_heap_alloc.renew();
		dalvik_heap_size.renew();
		dalvik_heap_alloc.renew();
		mem_total.renew();
		mem_alloc.renew();
		native_percentage.renew();
		dalvik_percentage.renew();
		mem_percentage.renew();
		supportLine.line_renew();
	}
	onZoom();

	mem_graph_resize = function onResize() {
		width = d3.select('#memory-deeper').style('width').split("px")[0]-80;
		d3.select("#mem_svg").attr("width",width+margin.left+margin.right);
		pane.attr("width",width);
		clip.attr("width",width);
		x.range([0,width]);
		onZoom();
		legend.transform();
	}
}

function makeRawTable(div_id, data, field_list, field_label_list) {

	var table = d3.select("#"+div_id).append("table").attr("class","raw-data-table");

	var tr = table.append("tr");
	tr.selectAll("th").data(field_label_list).enter().append("th").text(function (d) {return d});

	tr = table.selectAll("row").data(data).enter().append("tr");
	for (index in field_list) {
		tr.append("td").text(function (d) {return d[field_list[index]]});
	}
}

function drawNetworkDeeper(networkdata) {
	var margin = {top: 10, right: 10, bottom: 30, left: 50};
	var width = d3.select('#network-deeper').style('width').split("px")[0]-80;
	var height = 420;

	var network_svg = d3.select("#network-deeper").append("svg")
					.attr("id","network_svg")
					.attr("height",height+margin.top+margin.bottom)
					.attr("width",width+margin.left+margin.right)
					.append("g")
					.attr("transform","translate("+margin.left+","+margin.top+")");

	var x = d3.scale.linear().range([0, width]);
	var y = d3.scale.linear().range([height, 0]);

	x_extent = [0, networkdata[networkdata.length-1].client_timestamp];
	y_extent = [0, d3.max(networkdata, function (d) {return d.response_size * 1.1})];
	x.domain(x_extent);
	y.domain(y_extent);

	var xAxis = d3.svg.axis().scale(x).orient("bottom")
				    .tickSize(-height, 0).tickPadding(6);

	var yAxis = d3.svg.axis().scale(y).orient("left")
				    .tickSize(-width).tickPadding(6);

	network_svg.append("clipPath").attr("id","network_clip")
			.append("rect").attr("id","network_clip_rect")
			.attr("width",width).attr("height",height);

	var detail_box = d3.select("#network_graph_detail_info");

	var zoom = d3.behavior.zoom().on("zoom", onZoom)
				.scaleExtent([0.1,4]).x(x);

	var pane = network_svg.append("rect").attr("class", "pane")
	    .attr("width", width).attr("height", height).call(zoom);

	var lines = network_svg.append("g").attr("clip-path", "url(#network_clip)")
				.attr("class","network-response-lines")
				.selectAll("lines").data(networkdata).enter().append("line")
				.attr("class",function (d) {return "network-line"})
				.attr("y1",function (d) {return y(0)})
				.attr("y2",function (d) {return y(d.response_size)})	
				.attr("x1",function (d) {return x(d.client_timestamp)})
				.attr("x2",function (d) {return x(d.client_timestamp)});


	network_svg.append("g").attr("class", "y axis")

	network_svg.append("g").attr("class", "x axis")
	    .attr("transform", "translate(0,"+height+")");

	onZoom();

	function onZoom() {
		yAxis.tickSize(-width);
		network_svg.select("g.x.axis").call(xAxis);
		network_svg.select("g.y.axis").call(yAxis);
		lines.attr("x1",function (d) {return x(d.client_timestamp)})
			.attr("x2",function (d) {return x(d.client_timestamp)});
	}

	var legend_width = 120;
	var legend_height = 30;
	var legend_margin = {top: 10, bottom: 10, left: 10, right: 10};

	var legend = network_svg.append("g")
			.attr("class", "legend")
			.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");

	legend.append("rect")
			.attr("class", "legend_bg")
			.attr("width",legend_width)
			.attr("height",legend_height)
			.attr("stroke","none")
			.attr("fill","#eeeeee");

	var field_list = legend.append("g").attr("class","field_list");

	field_list.append("rect").attr("width",5).attr("height",5)
				.attr("x",5).attr("y",5)
				.attr("stroke","none").attr("fill","yellow");

	field_list.append("text")
				.attr("x",15).attr("y",10)
				.text("network response");

	var network_graph_resize = function onResize() {
		width = d3.select('#network-deeper').style('width').split("px")[0]-80;
		d3.select("#network_svg").attr("width",width+margin.left+margin.right);
		pane.attr("width",width);
		d3.select("#network_clip_rect").attr("width",width);
		x.range([0,width]);
		onZoom();
		legend.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");
	}

	resizeFunctions.push(network_graph_resize);

}


function drawDrawTimeDeeper(drawtimedata) {
	var margin = {top: 10, right: 10, bottom: 30, left: 50};
	var width = d3.select('#draw-time-deeper').style('width').split("px")[0]-80;
	var height = 420;

	var draw_time_svg = d3.select("#draw-time-deeper").append("svg")
					.attr("id","draw_time_svg")
					.attr("height",height+margin.top+margin.bottom)
					.attr("width",width+margin.left+margin.right)
					.append("g")
					.attr("transform","translate("+margin.left+","+margin.top+")");

	var zero = data[0].load_start_timestamp;
	for (index in data) {
		var one = data[index];
		one.client_timestamp = (one.load_start_timestamp - zero) /1000;
		one.delta = one.load_finish_timestamp - one.load_start_timestamp;
	}

	var x = d3.scale.linear().range([0, width]);
	var y = d3.scale.linear().range([height, 0]);

	x_extent = [0, drawtimedata[drawtimedata.length-1].client_timestamp];
	y_extent = [0, d3.max(drawtimedata, function (d) {return d.response_size * 1.1})];
	x.domain(x_extent);
	y.domain(y_extent);

	var xAxis = d3.svg.axis().scale(x).orient("bottom")
				    .tickSize(-height, 0).tickPadding(6);

	var yAxis = d3.svg.axis().scale(y).orient("left")
				    .tickSize(-width).tickPadding(6);

	draw_time_svg.append("clipPath").attr("id","draw_time_clip")
			.append("rect").attr("id","draw_time_clip_rect")
			.attr("width",width).attr("height",height);

	var detail_box = d3.select("#draw_time_graph_detail_info");

	var zoom = d3.behavior.zoom().on("zoom", onZoom)
				.scaleExtent([0.1,4]).x(x);

	var pane = draw_time_svg.append("rect").attr("class", "pane")
	    .attr("width", width).attr("height", height).call(zoom);

	var lines = draw_time_svg.append("g").attr("clip-path", "url(#draw_time_clip)")
				.attr("class","draw-time-lines")
				.selectAll("lines").data(drawtimedata).enter().append("line")
				.attr("class",function (d) {return "draw-time-line"})
				.attr("y1",function (d) {return y(0)})
				.attr("y2",function (d) {return y(d.response_size)})	
				.attr("x1",function (d) {return x(d.client_timestamp)})
				.attr("x2",function (d) {return x(d.client_timestamp)});


	draw_time_svg.append("g").attr("class", "y axis")

	draw_time_svg.append("g").attr("class", "x axis")
	    .attr("transform", "translate(0,"+height+")");

	onZoom();

	function onZoom() {
		yAxis.tickSize(-width);
		draw_time_svg.select("g.x.axis").call(xAxis);
		draw_time_svg.select("g.y.axis").call(yAxis);
		lines.attr("x1",function (d) {return x(d.client_timestamp)})
			.attr("x2",function (d) {return x(d.client_timestamp)});
	}

	var legend_width = 120;
	var legend_height = 30;
	var legend_margin = {top: 10, bottom: 10, left: 10, right: 10};

	var legend = draw_time_svg.append("g")
			.attr("class", "legend")
			.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");

	legend.append("rect")
			.attr("class", "legend_bg")
			.attr("width",legend_width)
			.attr("height",legend_height)
			.attr("stroke","none")
			.attr("fill","#eeeeee");

	var field_list = legend.append("g").attr("class","field_list");

	field_list.append("rect").attr("width",5).attr("height",5)
				.attr("x",5).attr("y",5)
				.attr("stroke","none").attr("fill","teal");

	field_list.append("text")
				.attr("x",15).attr("y",10)
				.text("frame draw time");

	var draw_time_graph_resize = function onResize() {
		width = d3.select('#draw-time-deeper').style('width').split("px")[0]-80;
		d3.select("#draw_time_svg").attr("width",width+margin.left+margin.right);
		pane.attr("width",width);
		d3.select("#draw_time_clip_rect").attr("width",width);
		x.range([0,width]);
		onZoom();
		legend.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");
	}

	resizeFunctions.push(draw_time_graph_resize);

}

function drawBatteryDeeper(batterydata) {
	var margin = {top: 10, right: 10, bottom: 30, left: 50};
	var width = d3.select('#battery-deeper').style('width').split("px")[0]-80;
	var height = 420;

	var battery_svg = d3.select("#battery-deeper").append("svg")
					.attr("id","battery_svg")
					.attr("height",height+margin.top+margin.bottom)
					.attr("width",width+margin.left+margin.right)
					.append("g")
					.attr("transform","translate("+margin.left+","+margin.top+")");

	for (index in batterydata) {
		var one = batterydata[index];
		for (key in one) {
			if (one[key] == null) {
				one[key] = 0;
			}
			else {
				one[key] = parseInt(one[key]);
			}
		}
		one.sum = one.cpu + one.gps + one.wifi + one.threeg + one.sound + one.lcd;
	}

	var x = d3.scale.linear().range([0, width]);
	var y = d3.scale.linear().range([height, 0]);

	x_extent = [0, batterydata[batterydata.length-1].client_timestamp];
	y_extent = [0, 100];
	x.domain(x_extent);
	y.domain(y_extent);

	var xAxis = d3.svg.axis().scale(x).orient("bottom")
				    .tickSize(-height, 0).tickPadding(6);

	var yAxis = d3.svg.axis().scale(y).orient("left")
				    .tickSize(-width).tickPadding(6);

	battery_svg.append("clipPath").attr("id","battery_clip")
			.append("rect").attr("id","battery_clip_rect")
			.attr("width",width).attr("height",height);

	var detail_box = d3.select("#battery_graph_detail_info");

	var zoom = d3.behavior.zoom().on("zoom", onZoom)
				.scaleExtent([0.1,4]).x(x);

	var pane = battery_svg.append("rect").attr("class", "pane")
	    .attr("width", width).attr("height", height).call(zoom);

	battery_svg.append("g").attr("class", "y axis")

	battery_svg.append("g").attr("class", "x axis")
	    .attr("transform", "translate(0,"+height+")");

	var fields = ["cpu","gps","wifi","threeg","sound","lcd"];

	var cpu_field = new Field("cpu");
	var gps_field = new Field("gps");
	var wifi_field = new Field("wifi");
	var threeg_field = new Field("threeg");
	var sound_field = new Field("sound");
	var lcd_field = new Field("lcd");

	function Field (field_name) {
		var area = d3.svg.area()
					.x(function (d) {return x(d.client_timestamp)})
					.y0(function (d) {
						var sum = 0;
						for(var i=0; i<fields.indexOf(field_name); i++) {
							sum += d[fields[i]];
						}
						return y((sum/d.sum) * 100);
					})
					.y1(function (d) {
						var sum = 0;
						for(var i=0; i<=fields.indexOf(field_name); i++) {
							sum += d[fields[i]];
						}
						return y((sum/d.sum) * 100);
					})
		var path = battery_svg.append("path").attr("class","battery-"+field_name)
					.attr("clip-path", "url(#battery_clip)")
					.attr("d",area(batterydata));

		var resize = function () {
			path.attr("d",area(batterydata));
		}

		return {area:area, path:path, resize:resize};
	}

	supportLine = new SupportLine();
	supportLine.x = x;
	supportLine.line = battery_svg.append("line").attr("clip-path","url(#battery_clip)")
						.attr("class","support-line")
						.attr("x1",x(0)).attr("x2",x(0))
						.attr("y1",y(y_extent[0])).attr("y2",y(y_extent[1]));

	onZoom();

	function onZoom() {
		yAxis.tickSize(-width);
		battery_svg.select("g.x.axis").call(xAxis);
		battery_svg.select("g.y.axis").call(yAxis);
		cpu_field.resize();
		gps_field.resize();
		wifi_field.resize();
		threeg_field.resize();
		sound_field.resize();
		lcd_field.resize();
		supportLine.line_renew();
	}

	pane.moveToFront();

	var legend_width = 100;
	var legend_height = 90;
	var legend_margin = {top: 10, bottom: 10, left: 10, right: 10};

	var legend = battery_svg.append("g")
			.attr("class", "legend")
			.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");

	legend.append("rect")
			.attr("class", "legend_bg")
			.attr("width",legend_width)
			.attr("height",legend_height)
			.attr("stroke","none")
			.attr("fill","#eeeeee");

	var field_list = legend.append("g").attr("class","field_list");

	field_list.append("rect").attr("width",5).attr("height",5).attr("x",5).attr("y",5)
				.attr("stroke","none").attr("fill","#52C4D0");
	field_list.append("text").attr("x",15).attr("y",10).text("LCD");
	field_list.append("rect").attr("width",5).attr("height",5).attr("x",5).attr("y",20)
				.attr("stroke","none").attr("fill","#D6B6EF");
	field_list.append("text").attr("x",15).attr("y",25).text("Sound");
	field_list.append("rect").attr("width",5).attr("height",5).attr("x",5).attr("y",35)
				.attr("stroke","none").attr("fill","#A28BBC");
	field_list.append("text").attr("x",15).attr("y",40).text("3G/LTE");
	field_list.append("rect").attr("width",5).attr("height",5).attr("x",5).attr("y",50)
				.attr("stroke","none").attr("fill","#34989A");
	field_list.append("text").attr("x",15).attr("y",55).text("GPS");
	field_list.append("rect").attr("width",5).attr("height",5).attr("x",5).attr("y",65)
				.attr("stroke","none").attr("fill","#ED9FBD");
	field_list.append("text").attr("x",15).attr("y",70).text("WIFI");
	field_list.append("rect").attr("width",5).attr("height",5).attr("x",5).attr("y",80)
				.attr("stroke","none").attr("fill","#EA7C4B");
	field_list.append("text").attr("x",15).attr("y",85).text("CPU");

	var battery_graph_resize = function onResize() {
		width = d3.select('#battery-deeper').style('width').split("px")[0]-80;
		d3.select("#battery_svg").attr("width",width+margin.left+margin.right);
		pane.attr("width",width);
		d3.select("#battery_clip_rect").attr("width",width);
		x.range([0,width]);
		onZoom();
		legend.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");
	}

	resizeFunctions.push(battery_graph_resize);

}

function drawEventScreenshot (data) {

	var inner_div = d3.select("#event-screenshot-inner");
	var per_screenshot = {width: 130, height: 200, margin_rl: 10, margin_tb: 10};

	inner_div.style("width",(per_screenshot.width+20)*data.length+"px");

	//process data to group activities
	var activities = [];
	var zero = data[0].client_timestamp;
	for (var i in data) {
		var flag = true;
		var currentActivity = activities[activities.length-1];
		data[i].client_timestamp -= zero;
		if ( (currentActivity!=null) && (data[i].activity_class == currentActivity.name) ){
			flag = false;
			currentActivity.events.push(data[i]);
			currentActivity.end_time=data[i].client_timestamp;
		}
		if (flag) activities.push({
			"name":data[i].activity_class,
			"events": [data[i]],
			"start_time":data[i].client_timestamp,
			"end_time":data[i].client_timestamp,
		});
	}

	var activity_div = inner_div.selectAll(".activity").data(activities).enter().append("div").attr("class","activity")
		.attr("width",function (d) {return (per_screenshot.width + per_screenshot.margin_rl) * d.events.length})
		.attr("height",per_screenshot.height+per_screenshot.margin_tb);

	activity_div.append("div").attr("class","activity-name")
		.text(function (d) {
			var name_string = d.name.split('.');
			return name_string[name_string.length-1]
		}).attr("title",function (d) {return d.name});

	var each_div = activity_div.selectAll(".event-screenshot-each").data(function (d) {return d.events}).enter()
		.append("div").attr("class","event-screenshot-each")
		.on("click", function (d) {
			supportLine.line_shift(d.client_timestamp);
		});

	each_div.append("img").attr("src",function (d) {return d.src});
	each_div.append("div").attr("class","view-each").text(function (d) {
		return d.view})
	each_div.append("div").attr("class","event-each").text(function (d) {
		return d.action_type+"("+d.param+")"});
	each_div.append("div").attr("class","sleep-each").text(function (d) {
		return d.sleep+"ms"})

}

function SupportLine () {
	var line;
	var x;
	var last_timestamp;
	function line_shift (timestamp) {
		last_timestamp = timestamp;
		this.line.attr("x1",this.x(timestamp)).attr("x2",this.x(timestamp));
	}
	function line_renew () {
		this.line.attr("x1",this.x(last_timestamp)).attr("x2",this.x(last_timestamp));
	}

	return {line: line, x: x, line_shift: line_shift, line_renew: line_renew};
}

var supportLine;