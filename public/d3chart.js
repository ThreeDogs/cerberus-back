"use strict";

function drawEventChart(data){

	//SETUP margin, width, height
	var margin = 50,
		width = 2000,
		height = 200;

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
			.attr("dy",5);

		//add shape to the group
		gshape = events.append("circle")
			.attr("r",10)
			.attr("fill","grey")
			.attr("stroke","black");

		//x-axis
		d3.select("svg")
		  .append("g")
		  .attr("class", "x axis")
		  .attr("transform", "translate(0,"+(height)+")")
		  .call(x_axis);
	}

	chart1();

}

/*
function drawEventChart(data){

	//SETUP margin, width, height
	var margin = 50,
		width = 2000 - margin,
		height = 200 - margin;

	//SETUP svg
	var svg = d3.select("body")
				.append("svg")
				.attr("width", width+margin)
				.attr("height", height+margin);

	//SETUP x_extent
	var x_extent = d3.extent(data, function (d) {return d.order});
	var x_scale = d3.scale.linear().domain(x_extent).range([margin,width]);

	//JOIN data and put the group in place
	var events = svg.selectAll("g event")
					.data(data)
					.enter()
					.append("g")
					.attr("transform",function (d) {return "translate("+x_scale(d.order)+",50)"});
	
	//add rect to the group
	events.append("rect")
			.attr("width",80)
			.attr("height",30)
			.attr("fill","grey")
			.attr("stroke","black");

	//add text to the group
	events.append("text")
			.text(function (d) {return d.event_name})
			.attr("dy",5);

}*/