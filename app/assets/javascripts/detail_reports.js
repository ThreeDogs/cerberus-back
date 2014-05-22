
function drawDetailReports (data) {

	function drawEventScreenshot (data) {

		var inner_div = d3.select("#event-screenshot-inner");
		

	}

	function drawCPUChart (data) {
		//client_timestamp, usage

		var width = d3.select('#cpu-chart').style('width').split("px")[0];
		var height = d3.select('#cpu-chart').style('height').split("px")[0];
		var margin = {top:10, right: 10, bottom: 30, left: 30};
		var svg = d3.select('#cpu-chart').append('svg')
					.attr('width',width).attr('height',height);

		var x_extent = d3.extent(data, function (d) { return d.client_timestamp });
		var y_extent = [0,100];

		var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
		var y_scale = d3.scale.linear().domain(y_extent).range([height-margin.bottom,margin.top]);

		var x_axis = d3.svg.axis().scale(x_scale).orient('bottom');
		var y_axis = d3.svg.axis().scale(y_scale).orient('left');
	
		var area = d3.svg.area()
						.x(function (d) {return x_scale(d.client_timestamp)})
						.y0(y_scale(0))
						.y1(function (d) {return y_scale(d.usage)});

		svg.append("path").attr("class","cpu-area").attr("d",area(data));

		svg.append("g").attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(x_axis);

		svg.append("g").attr("class", "y axis")
				.attr("transform", "translate("+margin.left+",0)")
				.call(y_axis);

	}

	function drawMemChart (data) {
		//client_timestamp, dalvik_heap_alloc/dalvik_heap_size
		var width = d3.select('#mem-chart').style('width').split("px")[0];
		var height = d3.select('#mem-chart').style('height').split("px")[0];
		var margin = {top:10, right: 10, bottom: 30, left: 30};
		var svg = d3.select('#mem-chart').append('svg')
					.attr('width',width).attr('height',height);

		var x_extent = d3.extent(data, function (d) { return d.client_timestamp });
		var y_extent = [0,100];

		var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
		var y_scale = d3.scale.linear().domain(y_extent).range([height-margin.bottom,margin.top]);

		var x_axis = d3.svg.axis().scale(x_scale).orient('bottom');
		var y_axis = d3.svg.axis().scale(y_scale).orient('left');
	
		var area = d3.svg.area()
						.x(function (d) {return x_scale(d.client_timestamp)})
						.y0(y_scale(0))
						.y1(function (d) {return y_scale((d.dalvik_heap_alloc/d.dalvik_heap_size)*100)});

		svg.append("path").attr("class","mem-area").attr("d",area(data));

		svg.append("g").attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(x_axis);

		svg.append("g").attr("class", "y axis")
				.attr("transform", "translate("+margin.left+",0)")
				.call(y_axis);

	}

	function dataProcess(data) {
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

	drawCPUChart(dataProcess(data.cpu_infos));
	drawMemChart(dataProcess(data.memory_infos));
}