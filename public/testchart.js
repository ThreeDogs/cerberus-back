var resizeFunctions = [];
d3.select(window).on("resize",function () {
	for (var i in resizeFunctions){
		resizeFunctions[i]();
	}
});

function drawDetailReports (data) {

	function drawBatteryChart (data) {

		var width = d3.select('#battery-chart').style('width').split("px")[0];
		var height = d3.select('#battery-chart').style('height').split("px")[0];
		var margin = {top:10, right: 10, bottom: 30, left: 60};
		var svg = d3.select('#battery-chart').append('svg')
					.attr('width',width).attr('height',height);

		for (index in data) {
			var one = data[index];
			one.cpu = parseInt(one.cpu);
			one.gps = parseInt(one.gps);
			one.wifi = parseInt(one.wifi);
			one.threeg = parseInt(one.threeg);
			one.sound = parseInt(one.sound);
			one.lcd = parseInt(one.lcd);
			one.sum = one.cpu + one.gps + one.wifi + one.threeg + one.sound;
		}

		var x_extent = d3.extent(data, function (d) { return d.client_timestamp });
		var y_extent = [0, 100];

		var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
		var y_scale = d3.scale.linear().domain(y_extent).range([height-margin.bottom,margin.top]);

		var x_axis = d3.svg.axis().scale(x_scale).orient('bottom').innerTickSize(3).outerTickSize([0]);
		var y_axis = d3.svg.axis().scale(y_scale).orient('left').innerTickSize(3).outerTickSize([0]);
	
		var battery_x_axis = svg.append("g").attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(x_axis);

		var battery_y_axis = svg.append("g").attr("class", "y axis")
				.attr("transform", "translate("+margin.left+",0)")
				.call(y_axis);

		var fields = ["cpu","gps","wifi","threeg","sound"];

		var cpu_field = new Field("cpu");
		var gps_field = new Field("gps");
		var wifi_field = new Field("wifi");
		var threeg_field = new Field("threeg");
		var sound_field = new Field("sound");


		function Field (field_name) {
			var area = d3.svg.area()
						.x(function (d) {return x_scale(d.client_timestamp)})
						.y0(function (d) {
							var sum = 0;
							for(var i=0; i<fields.indexOf(field_name); i++) {
								sum += d[fields[i]];
							}
							return y_scale((sum/d.sum) * 100);
						})
						.y1(function (d) {
							var sum = 0;
							for(var i=0; i<=fields.indexOf(field_name); i++) {
								sum += d[fields[i]];
							}
							return y_scale((sum/d.sum) * 100);
						})
			var path = svg.append("path").attr("class","battery-"+field_name)
						.attr("d",area(data));

			var resize = function () {
				path.attr("d",area(data));
			}

			return {area:area, path:path, resize:resize};
		}

		function onResize () {
			width = d3.select('#battery-chart').style('width').split("px")[0];
			svg.attr("width",width);
			x_scale.range([margin.left,width-margin.right]);
			x_axis.scale(x_scale);
			battery_x_axis.call(x_axis);
			cpu_field.resize();
			gps_field.resize();
			wifi_field.resize();
			threeg_field.resize();
			sound_field.resize();
		}
		resizeFunctions.push(onResize);
	}

	function drawDrawTimeChart (data) {

		var width = d3.select('#draw-time-chart').style('width').split("px")[0];
		var height = d3.select('#draw-time-chart').style('height').split("px")[0];
		var margin = {top:10, right: 10, bottom: 30, left: 60};
		var svg = d3.select('#draw-time-chart').append('svg')
					.attr('width',width).attr('height',height);

		var zero = data[0].load_start_timestamp;
		for (index in data) {
			var one = data[index];
			one.client_timestamp = (one.load_start_timestamp - zero) /1000;
			one.delta = one.load_finish_timestamp - one.load_start_timestamp;
		}

		var x_extent = d3.extent(data, function (d) { return d.client_timestamp });
		var y_extent = [0,d3.max(data, function (d) { return d.delta * 1.1})];

		var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
		var y_scale = d3.scale.linear().domain(y_extent).range([height-margin.bottom,margin.top]);

		var x_axis = d3.svg.axis().scale(x_scale).orient('bottom').innerTickSize(3).outerTickSize([0]);
		var y_axis = d3.svg.axis().scale(y_scale).orient('left').innerTickSize(3).outerTickSize([0]);

		var draw_time_x_axis = svg.append("g").attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(x_axis);

		var draw_time_y_axis = svg.append("g").attr("class", "y axis")
				.attr("transform", "translate("+margin.left+",0)")
				.call(y_axis);

		var lines = svg.append("g").attr("class","draw-time-lines");
		lines.selectAll("lines").data(data).enter().append("line")
				.attr("class",function (d) {return d.view_type+"-line"})
				.attr("y1",function (d) {return y_scale(0)})
				.attr("y2",function (d) {return y_scale(d.delta)})	
				.attr("x1",function (d) {return x_scale(d.client_timestamp)})
				.attr("x2",function (d) {return x_scale(d.client_timestamp)})

		function onResize () {

		}
		resizeFunctions.push(onResize);
	}

	function dataProcess(data) {

		for (var i=0; i<data.length; i++) {
			for (key in data[i]) {
				if (data[i][key] == null) {
					data.splice(i,i);
				}
			}
		};

		data.sort(function (a, b) {
			if (a.client_timestamp < b.client_timestamp){
				return -1;
			} else if (a.client_timestamp > b.client_timestamp){
				return 1;
			} else {
				return 0;
			}
		});

		// Process the client java timestamp (ms)
		// into relative time in second with first element at 0s
		var zero = data[0].client_timestamp;
		data.forEach(function (element, index) {
			element.client_timestamp = (element.client_timestamp - zero) / 1000;
		});

		return data;
	}

	drawBatteryChart(dataProcess(data.battery_infos_attributes));
	drawDrawTimeChart(data.frame_draw_times_attributes);
}

function methodProfiling (data) {

	data.sort(function (a, b) {
		if (a.tree_key < b.tree_key){
			return -1;
		} else if (a.tree_key > b.tree_key){
			return 1;
		} else {
			return 0;
		}
	});

	for (index in data) {
		data[index].children = [];
		data[index].children_time = 0;
		data[index].delta = data[index].end_timestamp - data[index].start_timestamp;
	}

	var parent_key;
	for (index in data) {
		parent_key = data[index].parent_key;
		if (parent_key !=0) {
			data[parent_key-1].children.push(data[index]);
			data[parent_key-1].children_time += data[index].delta;
		}
	}

	data = data.filter(function (d) {
		if (d.parent_key == 0) {return true}
		else {return false}
	})

	var root = d3.select("#method-profile-div").append("ul").attr("class","method-list");
	var root_selection = root.selectAll("li").data(data).enter();

	appendLi(root_selection);
		
	function appendLi (selection) {
		var row = selection.append("li").attr("class","method-list-row")
		row.append("span").attr("class","activity-method").text(function (d) {return d.tree_key + " " + d.class_name + " " +d.method_name});
		row.append("span").attr("class","incl").text(function (d) {return d.delta});
		row.append("span").attr("class","excl").text(function (d) {return d.delta-d.children_time});
		var sub_selection = row.append("ul").selectAll("li").data(function (d) {return d.children}).enter();

		row.on("click",function (d) {
			event.stopPropagation();
			$("ul", this).toggle();
		})

		if (!sub_selection.empty()) { appendLi(sub_selection) }
	}
}