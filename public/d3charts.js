"use strict";

function drawCharts(data) {

	//SETUP width in relation to length of events
	var width = data.events.length*80;
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
	var event_group, gtext, grect, garrow, event_axis; //for event svg
	var cpu_group, gcpudot, cpu_axis; //for cpu svg
	var mem_group, gmemdot, mem_axis; //for mem svg


	function initialize() {

		var initialize_scales = function () {

			var x_domain, x_range;

			//SETUP SCALES (time axis & polylinear axis)
			//**SCALES are FUNCTIONS that map a data to its position along the axis.**
			x_domain = d3.extent(data.cpu, function (d) {return d.time*1.1});
			x_range = [margin,width-margin];
			t_scale = d3.scale.linear().domain(x_domain).range(x_range);

			x_domain = d3.extent(data.events, function (d) {return d.order});
			order_scale = d3.scale.linear().domain(x_domain).range(x_range);

			x_domain = [];
			x_range = [];
			d3.selectAll("g event")
				.data(data.events)
				.each(function (d, i){
					x_range.push(d.order);
					x_extent.push(d.time);
				});
			polylinear_helper = d3.scale.linear().domain(x_domain).range(x_range);

			y_percent_scale = d3.scale.linear().domain([0,100]).range([120, 20]);
		}

		var initialize_svg = function () {

			event_svg_height = 110;
			event_svg = d3.select("#event_chart")
						.append("svg")
						.attr("width", width)
						.attr("height", event_svg_height);

			cpu_svg_height = 150;
			cpu_svg = d3.select("#cpu_chart")
						.append("svg")
						.attr("width", width)
						.attr("height", cpu_svg_height);

			mem_svg_height = 150;
			mem_svg = d3.select("#mem_chart")
						.append("svg")
						.attr("width", width)
						.attr("height", mem_svg_height);
		}

		var initialize_event_chart = function () {

			event_group = event_svg.selectAll("g event")
						.data(data.events)
						.enter()
						.append("g");

			grect = event_group.append("rect")
						.attr("class", "event_rect")
						.attr("width",10)
						.attr("height",10)
						.attr("rx",10)
						.attr("ry",10)
						.attr("stroke", function (d) {return getColorFromEventType(d.event_type)})
						.attr("fill", function (d) {return getColorFromEventType(d.event_type)});

			gtext = event_group.append("text")
						.attr("class", "event_text")
						.text(function (d) {return d.event_name});

			//garrow =

			event_group.attr("transform", function (d) {
				return "translate("+t_scale(d.time)+",80)";
			});

			function getColorFromEventType(event_type) {
				if (event_type == "onClick") {return "blue"}
				else {return "black"}
			}

			event_svg.append("g")
					  .attr("class", "x axis")
					  .attr("opacity",1)
					  .attr("transform", "translate(0,"+(event_svg_height-20)+")")
					  .call(d3.svg.axis().scale(t_scale));
		}

		var initialize_cpu_chart = function () {

			cpu_group = cpu_svg.selectAll("g cpu")
						.data(data.cpu)
						.enter()
						.append("g");

			gcpudot = cpu_group.append("circle")
						.attr("r",2)
						.attr("stroke","black");

			cpu_group.attr("transform", function (d) {
				return "translate("+t_scale(d.time)+","+y_percent_scale(d.percentage)+")";
			});

			var line = d3.svg.line()
							.x(function(d){return t_scale(d.time)})
							.y(function(d){return y_percent_scale(d.percentage)});

			cpu_svg.append("path")
					.attr("d",line(data.cpu))
					.attr("class","cpu_path");

			cpu_svg.append("g")
					.attr("class", "x axis")
					.attr("transform", "translate(0,"+(cpu_svg_height-30)+")")
					.call(d3.svg.axis().scale(t_scale));

			cpu_svg.append("g")
					.attr("class", "y axis")
					.attr("transform","translate(40,0)")
					.call(d3.svg.axis().scale(y_percent_scale).ticks(5).orient("left"));
		}

		var initialize_mem_chart = function () {

			mem_group = mem_svg.selectAll("g mem")
						.data(data.mem)
						.enter()
						.append("g");

			gmemdot = mem_group.append("circle")
						.attr("r",2)
						.attr("stroke","black");

			mem_group.attr("transform", function (d) {
				return "translate("+t_scale(d.time)+","+y_percent_scale(d.percentage)+")";
			});

			var line = d3.svg.line()
							.x(function(d){return t_scale(d.time)})
							.y(function(d){return y_percent_scale(d.percentage)});

			mem_svg.append("path")
					.attr("d",line(data.mem))
					.attr("class","mem_path");

			mem_svg.append("g")
					.attr("class", "x axis")
					.attr("transform", "translate(0,"+(mem_svg_height-30)+")")
					.call(d3.svg.axis().scale(t_scale));

			mem_svg.append("g")
					.attr("class", "y axis")
					.attr("transform","translate(40,0)")
					.call(d3.svg.axis().scale(y_percent_scale).ticks(5).orient("left"));
		}

		initialize_scales();
		initialize_svg();
		initialize_event_chart();
		initialize_cpu_chart();
		initialize_mem_chart();

	}

	initialize();

}