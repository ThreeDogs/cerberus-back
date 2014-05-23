
// function drawBandGraph (data) {

// 	var row = d3.select("#band-graph").data(data).enter()
// 				.append("div").attr("class","band-graph-row");
	
// 	row.append("span").attr("class","band-graph-rank").text(function (d) {return d})
// 	row.append("span").attr("class","band-graph-success")
// 		.append("class","band-graph-fail").attr("width",function (d) {
// 			return d[0]/(d[0]+d[1])*100+"%";
// 		})

// }

function drawDeviceFail (data) {

	var width = d3.select("#test_fail_bar_graph").style("width").split("px")[0];
	var height = d3.select("#test_fail_bar_graph").style("height").split("px")[0];
	var margin = {top: 10, right: 10, bottom: 30, left: 100};

	var svg = d3.select("#test_fail_bar_graph").append("svg")
				.attr("width",width).attr("height",height);

	var y_domain = [];
	for (var each in data) {
		y_domain.push(data[each].device_name);
	}

	var x_extent = [0,data[0].fail_data.A.length+data[0].fail_data.B.length+data[0].fail_data.C.length+data[0].fail_data.D.length];

	var x_scale = d3.scale.linear().domain(x_extent).range([margin.left,width-margin.right]);
	var y_scale = d3.scale.ordinal().domain(y_domain).rangeRoundBands([height-margin.bottom,margin.top],0.3,0.3);

	var x_axis = svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,"+(height-margin.bottom)+")")
				.call(d3.svg.axis()
					.scale(x_scale)
					.orient("bottom")
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate("+margin.left+",0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.orient("left")
					.innerTickSize(3)
					.outerTickSize(0));

	var columns = svg.selectAll("device-column")
				.data(data).enter().append("g")
				.attr("class","device_row")
				.attr("transform",function (d) {return "translate("+margin.left+","+y_scale(d.device_name)+")"});

	var rect_height = (height-margin.top-margin.bottom) / data.length * 0.4;

	columns.each(function (d, i){
		var sum = 0;
		var ranks = ["A","B","C","D"]
		for (var index in ranks) {
			var rank = ranks[index];
			if(d.fail_data[rank]) {
				d3.select(this).append("rect").attr("class",rank)
					.attr("width",x_scale(d.fail_data[rank].length)-x_scale(0))
					.attr("height",rect_height)
					.attr("x",x_scale(sum)-margin.left)
					.attr("y",0)
					.on("click",function (d) {
						rank = d3.select(this).attr("class");
						renewDetailTable(rank, d.device_name, d.fail_data[rank]);
					})
				sum = sum + d.fail_data[rank].length;
			}
		}
	})

	function onResize() {
		width = d3.select("#test_fail_bar_graph").style("width").split("px")[0];
		svg.attr("width".width);
		x_scale.range([margin.left,width-margin.right]);
		x_axis.call(d3.svg.axis().scale(x_scale).orient("bottom").innerTickSize(3).outerTickSize(0));
		columns.each(function (d, i){
			var sum = 0;
			var ranks = ["A","B","C","D"]
			for (var index in ranks) {
				var rank = ranks[index];
				if(d.fail_data[rank]) {
					d3.select(this).select("."+rank)
						.attr("width",x_scale(d.fail_data[rank].length)-x_scale(0))
						.attr("x",x_scale(sum)-margin.left)
					sum = sum + d.fail_data[rank].length;
				}
			}
		});
	}
	d3.select(window).on("resize",onResize);

	function renewDetailTable (rank, device_name, error_array) {

		d3.select("#table_title_rank").attr("class","test_rank "+rank).text(rank);
		d3.select("#table_title_device_name").text(device_name);

		//TODO: hyperlink to specific report page

		d3.select("#detail_table").remove();
		var detail_table = d3.select("#test_fail_chart").append("table").attr("id","detail_table");
		var table_label = detail_table.append("tr").attr("class","table_head");
		table_label.append("td").attr("class","name").text("Name");
		table_label.append("td").attr("class","error").text("Error");

		for (var row in error_array) {
			var row_tr = detail_table.append("tr");
			row_tr.append("td").text(error_array[row].scenario_name);
			row_tr.append("td").text(error_array[row].error_message);
		}
	}
}
