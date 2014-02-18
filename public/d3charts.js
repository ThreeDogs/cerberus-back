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
	var cpu_group, gcpudot, cpu_path, cpu_axis; //for cpu svg
	var mem_group, gmemdot, mem_path, mem_axis; //for mem svg

	//SETUP tooltip
	var tooltip;

	//SETUP toggle to toggle between form1 - form2
	var toggle=1;

	function initialize() {

		var initialize_scales = function () {

			var x_domain, x_range;

			//SETUP SCALES (time axis & polylinear axis)
			//**SCALES are FUNCTIONS that map a data to its position along the axis.**
			x_domain = d3.extent(data.cpu, function (d) {return d.time*1.1});
			x_range = [margin,width-margin];
			t_scale = d3.scale.linear().domain(x_domain).range(x_range);

			x_domain = [0,data.events.length+1];
			order_scale = d3.scale.linear().domain(x_domain).range(x_range);

			x_domain = [];
			x_range = [];
			
			for(var i=0; i<data.events.length; i++){
				x_domain.push(data.events[i].time);
				x_range.push(data.events[i].order);
			}

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

			var color = d3.scale.category10();

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
				if (event_type == "onClick") {return color(1)}
				else if (event_type == "hard_key") {return color(2)}
				else {return color(0)}
			}

			event_axis = event_svg.append("g")
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

			cpu_path = cpu_svg.append("path")
							.attr("d",line(data.cpu))
							.attr("class","cpu_path");

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

			mem_path = mem_svg.append("path")
							.attr("d",line(data.mem))
							.attr("class","mem_path");

			mem_axis = mem_svg.append("g")
							.attr("class", "x axis")
							.attr("transform", "translate(0,"+(mem_svg_height-30)+")")
							.call(d3.svg.axis().scale(t_scale));

			mem_svg.append("g")
					.attr("class", "y axis")
					.attr("transform","translate(40,0)")
					.call(d3.svg.axis().scale(y_percent_scale).ticks(5).orient("left"));
		}

		var initialize_tooltip = function () {

			tooltip = d3.select("body")
						.append("div")
						.attr("class","tooltip")
						.style("position", "absolute")
						.style("z-index", "10")
						.style("visibility", "hidden");

			event_group.selectAll("rect").on("mouseover", function () {
				return tooltip.style("visibility", "visible")
							.style("top", (event.pageY-50)+"px")
							.style("left",(event.pageX-50)+"px");
				}).on("mouseout", function(){return tooltip.style("visibility", "hidden");});
		}

		initialize_scales();
		initialize_svg();
		initialize_event_chart();
		initialize_cpu_chart();
		initialize_mem_chart();
		initialize_tooltip();

	}

	function form1() {

		var line = d3.svg.line()
						.x(function(d){return t_scale(d.time)})
						.y(function(d){return y_percent_scale(d.percentage)});

		function event_chart_change() {
			event_group.transition()
						.attr("transform", function (d) {
							return "translate("+t_scale(d.time)+",80)";
						});
			event_axis.transition()
						.attr("opacity",1);

			grect.transition()
						.attr("width",10)
						.attr("height",10)
						.attr("rx",10)
						.attr("ry",10);
		}

		function cpu_chart_change() {
			cpu_group.transition()
					.attr("transform", function (d) {
						return "translate("+t_scale(d.time)+","+y_percent_scale(d.percentage)+")";
					});

			cpu_path.transition()
					.attr("d",line(data.cpu));

			cpu_svg.select(".x").transition().call(d3.svg.axis().scale(t_scale));
		}

		function mem_chart_change() {
			mem_group.transition()
					.attr("transform", function (d) {
						return "translate("+t_scale(d.time)+","+y_percent_scale(d.percentage)+")";
					});

			mem_path.transition()
					.attr("d",line(data.mem));

			mem_svg.select(".x").transition().call(d3.svg.axis().scale(t_scale));
		}

		event_chart_change();
		cpu_chart_change();
		mem_chart_change();
	}


	function form2() {

		var line = d3.svg.line()
						.x(function(d){return order_scale(polylinear_helper(d.time))})
						.y(function(d){return y_percent_scale(d.percentage)});

		function event_chart_change() {
			event_group.transition()
				.attr("transform", function (d) {
					return "translate("+order_scale(d.order)+",40)";
				});

			grect.transition()
					.attr("width",60)
					.attr("height",30)
					.attr("rx",5)
					.attr("ry",5);

			event_axis.transition()
					.attr("opacity",0);
		}

		function cpu_chart_change() {
			cpu_group.transition()
				.attr("transform", function (d) {
					return "translate("+order_scale(polylinear_helper(d.time))+","+y_percent_scale(d.percentage)+")";
				});
		
			cpu_path.transition()
					.attr("d",line(data.cpu));

			cpu_svg.select(".x").transition().call(d3.svg.axis().scale(order_scale));
		}
		
		function mem_chart_change() {
			mem_group.transition()
					.attr("transform", function (d) {
						return "translate("+order_scale(polylinear_helper(d.time))+","+y_percent_scale(d.percentage)+")";
					});

			mem_path.transition()
					.attr("d",line(data.mem));

			mem_svg.select(".x").transition().call(d3.svg.axis().scale(order_scale));
		}

		event_chart_change();
		cpu_chart_change();
		mem_chart_change();
	}

	document.getElementById("toggle").onclick = function(){
		if (toggle==1) {toggle=2; form2();}
		else {toggle=1; form1();}
	}

	initialize();
}