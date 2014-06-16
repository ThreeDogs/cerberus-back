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

	var tr = table.selectAll("tr").data(data).enter().append("tr");

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
		var margin = {top:10, right: 10, bottom: 30, left: 60};
		var svg = d3.select('#battery-chart').append('svg')
					.attr('width',width).attr('height',height);

		data.forEach(function(element, index, array) {
			elemement.sum = element.cpu + element.gps + element.wifi + element.threeg + element.sound;
		})

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

		var fields = ["cpu","gps","wifi","threeg","sound"];

		var cpu_field = new Field("cpu");
		var gps_field = new Field("gps");
		var wifi_field = new Field("wifi");
		var threeg_field = new Field("threeg");
		var sound_field = new Field("sound");

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

	drawEventScreenshot(dataProcess(data.motion_event_infos));
	drawCPUChart(dataProcess(data.cpu_infos));
	drawMemChart(dataProcess(data.memory_infos));
}

function dataProcess(data) {
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
								detail_box.selectAll("div").remove();
								detail_box.append("div")
									.text("cpu usage: "+d.usage);
							});

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
	var margin = {top: 10, right: 10, bottom: 30, left: 50};
	var width = window_x-600;
	var height = 300;

	var mem_svg = d3.select("#mem_graph").append("svg")
					.attr("id","mem_svg")
					.attr("height",height+margin.top+margin.bottom)
					.attr("width",width+margin.left+margin.right)
					.append("g")
					.attr("transform","translate("+margin.left+","+margin.top+")");

	var x = d3.scale.linear().range([0, width]);
	var y = d3.scale.linear().range([height, 0]);

	x_extent = [0, memdata[memdata.length-1].client_timestamp];
	y_extent = [0, d3.max(memdata, function(d) { return d.mem_total; })];
	x.domain(x_extent);
	y.domain(y_extent);

	var xAxis = d3.svg.axis().scale(x).orient("bottom")
				    .tickSize(-height, 0).tickPadding(6);

	var yAxis = d3.svg.axis().scale(y).orient("left")
				    .tickSize(-width).tickPadding(6);

	var clip = mem_svg.append("clipPath").attr("id", "mem_lip")
			.append("rect").attr("id","#mem_clip_rect")
			.attr("width",width).attr("height",height);

	var zoom = d3.behavior.zoom().on("zoom", onZoom)
				.scaleExtent([0.1,4]).x(x);

	mem_svg.append("g").attr("class", "y axis")

	mem_svg.append("g").attr("class", "x axis").attr("transform", "translate(0,"+height+")");

	var pane = mem_svg.append("rect").attr("class", "pane")
	    .attr("width", width).attr("height", height).call(zoom);

	function MemGraph (value_name) {

		var detail_box = d3.select("#mem_graph_detail_info");

		var line = d3.svg.line().interpolate("monotone")
					.x(function(d){return x(d.client_timestamp)})
					.y(function(d){return y(d[value_name])});

		var path = mem_svg.append("path")
					.attr("class","line")
					.attr("clip-path","url(#mem_clip)")
					.attr("id",value_name)
					.attr("d",line(memdata));

		var dots = mem_svg.append("g")
					.attr("clip-path", "url(#mem_clip)")
					.attr("id",value_name+"dots")
					.selectAll(value_name+"dots")
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

		function transparent() {
			path.transition().attr("opacity",0);
			dots.transition().attr("opacity",0);
		}

		function visible() {
			path.transition().attr("opacity",1);
			dots.transition().attr("opacity",1);
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

	var native_heap_size = new MemGraph('native_heap_size');
	var native_heap_alloc = new MemGraph('native_heap_alloc');
	var dalvik_heap_size = new MemGraph('dalvik_heap_size');
	var dalvik_heap_alloc = new MemGraph('dalvik_heap_alloc');
	var mem_total =	new MemGraph('mem_total');
	var mem_alloc = new MemGraph('mem_alloc');

	function onZoom() {
		yAxis.tickSize(-width);
		mem_svg.select("g.x.axis").call(xAxis);
		mem_svg.select("g.y.axis").call(yAxis);
		native_heap_size.renew();
		native_heap_alloc.renew();
		dalvik_heap_size.renew();
		dalvik_heap_alloc.renew();
		mem_total.renew();
		mem_alloc.renew();
	}
	onZoom();

	mem_graph_resize = function onResize() {
		width = window_x-600;
		d3.select("#mem_svg").attr("width",width+margin.left+margin.right);
		pane.attr("width",width);
		clip.attr("width",width);
		x.range([0,width]);
		onZoom();
		legend.transform();
	}
}