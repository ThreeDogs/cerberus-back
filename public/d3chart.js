"use strict";

function drawEventChart(data){

	//SETUP margin, width, height
	var margin = 50,
		width = 2000,
		height = 150;

	//SETUP svg
	var svg = d3.select("#event_chart")
				.append("svg")
				.attr("width", width+margin*2)
				.attr("height", height+margin);

	//JOIN data and make a group
	var events = svg.selectAll("g event")
					.data(data.events)
					.enter()
					.append("g");
	
	//add text to the group
	var gtext = events.append("text")
				.attr("class", "event_text")
				.text(function (d) {return d.event_name});

	//add shape to the group
	var gshape = events.append("rect");

	//add arrow to the group
	var garrow;


	var x_extent, x_scale, x_axis;

	//event-line



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


	function chart1() {

		x_extent = d3.extent(data.cpu, function (d) {return d.time});
		x_scale = d3.scale.linear().domain(x_extent).range([margin,width]);
		x_axis = d3.svg.axis().scale(x_scale);

		// function to control y coordinate if
		// two consecutive events are too close
		var xprev = -50;
		var yprev = 135;
		function calcy(x) {
			if (x-xprev<50) {yprev = yprev - 25}
			else {yprev = 135};
			if (yprev < 25) {yprev=135}
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
		x_scale = d3.scale.linear().domain(x_extent).range([margin,width]);

		//replace the shape+text group
		events.transition().duration(500).attr("transform",function (d) {return "translate("+x_scale(d.order)+",70)"});
		
		//remove x-axis line (fadeout)
		d3.select(".axis").transition().attr("opacity",0).duration(500);

		//draw arrow
		/*
		garrow = events.append("line")
				.attr("x1",)
				.style("stroke","black")
				.attr("stroke-width",2)
				.attr("marker-end","url(\#arrow)");
				*/


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

	function cpuChart() {

		//scale x-

	}

	chart1();
}