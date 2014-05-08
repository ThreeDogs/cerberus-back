
function drawDetailReports(data) {


	var event_graph_resize;

	function drawEventPath(eventdata) {

		var margin = {top: 10, right: 10, bottom: 30, left: 50};
		var width = window_x-600;
		var height = 80;

		var activities = [];

		var event_svg = d3.select("#event_flow").append("svg")
						.attr("id","event_svg")
						.attr("height",height+margin.top+margin.bottom)
						.attr("width",width+margin.left+margin.right)
						.append("g")
						.attr("transform","translate("+margin.left+","+margin.top+")");

		var x = d3.scale.linear().range([0, width]);
		x_extent = [0, eventdata[eventdata.length-1].time_stamp];
		x.domain(x_extent);

		var xAxis = d3.svg.axis()
					    .scale(x)
					    .orient("bottom")
					    .tickSize(0,0)
					    .tickPadding(6);

		event_svg.append("clipPath")
				.attr("id","clip")
				.append("rect")
				.attr("id","#event_clip_rect")
				.attr("width",width)
				.attr("height",height);

		var event_group = event_svg.selectAll("g event")
					.data(eventdata)
					.enter()
					.append("g");

		var detail_box = d3.select("#event_graph_detail_info");

		var grect = event_group.append("rect")
					.attr("class", "event_rect")
					.attr("width",10)
					.attr("height",10)
					.attr("rx",10)
					.attr("ry",10)
					.attr("stroke","none")
					.attr("fill","#DBEEE1")
					.attr("cursor","help")
					.on("click",function (d) {
						detail_box.selectAll("div").remove();
						detail_box.append("div")
							.text("time stamp: "+d.time_stamp);
						detail_box.append("div")
							.text("activity class: "+d.activity_class);
						detail_box.append("div")
							.text("view: "+d.view);
						detail_box.append("div")
							.text("action type: "+d.action_type);
					});

		event_group.attr("transform", function (d) {
			return "translate("+x(d.time_stamp)+",60)";
		});


		event_group.each(function (d, i) {
			var flag = true;
			var currentActivity = activities[activities.length-1];
			if (currentActivity!=null && d.activity_class == currentActivity.name){
				flag = false;
				currentActivity.end_time=d.time_stamp;
				currentActivity.end_num=d.id;
			}
			if (flag) activities.push({
				"name":d.activity_class,
				"start_time":d.time_stamp,
				"start_num":d.id,
				"end_time":d.time_stamp,
				"end_num":d.id
			});
		})

		var zoom = d3.behavior.zoom().on("zoom", onZoom)
					.scaleExtent([0.1,4])
					.x(x);

		var gact = event_svg.selectAll("activityBox")
					.data(activities)
					.enter()
					.append("rect");

		gact.attr("x", function (d) {return x(d.start_time)})
			.attr("y", 20)
			.attr("class", "activityBox")
			.attr("width", function (d) {return x(d.end_time)-x(d.start_time)+10})
			.attr("height", 50)
			.attr("stroke", "black")
			.attr("fill", "#A9D8B9")
			.attr("title", function (d) {return d.name})
			.on("click",function (d) {
				detail_box.selectAll("div").remove();
				detail_box.append("div")
					.text("Activity: "+d.name);
			});

		event_svg.append("g")
		    .attr("class", "x axis")
		    .attr("transform", "translate(0,"+height+")");

		var pane = event_svg.append("rect")
		    .attr("class", "pane")
		    .attr("width", width)
		    .attr("height", height+margin.bottom)
		    .call(zoom);

		gact.moveToFront();
		event_group.moveToFront();

		onZoom();

		var toggle = "Time";

		function onZoom() {
			event_svg.select("g.x.axis").call(xAxis);
			
			if (toggle=="Time") {
				event_group.attr("transform", function (d) {
					return "translate("+x(d.time_stamp)+",60)";
				});
				gact.attr("x",function (d) {return x(d.start_time)})
					.attr("width", function (d) {return x(d.end_time)-x(d.start_time)+10});
			}
			else if (toggle=="Order") {
				event_group.attr("transform", function (d) {
					return "translate("+x(d.id)+",60)";
				});
				gact.attr("x",function (d) {return x(d.start_num)})
					.attr("width", function (d) {return x(d.end_num)-x(d.start_num)+10});
			}
		}

		event_graph_resize = function onResize() {
			width = window_x-600;
			d3.select("#event_svg").attr("width",width+margin.left+margin.right);
			pane.attr("width",width);
			d3.select("#event_clip_rect").attr("width",width);
			x.range([0,width]);
			onZoom();
		}

		function onTimeAxis() {
			x_extent = [0, eventdata[eventdata.length-1].time_stamp];
			x.domain(x_extent);
			toggle = "Time";
			onZoom();
		}

		function onOrderAxis() {
			x_extent = [0, eventdata.length+1];
			x.domain(x_extent);
			toggle = "Order";
			onZoom();
		}

		d3.select("#event_x_time").on("click",onTimeAxis);
		d3.select("#event_x_order").on("click",onOrderAxis);

	}

	var mem_graph_resize;

	function drawMemUsage(memdata) {
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

		x_extent = [0, memdata.length+1];
		y_extent = [0, d3.max(memdata, function(d) { return d.mem_total; })];
		x.domain(x_extent);
		y.domain(y_extent);

		var xAxis = d3.svg.axis()
					    .scale(x)
					    .orient("bottom")
					    .tickSize(-height, 0)
					    .tickPadding(6);

		var yAxis = d3.svg.axis()
					    .scale(y)
					    .orient("left")
					    .tickSize(-width)
					    .tickPadding(6);

		var clip = mem_svg.append("clipPath")
				.attr("id", "clip")
				.append("rect")
				.attr("id","#mem_clip_rect")
				.attr("width",width)
				.attr("height",height);

		var zoom = d3.behavior.zoom().on("zoom", onZoom)
					.scaleExtent([0.1,4])
					.x(x);

		mem_svg.append("g")
			.attr("class", "y axis")


		mem_svg.append("g")
		    .attr("class", "x axis")
		    .attr("transform", "translate(0,"+height+")");

		var pane = mem_svg.append("rect")
		    .attr("class", "pane")
		    .attr("width", width)
		    .attr("height", height)
		    .call(zoom);

		function MemGraph (value_name) {

			var detail_box = d3.select("#mem_graph_detail_info");

			var line = d3.svg.line().interpolate("monotone")
						.x(function(d){return x(d.id)})
						.y(function(d){return y(d[value_name])});

			var path = mem_svg.append("path")
						.attr("class","line")
						.attr("clip-path","url(#clip)")
						.attr("id",value_name)
						.attr("d",line(memdata));

			var dots = mem_svg.append("g")
						.attr("clip-path", "url(#clip)")
						.attr("id",value_name+"dots")
						.selectAll(value_name+"dots")
						.data(memdata)
						.enter()
						.append("circle")
						.attr("class",value_name+"dot dot")
						.attr("r",2)
						.attr("transform",function (d) {
							return "translate("+x(d.id)+","+y(d[value_name])+")";
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
					return "translate("+x(d.id)+","+y(d[value_name])+")";
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


		function Legend () {
			// class to create Legend object

			var legend_width = 150;
			var legend_height = 80;
			var legend_margin = {top: 10, bottom: 10, left: 10, right: 10};
			
			var legend = mem_svg.append("g")
					.attr("class", "legend")
					.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");

			legend.append("rect")
					.attr("class", "legend_bg")
					.attr("width",legend_width)
					.attr("height",legend_height)
					.attr("stroke","none")
					.attr("fill","#eeeeee");

			var field_list = legend.append("g").attr("class","field_list");
			var field_list_num = 0;

			function appendToLegend (field_name, field_color) {
				// inner function to append fields into legend dynamically

				field_list.append("rect").attr("width",5).attr("height",5)
							.attr("x",5).attr("y",(field_list_num * 12 + 5))
							.attr("stroke","none")
							.attr("fill",field_color);

				field_list.append("text")
							.attr("x",15).attr("y",(field_list_num * 12 + 10))
							.text(field_name);

				field_list_num = field_list_num + 1;
			}

			function clearLegend () {
				// inner function to clear legend when needed
				d3.select("g.field_list").selectAll("*").remove();
				field_list_num = 0;
			}

			function transform () {
				legend.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");
			}

			var returnObj = new Object();
			returnObj.appendToLegend = appendToLegend;
			returnObj.clearLegend = clearLegend;
			returnObj.transform = transform;
			return returnObj;
		}

		var legend = new Legend();

		mem_graph_resize = function onResize() {
			width = window_x-600;
			d3.select("#mem_svg").attr("width",width+margin.left+margin.right);
			pane.attr("width",width);
			console.dir(clip);
			clip.attr("width",width);
			x.range([0,width]);
			onZoom();
			legend.transform();
		}

		function onCheck (nativebool, dalvikbool, totalbool) {
			if (nativebool==true) {
				native_heap_size.visible();
				native_heap_alloc.visible();
			} else {
				native_heap_size.transparent();
				native_heap_alloc.transparent();
			}
			if (dalvikbool==true) {
				dalvik_heap_size.visible();
				dalvik_heap_alloc.visible();
			} else {
				dalvik_heap_size.transparent();
				dalvik_heap_alloc.transparent();
			}
			if (totalbool==true) {
				mem_total.visible();
				mem_alloc.visible();
			} else {
				mem_total.transparent();
				mem_alloc.transparent();
			}
		}

		d3.select("#dalvik_heap_checkbox").on("click",function () {
			if(this.checked==true) {
				onCheck(false, true, false);
				legend.clearLegend();
				legend.appendToLegend("Dalvik Heap Allocated","#001111");
				legend.appendToLegend("Dalvik Heap Total","#111100");
			}
			if(this.checked==false) {
				onCheck(false, false, false);
				legend.clearLegend();
			}
		})
	}

	var cpu_graph_resize;

	function drawCPUUsage(cpudata) {
		var margin = {top: 10, right: 10, bottom: 30, left: 50};
		var width = window_x-600;
		var height = 300;

		var cpu_svg = d3.select("#cpu_graph").append("svg")
						.attr("id","cpu_svg")
						.attr("height",height+margin.top+margin.bottom)
						.attr("width",width+margin.left+margin.right)
						.append("g")
						.attr("transform","translate("+margin.left+","+margin.top+")");

		var x = d3.scale.linear().range([0, width]);
		var y = d3.scale.linear().range([height, 0]);

		x_extent = [0, cpudata.length+1];
		y_extent = [0, 100];
		x.domain(x_extent);
		y.domain(y_extent);

		var xAxis = d3.svg.axis()
					    .scale(x)
					    .orient("bottom")
					    .tickSize(-height, 0)
					    .tickPadding(6);

		var yAxis = d3.svg.axis()
					    .scale(y)
					    .orient("left")
					    .tickSize(-width)
					    .tickPadding(6);

		cpu_svg.append("clipPath")
				.attr("id","clip")
				.append("rect")
				.attr("id","cpu_clip_rect")
				.attr("width",width)
				.attr("height",height);

		var detail_box = d3.select("#cpu_graph_detail_info");

		var zoom = d3.behavior.zoom().on("zoom", onZoom)
					.scaleExtent([0.1,4])
					.x(x);

		var pane = cpu_svg.append("rect")
		    .attr("class", "pane")
		    .attr("width", width)
		    .attr("height", height)
		    .call(zoom);

		var line = d3.svg.line().interpolate("monotone")
						.x(function(d){return x(d.id)})
						.y(function(d){return y(d.usage)});

		var cpu_usage = cpu_svg.append("path")
								.attr("class","line")
								.attr("clip-path", "url(#clip)")
								.attr("id","cpu_usage")
								.attr("d", line(cpudata));

		var cpu_usage_dots = cpu_svg.append("g")
								.attr("clip-path", "url(#clip)")
								.attr("id","dots")
								.selectAll("dots")
								.data(cpudata)
								.enter()
								.append("circle")
								.attr("class","dot")
								.attr("r",2)
								.attr("transform",function (d) {
									return "translate("+x(d.id)+","+y(d.usage)+")";
								})
								.on("click",function (d) {
									detail_box.selectAll("div").remove();
									detail_box.append("div")
										.text("cpu usage: "+d.usage);
								});

		cpu_svg.append("g")
			.attr("class", "y axis")

		cpu_svg.append("g")
		    .attr("class", "x axis")
		    .attr("transform", "translate(0,"+height+")");

		onZoom();

		function onZoom() {
			yAxis.tickSize(-width);
			cpu_svg.select("g.x.axis").call(xAxis);
			cpu_svg.select("g.y.axis").call(yAxis);
			cpu_svg.select("#cpu_usage").attr("d",line(cpudata));
			cpu_svg.selectAll("circle.dot").attr("transform",function (d) {
				return "translate("+x(d.id)+","+y(d.usage)+")";
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
					.attr("stroke","none")
					.attr("fill","#111111");

		field_list.append("text")
					.attr("x",15).attr("y",10)
					.text("cpu usage");

		cpu_graph_resize = function onResize() {
			width = window_x-600;
			d3.select("#cpu_svg").attr("width",width+margin.left+margin.right);
			pane.attr("width",width);
			d3.select("#cpu_clip_rect").attr("width",width);
			x.range([0,width]);
			onZoom();
			legend.attr("transform", "translate("+(width-legend_width-legend_margin.right)+","+legend_margin.top+")");
		}

	}

	function resize() {
		$("#event_flow").css("width",window_x-540);
		$("#mem_graph").css("width",window_x-540);
		$("#cpu_graph").css("width",window_x-540);
		cpu_graph_resize();
		mem_graph_resize();
		event_graph_resize();
	}
	d3.select(window).on("resize",resize);

	drawEventPath(data.motion_reports);
	drawMemUsage(data.memory_reports);
	drawCPUUsage(data.cpu_reports);
}

function divMove (div, direction) {
	if (direction=="up") {
		var to_move = $("#"+div+"_div");
		to_move.prev().before(to_move);
	}
	if (direction=="down") {
		var to_move = $("#"+div+"_div");
		to_move.next().after(to_move);
	}
}
