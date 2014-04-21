function drawEventFlow(data) {

	d3.selection.prototype.moveToFront = function() {
		return this.each(function(){this.parentNode.appendChild(this);});
	};

	var unit_length = 120;
	var margin = 10;
	var width = (data.motion_reports.length + 1) * unit_length + margin * 2;

	var event_flow_svg = d3.select("#scenario_event_chart")
							.append("svg")
							.attr("width",width)
							.attr("height",60);

	var x_domain = [0, data.motion_reports.length+1];
	var x_range = [margin, width - margin]
	var x_axis = d3.scale.linear().domain(x_domain).range(x_range);

	var event_flow_g = event_flow_svg.selectAll("g event_flow_rect")
							.data(data.motion_reports).enter().append("g");

	event_flow_g.attr("transform", function (d) { return "translate("+x_axis(d.id)+",10)"});

	var activities = [];

	event_flow_g.each(function (d,i) {
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

	var event_flow_act = event_flow_svg.selectAll("activity_box")
							.data(activities).enter()
							.append("rect").attr("class","activity_box")
							.attr("x",function (d) {return x_axis(d.start_num)-5})
							.attr("y",5)
							.attr("width",function (d) {return x_axis(d.end_num-d.start_num)+105})
							.attr("height",50)
							.attr("stroke","none")
							.attr("fill","#A9D8B9");

	var event_flow_rect = event_flow_g.append("rect").attr("class","event_flow_rect")
							.attr("width", unit_length-20).attr("height",40)
							.attr("stroke","none")
							.attr("fill","#DBEEE1");

	event_flow_rect.moveToFront();

	var event_flow_text = event_flow_g.append("text").attr("class","event_flow_text")
							.attr("dx",10)
							.attr("dy",25)
							.text(function (d) {return d.action_type});

	event_flow_svg.append("marker").attr("id","circle_head")
						.attr("viewBox","0 0 6 6")
						.attr("refX",3).attr("refY",3)
						.attr("markerWidth",6).attr("markerHeight",6)
						.append("circle").attr("r",1.5).attr("cx",3).attr("cy",3)
						.attr("fill","#5DBE88");

	var event_flow_arrow = event_flow_g.append("line").attr("class","event_flow_arrow")
							.attr("x1",unit_length-20).attr("y1",20)
							.attr("x2",unit_length).attr("y2",20)
							.style("stroke","#5DBE88")
							.attr("stroke-width",3)
							.attr("marker-start","url(#circle_head)")
							.attr("marker-end","url(#circle_head)");

}