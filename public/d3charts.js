"use strict";

function drawEventCharts(data){

	//SETUP width, height
	//TODO: width has to be adjusted in correspondence to input data length
	var width = 2000,
		height = 600;

	//SETUP margin
	var margin_rl = 50;

	//SETUP svg on div id "charts"
	var svg = d3.select("#charts")
				.append("svg")
				.attr("width", width+margin_rl*2)
				.attr("height", height+margin);

	var events_g;
	var cpu_g;
	var mem_g;

	var time_range;

	function initialize(){

		function init_data(){

			events_data = svg.selectAll("event")
							.data(data.events)
							.enter()
							.append("g");


		}



		function set_axis(){


		}


	}




}