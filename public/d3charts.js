"use strict";

function drawCharts(data) {

	//SETUP width in relation to length of events
	var width = data.events.length*80;

	//SETUP margin
	var margin = 20;

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
			x_domain = d3.extent(data.cpu, function (d) {return d.time});
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

			var height;

			height = 100;
			event_svg = d3.select("#event_chart")
						.append("svg")
						.attr("width", width)
						.attr("height", height);

			height = 150;
			cpu_svg = d3.select("#cpu_chart")
						.append("svg")
						.attr("width", width)
						.attr("height", height);

			height = 150;
			mem_svg = d3.select("#mem_chart")
						.append("svg")
						.attr("width", width)
						.attr("height", height);
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
		}

		initialize_scales();
		initialize_svg();
		initialize_event_chart();
		initialize_cpu_chart();
		initialize_mem_chart();

	}

	initialize();

}



/*
	function eventChart() {

		//SETUP height
		var height = 100;

		//SETUP svg
		var svg = d3.select("#event_chart")
						.append("svg")
						.attr("width", width)
						.attr("height", height);

		//JOIN events data and append a group
		var events = svg.selectAll("g event")
						.data(data.events)
						.enter()
						.append("g");
		
		//SETUP group elements
		var gtext = events.append("text")
						.attr("class", "event_text")
						.text(function (d) {return d.event_name});
		var gshape = events.append("rect");
		var garrow;

		var x_extent, x_scale, x_axis;


		function chart1() { //*************requires refactoring*****************

			x_extent = d3.extent(data.cpu, function (d) {return d.time});
			x_scale = d3.scale.linear().domain(x_extent).range([margin,width-margin]);
			x_axis = d3.svg.axis().scale(x_scale);

			// function to control y coordinate if
			// two consecutive events are too close
			var xprev = -50;
			var yprev = 90;
			function calcy(x) {
				if (x-xprev<50) {yprev = yprev - 20}
				else {yprev = 90};
				if (yprev < 20) {yprev=90}
				xprev = x;
				return yprev;
			}

			events.transition().attr("transform",function (d) {return "translate("+x_scale(d.time)+","+calcy(x_scale(d.time))+")"});
			
			//adjust the text position
			gtext.transition().attr("dx",5).attr("dy",4);

			function getColorFromEventType(event_type) {
				if (event_type == "onClick") {return "blue"}
				else {return "black"}
			}

			//add circlified rectangle to the group
			gshape.transition()
				.attr("width",10)
				.attr("height",10)
				.attr("rx",10)
				.attr("ry",10)
				.attr("fill",function (d) { return getColorFromEventType(d.event_type)});

			//x-axis
			if (d3.select(".axis").empty()){
				d3.select("svg")
				  .append("g")
				  .attr("class", "x axis")
				  .attr("opacity",1)
				  .attr("transform", "translate(0,"+(height)+")")
				  .call(x_axis);
			}
			else {
				d3.select(".axis")
				  .transition()
				  .attr("opacity",1);
			}
		}

		function chart2() {
		
			//rescale x-axis
			x_extent = d3.extent(data.events, function (d) {return d.order});
			x_scale = d3.scale.linear().domain(x_extent).range([margin,width-margin]);

			//replace the shape+text group
			events.transition().duration(500).attr("transform",function (d) {return "translate("+x_scale(d.order)+",20)"});
			
			//remove x-axis line (fadeout)
			d3.select(".axis").transition().attr("opacity",0).duration(500);

			//draw arrow
	
		//	garrow = events.append("line")
		//			.attr("x1",)
		//			.style("stroke","black")
		//			.attr("stroke-width",2)
		//			.attr("marker-end","url(\#arrow)");
		


			//change rect
			gshape.transition()
				.attr("width",80)
				.attr("height",60)
				.attr("rx",5)
				.attr("ry",5)
				.attr("fill","transparent")
				.attr("stroke","black");

			//adjust the text position
			gtext.transition().attr("dy",15);

		}

		var button = d3.select("svg").append("g").on("click",changeChart);
		button.append ("rect")
				.attr("width",80)
				.attr("height",30)
				.attr("fill","transparent")
				.attr("stroke","black");
		button.append("text")
				.attr("z-index",1)
				.attr("dy",20)
				.text("time/event");

		var chartState = 1
		function changeChart() {
			if(chartState==1) {
				chart2();
				chartState = 2;
			}
			else {
				chart1();
				chartState = 1;
			}

		}

		chart1();

	}

	function cpuChart() {

		//SETUP height
		var height = 100;

		//SETUP svg
		var svg = d3.select("#cpu_chart")
						.append("svg")
						.attr("width", width)
						.attr("height", height);

		//JOIN events data and append a group
		var dots = svg.selectAll("g cpu")
						.data(data.cpu)
						.enter()
						.append("g")
		
		dots.append("circle").attr("r",5);

	}

	eventChart();

	cpuChart();
*/