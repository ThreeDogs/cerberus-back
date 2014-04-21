function drawCharts(data) {

	//something

	//SETUP width in relation to length of events
	var width = data.motion_reports.length*140;
	var event_svg_height, cpu_svg_height, mem_svg_height;

	//SETUP margin
	var margin = 40;

	//SETUP SCALES (time axis & polylinear axis)
	//**SCALES are FUNCTIONS that map a data to its position along the axis.**
	var t_scale, polylinear_helper, order_scale;
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

	//SETUP toggle to toggle between form1 - form2
	var toggle=1;

	d3.selection.prototype.moveToFront = function() {
		return this.each(function(){this.parentNode.appendChild(this);});
	};

	function initialize() {

		var initialize_scales = function () {

			// var sum = 0;
			// for (var i in data.motion_reports) {
			// 	sum = i.sleep
			// }


			var x_domain, x_range;

			//SETUP SCALES (time axis & polylinear axis)
			//**SCALES are FUNCTIONS that map a data to its position along the axis.**
			x_domain = d3.extent(data.motion_reports, function (d) {return d.time_stamp*1.1});
			x_range = [margin,width-margin];
			t_scale = d3.scale.linear().domain(x_domain).range(x_range);

			x_domain = [0,data.motion_reports.length+1];
			x_range = [0,width+100];
			order_scale = d3.scale.linear().domain(x_domain).range(x_range);

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

			event_svg_height = 110;
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

			gtext = event_group.append("text")
						.attr("class", "event_text")
						.attr("dy",20)
						.text(function (d) {return d.action_type});

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
				return "translate("+t_scale(d.time_stamp)+",80)";
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
						.attr("width", function (d) {return t_scale(d.end_time-d.start_time)-30})
						.attr("height", 70)
						.attr("stroke", "black")
						.attr("fill", "#A9D8B9")
						.attr("title", function (d) {return d.name});

			event_axis = event_svg.append("g")
						  .attr("class", "x axis")
						  .attr("opacity",1)
						  .attr("transform", "translate(0,"+(event_svg_height-20)+")")
						  .call(d3.svg.axis().scale(t_scale));
			
			event_group.moveToFront();

			garrow = event_group.append("line")
						.attr("x1",10).attr("y1",5)
						.attr("x2",20).attr("y2",5)
						.style("stroke","#5DBE88")
						.attr("stroke-width",2)
						.attr("opacity",0);

			garrow.moveToFront();

		}

		var initialize_cpu_chart = function () {

			var line = d3.svg.line()
							.interpolate("monotone")
							.x(function(d){return t_scale(d.time)})
							.y(function(d){return y_percent_scale(d.percentage)});

			cpu_path = cpu_svg.append("path")
							.attr("d",line(data.cpu))
							.attr("class","cpu_path")
							.attr("stroke","#60BD89");

			cpu_group = cpu_svg.selectAll("g cpu")
						.data(data.cpu)
						.enter()
						.append("g");

			gcpudot = cpu_group.append("circle")
						.attr("r",4)
						.attr("stroke","#60BD89")
						.attr("stroke-width",2)
						.attr("fill","white");

			cpu_group.attr("transform", function (d) {
				return "translate("+t_scale(d.time)+","+y_percent_scale(d.percentage)+")";
			});

			cpu_axis = cpu_svg.append("g")
							.attr("class", "x axis")
							.attr("transform", "translate(0,"+(cpu_svg_height-30)+")")
							.call(d3.svg.axis().scale(t_scale));

			cpu_svg.append("g")
					.attr("class", "y axis")
					.attr("transform","translate(40,0)")
					.call(d3.svg.axis().scale(y_percent_scale).ticks(5).orient("left"));
		}

		var initialize_mem_chart = function () {

			y_percent_scale = d3.scale.linear().domain([0,64]).range([170, 20]);

			var line = d3.svg.line()
							.interpolate("monotone")
							.x(function(d){return t_scale(d.time)})
							.y(function(d){return y_percent_scale(d.dh_alloc)});

			mem_path_dh = mem_svg.append("path")
							.attr("d",line(data.mem))
							.attr("class","mem_path_dh");

			line = d3.svg.line()
							.interpolate("monotone")
							.x(function(d){return t_scale(d.time)})
							.y(function(d){return y_percent_scale(d.nh_alloc)})

			mem_path_nh = mem_svg.append("path")
							.attr("d",line(data.mem))
							.attr("class","mem_path_nh");

			mem_group = mem_svg.selectAll("g mem")
						.data(data.mem)
						.enter()
						.append("g");

			gmemdot_dh = mem_group.append("circle")
						.attr("class","gmemdot_dh")
						.attr("r",4)
						.attr("cx",function (d) {return t_scale(d.time)})
						.attr("cy",function (d) {return y_percent_scale(d.dh_alloc)})
						.attr("stroke","#5DBE88")
						.attr("stroke-width",2)
						.attr("fill","white");

			gmemdot_nh = mem_group.append("circle")
						.attr("class","gmemdot_nh")
						.attr("r",4)
						.attr("cx",function (d) {return t_scale(d.time)})
						.attr("cy",function (d) {return y_percent_scale(d.nh_alloc)})
						.attr("stroke","#E7CC2F")
						.attr("stroke-width",2)
						.attr("fill","white");

			mem_axis = mem_svg.append("g")
							.attr("class", "x axis")
							.attr("transform", "translate(0,"+(mem_svg_height-30)+")")
							.call(d3.svg.axis().scale(t_scale));

			mem_svg.append("g")
					.attr("class", "y axis")
					.attr("transform","translate(40,0)")
					.call(d3.svg.axis().scale(y_percent_scale).ticks(5).orient("left"));

			var areafunction = d3.svg.area()
							.x(function(d){return t_scale(d.time)})
							.y0(y_percent_scale(0))
							.y1(function(d){return y_percent_scale(d.dh_alloc/d.dh_size*100)});

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

	function form2() {

		y_percent_scale = d3.scale.linear().domain([0,100]).range([170, 20]);

		var line = d3.svg.line()
						.x(function(d){return order_scale(polylinear_helper(d.time))})
						.y(function(d){return y_percent_scale(d.percentage)});

		function event_chart_change() {
			event_group.attr("transform", function (d) {
					return "translate("+order_scale(d.order)+",40)";
				});

			grect.attr("width",120)
					.attr("height",30)
					.attr("rx",5)
					.attr("ry",5);

			garrow.attr("x1",120).attr("y1",15)
					.attr("x2",140).attr("y2",15)
					.attr("opacity",1);

			event_axis.attr("opacity",0);

			gact.attr("x", function (d) {return order_scale(d.start_num)})
				.attr("y", 20)
				.attr("width", function (d) {return order_scale(d.end_num-d.start_num)+120})
				.attr("height", 80);
		}

		event_chart_change();
	}


	initialize();
	form2();
}