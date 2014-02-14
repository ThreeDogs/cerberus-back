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
					.data(data)
					.enter()
					.append("g");
	
	//add text to the group
	var gtext = events.append("text")
				.attr("class", "event_text")
				.text(function (d) {return d.event_name});

	//add shape to the group
	var gshape;

	var x_extent, x_scale, x_axis;




	function chart1() {

		x_extent = d3.extent(data, function (d) {return d.time});
		x_scale = d3.scale.linear().domain(x_extent).range([margin,width]);
		x_axis = d3.svg.axis().scale(x_scale);

		// function to control y coordinate if
		// two consecutive events are too close
		var xprev = -50;
		var yprev = 135;
		function calcy(x) {
			if (x-xprev<50){yprev = yprev - 25}
			else {yprev = 135};
			if (yprev < 25) {yprev=135}
			xprev = x;
			return yprev;
		}

		events.attr("transform",function (d) {return "translate("+x_scale(d.time)+","+calcy(x_scale(d.time))+")"});
		gtext.attr("dx",5)
			.attr("dy",4);

		//function to determine what shape for which event
		function whatShape(event_type){
			if (event_type == "onClick") {return 0}
			else if (event_type == "hard_key") {return 1}
			else if (event_type == "swipe") {return 2}
			else {return 3}
		}

		//add shape to the group
		gshape = events.append("path")
		.attr("d", d3.svg.symbol().type(function(d) { return d3.svg.symbolTypes[whatShape(d.event_type)]; }));
		//x-axis
		d3.select("svg")
		  .append("g")
		  .attr("class", "x axis")
		  .attr("opacity",1)
		  .attr("transform", "translate(0,"+(height)+")")
		  .call(x_axis);
	}


	function chart2() {
		
		//rescale x-axis
		x_extent = d3.extent(data, function (d) {return d.order});
		x_scale = d3.scale.linear().domain(x_extent).range([margin,width]);
		
		//remove x-axis line (fadeout)
		d3.select(".axis").transition().attr("opacity",0).duration(500);

		//add rect to the group
		events.append("rect")
				.attr("width",80)
				.attr("height",30)
				.attr("fill","grey")
				.attr("stroke","black");

	}

	chart1();
}