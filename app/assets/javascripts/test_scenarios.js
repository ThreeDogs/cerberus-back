function drawEventFlow(data) {


	//SETUP width in relation to length of events
	var width = data.events.length*80;
	var event_svg_height, cpu_svg_height, mem_svg_height;

	//SETUP margin
	var margin = 40;

	//SETUP SCALES
	var t_scale, order_scale;

	//SETUP one SVG for each chart
	var event_svg;

	//SETUP variables necessary for manipulating transitions
	var event_group, gtext, grect, garrow, event_axis, activity_group, gact;
	
	//SETUP tooltip
	var tooltip;

	//SETUP toggle to toggle between form1 - form2
	var toggle=1;

	function initialize() {

		var initialize_scales = function () {

			var x_domain, x_range;

			//SETUP SCALES (time axis & polylinear axis)
			//**SCALES are FUNCTIONS that map a data to its position along the axis.**
			x_domain = d3.extent(data.events, function (d) {return d.time*1.1});
			x_range = [margin,width-margin];
			t_scale = d3.scale.linear().domain(x_domain).range(x_range);

			x_domain = [0,data.events.length+1];
			order_scale = d3.scale.linear().domain(x_domain).range(x_range);
			
		}

		var initialize_svg = function () {

			event_svg_height = 110;
			event_svg = d3.select("#event_chart")
						.append("svg")
						.attr("width", width)
						.attr("height", event_svg_height);

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

			event_svg.append("marker")
						.attr("id","arrow")
						.attr("viewBox","0 0 10 10")
						.attr("refX",0)
						.attr("refY",5)
						.attr("markerWidth",3)
						.attr("markerHeight",3)
						.append("path")
						.attr("d","M 0 0 L 10 5 L 0 10 z");

			garrow = event_group.append("line")
						.attr("x1",10).attr("y1",5)
						.attr("x2",20).attr("y2",5)
						.style("stroke","black")
						.attr("stroke-width",2)
						.attr("marker-end","url(#arrow)")
						.attr("opacity",0);

			event_group.attr("transform", function (d) {
				return "translate("+t_scale(d.time)+",80)";
			});

			var activities = [];

			event_group.each(function (d, i) {
				var flag = true;
				var currentActivity = activities[activities.length-1];
				if (currentActivity!=null && d.activity_name == currentActivity.name){
					flag = false;
					currentActivity.end_time=d.time;
					currentActivity.end_num=d.order;
				}
				if (flag) activities.push({
					"name":d.activity_name,
					"start_time":d.time,
					"start_num":d.order,
					"end_time":d.time,
					"end_num":d.order
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
						.attr("height", 80)
						.attr("stroke", "black")
						.attr("fill", "transparent")
						.attr("title", function (d) {return d.name});

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

			d3.selection.prototype.moveToFront = function() {
				return this.each(function(){this.parentNode.appendChild(this);});
			};
			event_group.moveToFront();
		}


		var initialize_tooltip = function () {

			tooltip = d3.select("body")
						.append("div")
						.attr("class","tooltip")
						.style("position", "absolute")
						.style("z-index", "10")
						.style("visibility", "hidden");

			event_specific_box = d3.select("#event_specifics");

			event_group.selectAll("rect").on("mouseover", function (d) {
				tooltip.html("event type: "+d.event_type+"<br>event name: "+d.event_name);
				event_specific_box.html("event type: "+d.event_type+"<br>event name: "+d.event_name);
				return tooltip.style("visibility", "visible")
							.style("top", (event.pageY-50)+"px")
							.style("left",(event.pageX-50)+"px");
				}).on("mouseout", function(){return tooltip.text("").style("visibility", "hidden");});

			cpu_group.selectAll("circle").on("mouseover", function () {
				return tooltip.style("visibility", "visible")
							.style("top", (event.pageY-50)+"px")
							.style("left",(event.pageX-50)+"px");
				}).on("mouseout", function(){return tooltip.text("").style("visibility", "hidden");});

			mem_group.selectAll("circle").on("mouseover", function () {
				return tooltip.style("visibility", "visible")
							.style("top", (event.pageY-50)+"px")
							.style("left",(event.pageX-50)+"px");
				}).on("mouseout", function(){return tooltip.text("").style("visibility", "hidden");});
		}

		initialize_scales();
		initialize_svg();
		initialize_event_chart();
		initialize_tooltip();

	}

	function form1() {

		function event_chart_change() {
			event_group.transition()
						.attr("transform", function (d) {
							return "translate("+t_scale(d.time)+",80)";
						});
			event_axis.transition()
						.attr("opacity",1);

			garrow.transition()
					.attr("x1",10).attr("y1",5)
					.attr("x2",20).attr("y2",5)
					.attr("opacity",0);

			grect.transition()
						.attr("width",10)
						.attr("height",10)
						.attr("rx",10)
						.attr("ry",10);

			gact.transition()
				.attr("x", function (d) {return t_scale(d.start_time)})
				.attr("y", 20)
				.attr("width", function (d) {return t_scale(d.end_time-d.start_time)-30})
				.attr("height", 80);
		}

		event_chart_change();
	}


	function form2() {

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

			garrow.transition()
					.attr("x1",60).attr("y1",15)
					.attr("x2",70).attr("y2",15)
					.attr("opacity",1);

			event_axis.transition()
					.attr("opacity",0);

			gact.transition()
				.attr("x", function (d) {return order_scale(d.start_num)})
				.attr("y", 20)
				.attr("width", function (d) {return order_scale(d.end_num-d.start_num+0.3)})
				.attr("height", 80);
		}

		event_chart_change();
	}

	//attach function to the button
	document.getElementById("toggle").onclick = function(){
		if (toggle==1) {toggle=2; form2();}
		else {toggle=1; form1();}
	}

	initialize();
}