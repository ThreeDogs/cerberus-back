function drawCharts(data) {

	//SETUP margin and width in relation to length of events

	var unit_length = 100;
	var margin = 50;
	var width = data.motion_reports.length*unit_length + margin * 2;
	var event_svg_height, cpu_svg_height, mem_svg_height;

	//SETUP SCALES (time axis & polylinear axis)
	//**SCALES are FUNCTIONS that map a data to its position along the axis.**
	var t_scale;
	var polylinear_helper;
	var order_scale;
	var y_percent_scale;

	//SETUP one SVG for each chart
	var event_svg, cpu_svg, mem_svg;

	//SETUP variables necessary for manipulating transitions
	var event_group, gtext, grect, garrow, event_axis, activity_group, gact; //for event svg
	var cpu_group, gcpudot, cpu_path, cpu_axis; //for cpu svg
	var mem_group, gmemdot_nh, mem_path_nh, gmemdot_dh, mem_path_dh, mem_axis; //for mem svg

	//SETUP tooltip
	var tooltip;

	//SETUP event_specific box
	var event_specific_box;

	//SETUP toggle to toggle between "event_axis" and "time_axis"
	var toggle="time_axis";

	//function to control which svg element shows on top
	d3.selection.prototype.moveToFront = function() {
		return this.each(function(){this.parentNode.appendChild(this);});
	};

	function initialize() {

		var initialize_scales = function () {

			var x_domain, x_range;

			//SETUP SCALES (time axis & polylinear axis)
			//**SCALES are FUNCTIONS that map a data to its position along the axis.**

			x_domain = [0,data.motion_reports[data.motion_reports.length-1].time_stamp];
			x_range = [margin,width-margin];
			t_scale = d3.scale.linear().domain(x_domain).range(x_range);

			x_domain = [0,data.motion_reports.length+1];
			x_range = [margin,width-margin];
			order_scale = d3.scale.linear().domain(x_domain).range(x_range);

			//polylinear hepler의 첫 값이 0이 아니면 깨짐
			x_domain = [];
			x_range = [];
			
			for(var i=0; i<data.motion_reports.length; i++){
				x_domain.push(data.motion_reports[i].time_stamp);
				x_range.push(data.motion_reports[i].id);
			}

			polylinear_helper = d3.scale.linear().domain(x_domain).range(x_range);

			y_percent_scale = d3.scale.linear().domain([0,100]).range([170, 20]);
		}

		var initialize_svg = function () {

			event_svg_height = 100;
			event_svg = d3.select("#event_flow")
						.append("svg")
						.attr("width", width)
						.attr("height", event_svg_height);

			cpu_svg_height = 200;
			cpu_svg = d3.select("#cpu")
						.append("svg")
						.attr("width", width)
						.attr("height", cpu_svg_height);

			mem_svg_height = 200;
			mem_svg = d3.select("#memory")
						.append("svg")
						.attr("width", width)
						.attr("height", mem_svg_height);
		}

		var initialize_event_chart = function () {

			var color = d3.scale.category10();

			event_group = event_svg.selectAll("g event")
						.data(data.motion_reports)
						.enter()
						.append("g");

			grect = event_group.append("rect")
						.attr("class", "event_rect")
						.attr("width",10)
						.attr("height",10)
						.attr("rx",10)
						.attr("ry",10)
						.attr("stroke","none")
						.attr("fill","#DBEEE1");

			event_svg.append("marker")
						.attr("id","arrow")
						.attr("viewBox","0 0 6 6")
						.attr("refX",0)
						.attr("refY",3)
						.attr("markerWidth",6)
						.attr("markerHeight",6)
						.append("circle")
						.attr("r",2).attr("cx",3).attr("cy",3)
						.attr("fill","#5DBE88");

			event_group.attr("transform", function (d) {
				return "translate("+t_scale(d.time_stamp)+",60)";
			});

			var activities = [];

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

			gact = event_svg.selectAll("activityBox")
						.data(activities)
						.enter()
						.append("rect")
						.attr("x", function (d) {return t_scale(d.start_time)})
						.attr("y", 20)
						.attr("class", "activityBox")
						.attr("width", function (d) {return t_scale(d.end_time-d.start_time)-margin+10})
						.attr("height", 50)
						.attr("stroke", "black")
						.attr("fill", "#A9D8B9")
						.attr("title", function (d) {return d.name});

			event_axis = event_svg.append("g").attr("class", "x axis")
						.attr("transform", "translate(0,"+(event_svg_height-20)+")")
						.call(d3.svg.axis().scale(t_scale));

			event_group.moveToFront();

		}

		var initialize_cpu_chart = function () {

			var line = d3.svg.line()
							.interpolate("monotone")
							.x(function(d){return t_scale(d.id)})
							.y(function(d){return y_percent_scale(d.usage)});

			cpu_path = cpu_svg.append("path")
							.attr("d",line(data.cpu_reports))
							.attr("class","cpu_path")
							.attr("stroke","#60BD89");

			cpu_group = cpu_svg.selectAll("g cpu")
						.data(data.cpu_reports)
						.enter()
						.append("g");

			gcpudot = cpu_group.append("circle")
						.attr("r",4)
						.attr("stroke","#60BD89")
						.attr("stroke-width",2)
						.attr("fill","white");

			cpu_group.attr("transform", function (d) {
				return "translate("+t_scale(d.id)+","+y_percent_scale(d.usage)+")";
			});

			cpu_axis = cpu_svg.append("g")
							.attr("class", "x axis")
							.attr("transform", "translate(0,"+(cpu_svg_height-30)+")")
							.call(d3.svg.axis().scale(t_scale));

			cpu_svg.append("g")
					.attr("class", "y axis")
					.attr("transform","translate("+margin+",0)")
					.call(d3.svg.axis().scale(y_percent_scale).ticks(5).orient("left"));
		}

		var initialize_mem_chart = function () {

			var y_mem_scale = d3.scale.linear().domain([0,20000]).range([170, 20]);

			var line = d3.svg.line()
							.interpolate("monotone")
							.x(function(d){return t_scale(d.id)})
							.y(function(d){return y_mem_scale(d.dalvik_heap_alloc)});

			mem_path_dh = mem_svg.append("path")
							.attr("d",line(data.memory_reports))
							.attr("class","mem_path_dh");

			line = d3.svg.line()
							.interpolate("monotone")
							.x(function(d){return t_scale(d.id)})
							.y(function(d){return y_mem_scale(d.native_heap_alloc)})

			mem_path_nh = mem_svg.append("path")
							.attr("d",line(data.memory_reports))
							.attr("class","mem_path_nh");

			mem_group = mem_svg.selectAll("g mem")
						.data(data.memory_reports)
						.enter()
						.append("g");

			gmemdot_dh = mem_group.append("circle")
						.attr("class","gmemdot_dh")
						.attr("r",4)
						.attr("cx",function (d) {return t_scale(d.id)})
						.attr("cy",function (d) {return y_mem_scale(d.dalvik_heap_alloc)})
						.attr("stroke","#5DBE88")
						.attr("stroke-width",2)
						.attr("fill","white");

			gmemdot_nh = mem_group.append("circle")
						.attr("class","gmemdot_nh")
						.attr("r",4)
						.attr("cx",function (d) {return t_scale(d.id)})
						.attr("cy",function (d) {return y_mem_scale(d.native_heap_alloc)})
						.attr("stroke","#E7CC2F")
						.attr("stroke-width",2)
						.attr("fill","white");

			mem_axis = mem_svg.append("g")
							.attr("class", "x axis")
							.attr("transform", "translate(0,"+(mem_svg_height-30)+")")
							.call(d3.svg.axis().scale(t_scale));

			mem_svg.append("g")
					.attr("class", "y axis")
					.attr("transform","translate("+margin+",0)")
					.call(d3.svg.axis().scale(y_mem_scale).ticks(5).orient("left"));

			// var areafunction = d3.svg.area()
			// 				.x(function(d){return t_scale(d.time)})
			// 				.y0(y_percent_scale(0))
			// 				.y1(function(d){return y_percent_scale(d.dh_alloc/d.dh_size*100)});

			// mem_area = mem_svg.append("path")
			// 				.attr("class","area")
			// 				.attr("d",areafunction(data.mem));

		}
	
		initialize_scales();
		initialize_svg();
		initialize_event_chart();
		initialize_cpu_chart();
		initialize_mem_chart();

	}

	function toggle_time_axis() {

		if (toggle=="time_axis") {
			return;
		}

		function event_chart_change () {

			event_axis.remove();
			event_axis = event_svg.append("g").attr("class", "x axis")
							.attr("transform", "translate(0,"+(event_svg_height-20)+")")
							.call(d3.svg.axis().scale(order_scale));

			grect.transition()
					.attr("width",unit_length-20).attr("height",40)
					.attr("rx",0).attr("ry",0);

			event_group.transition().attr("transform", function (d) {
				return "translate("+order_scale(d.id)+",20)";
			});

			garrow = event_group.append("line")
						.attr("x1",unit_length-20).attr("y1",20)
						.attr("x2",unit_length).attr("y2",20)
						.style("stroke","#5DBE88")
						.attr("stroke-width",2);

			garrow.moveToFront();

			gtext = event_group.append("text")
						.attr("class", "event_text")
						.attr("dy",20)
						.text(function (d) {return d.action_type});

			gact.transition()
				.attr("x", function (d) {return order_scale(d.start_num)})
				.attr("y", 10)
				.attr("class", "activityBox")
				.attr("width", function (d) {return order_scale(d.end_num-d.start_num)-margin+unit_length-20})
				.attr("height", 60)
				.attr("stroke", "black")
				.attr("fill", "#A9D8B9")
				.attr("title", function (d) {return d.name});

			event_group.moveToFront();
		}

		function cpu_chart_change () {
			var line = d3.svg.line()
					.interpolate("monotone")
					.x(function(d){return order_scale(polylinear_helper(d.id))})
					.y(function(d){return y_percent_scale(d.usage)});

			cpu_axis.remove();
			cpu_axis = cpu_svg.append("g")
							.attr("class", "x axis")
							.attr("transform", "translate(0,"+(cpu_svg_height-30)+")")
							.call(d3.svg.axis().scale(order_scale));

			cpu_group.transition().attr("transform", function (d) {
				return "translate("+order_scale(polylinear_helper(d.id))+","+y_percent_scale(d.usage)+")";
			});

			cpu_path.transition().attr("d",line(data.cpu_reports));

		}

		function mem_chart_change () {
			var y_mem_scale = d3.scale.linear().domain([0,20000]).range([170, 20]);
		}

		event_chart_change();
		cpu_chart_change();
		toggle="time_axis";
	}

	function toggle_event_axis() {

		if (toggle=="event_axis") {
			return;
		}

		function event_chart_change () {

			event_axis.remove();
			event_axis = event_svg.append("g").attr("class", "x axis")
							.attr("transform", "translate(0,"+(event_svg_height-20)+")")
							.call(d3.svg.axis().scale(t_scale));

			grect.transition()
					.attr("width",10).attr("height",10)
					.attr("rx",10).attr("ry",10);

			event_group.transition().attr("transform", function (d) {
				return "translate("+t_scale(d.time_stamp)+",60)";
			});

			if (garrow) {garrow.remove()};

			gact.transition()
				.attr("x", function (d) {return t_scale(d.start_time)})
				.attr("y", 20)
				.attr("width", function (d) {return t_scale(d.end_time-d.start_time)-margin+10})
				.attr("height", 50);

			if (gtext) {gtext.remove()};

		}

		function cpu_chart_change () {
			var line = d3.svg.line()
					.interpolate("monotone")
					.x(function(d){return order_scale(polylinear_helper(d.id))})
					.y(function(d){return y_percent_scale(d.usage)});

			cpu_axis.remove();
			cpu_axis = cpu_svg.append("g")
							.attr("class", "x axis")
							.attr("transform", "translate(0,"+(cpu_svg_height-30)+")")
							.call(d3.svg.axis().scale(order_scale));

			cpu_group.transition().attr("transform", function (d) {
				return "translate("+order_scale(polylinear_helper(d.id))+","+y_percent_scale(d.usage)+")";
			});

			cpu_path.transition().attr("d",line(data.cpu_reports));

		}

		function mem_chart_change () {π
			var y_mem_scale = d3.scale.linear().domain([0,20000]).range([170, 20]);
		}

		event_chart_change();
		cpu_chart_change();
		toggle="event_axis";
	}

	initialize();
	d3.select("#time_axis_button").on("click",toggle_time_axis);
	d3.select("#event_axis_button").on("click",toggle_event_axis);
}