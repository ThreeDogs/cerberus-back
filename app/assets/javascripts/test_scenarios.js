function drawEventFlow (data) {

	var inner_div = d3.select("#scenario-event-inner");
	var per_screenshot = {width: 130, height: 200, margin_rl: 10, margin_tb: 10};

	inner_div.style("width",(per_screenshot.width+20)*data.length+"px");

	//process data to group activities
	var activities = [];
	for (var i in data) {
		var flag = true;
		var currentActivity = activities[activities.length-1];
		if ( (currentActivity!=null) && (data[i].activity_class == currentActivity.name) ){
			flag = false;
			currentActivity.events.push(data[i]);
			currentActivity.end_time=data[i].client_timestamp;
		}
		if (flag) activities.push({
			"name":data[i].activity_class,
			"events": [data[i]],
			"start_time":data[i].client_timestamp,
			"end_time":data[i].client_timestamp,
		});
	}

	var activity_div = inner_div.selectAll(".activity").data(activities).enter().append("div").attr("class","activity")
		.attr("width",function (d) {return (per_screenshot.width + per_screenshot.margin_rl) * d.events.length})
		.attr("height",per_screenshot.height+per_screenshot.margin_tb);

	activity_div.append("div").attr("class","activity-name")
		.text(function (d) {
			var name_string = d.name.split('.');
			return name_string[name_string.length-1]
		}).attr("title",function (d) {return d.name});

	var each_div = activity_div.selectAll(".event-screenshot-each").data(function (d) {return d.events}).enter()
		.append("div").attr("class","event-screenshot-each");

	each_div.append("img").attr("src",function (d) {return d.src});
	each_div.append("div").attr("class","view-each").text(function (d) {
		return d.view})
	each_div.append("div").attr("class","event-each").text(function (d) {
		return d.action_type+"("+d.param+")"});
	each_div.append("div").attr("class","sleep-each").text(function (d) {
		return d.sleep+"ms"})

}