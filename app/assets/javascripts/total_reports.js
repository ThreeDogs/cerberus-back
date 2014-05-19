function drawTestFailPies(fail_data) {

	var test_fail_svg = d3.select("#test_failure")
						.append("svg")
						.attr("width",1150)
						.attr("height",250);

	var arc = d3.svg.arc()
			.outerRadius(90)
			.innerRadius(43);

	var innerarc = d3.svg.arc()
				.outerRadius(53)
				.innerRadius(43);

	var pie = d3.layout.pie()
				.sort(null)
				.value(function (d) {return d});

	var pieA = test_fail_svg.selectAll(".arc A")
				.data(pie(fail_data.A))
				.enter()
				.append("g")
				.attr("transform", "translate(150,115)")
				.attr("class","arc");
	pieA.append("path")
		.attr("d",arc)
		.style("fill",function (d, i) {if (i==1) return "#C1633E"; else return "#EA7C4B";});
	pieA.append("path")
		.attr("d",innerarc)
		.style("fill",function (d, i) {if (i==1) return "#A35338"; else return "#CE6C46";});
	pieA.append("text")
		.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
		.attr("dy","0.3em")
		.attr("fill","white").attr("font-size","25px")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value});

	var pieB = test_fail_svg.selectAll(".arc B")
				.data(pie(fail_data.B))
				.enter()
				.append("g")
				.attr("transform", "translate(420,115)")
				.attr("class","arc");
	pieB.append("path")
		.attr("d",arc)
		.style("fill",function (d, i) {if (i==1) return "#BF7593"; else return "#ED9FBD";});
	pieB.append("path")
		.attr("d",innerarc)
		.style("fill",function (d, i) {if (i==1) return "#8E516D"; else return "#CE91AA";});
	pieB.append("text")
		.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
		.attr("dy","0.3em")
		.attr("fill","white").attr("font-size","25px")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value});

	var pieC = test_fail_svg.selectAll(".arc C")
				.data(pie(fail_data.C))
				.enter()
				.append("g")
				.attr("transform", "translate(690,115)")
				.attr("class","arc");
	pieC.append("path")
		.attr("d",arc)
		.style("fill",function (d, i) {if (i==1) return "#34989A"; else return "#52C4D0";});
	pieC.append("path")
		.attr("d",innerarc)
		.style("fill",function (d, i) {if (i==1) return "#2D7C7C"; else return "#3AA4A7";});
	pieC.append("text")
		.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
		.attr("dy","0.3em")
		.attr("fill","white").attr("font-size","25px")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value});

	var pieD = test_fail_svg.selectAll(".arc D")
				.data(pie(fail_data.D))
				.enter()
				.append("g")
				.attr("transform", "translate(960,115)")
				.attr("class","arc");
	pieD.append("path")
		.attr("d",arc)
		.style("fill",function (d, i) {if (i==1) return "#A28BBC"; else return "#D6B6EF";});
	pieD.append("path")
		.attr("d",innerarc)
		.style("fill",function (d, i) {if (i==1) return "#826CA3"; else return "#BBA3D1";});
	pieD.append("text")
		.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
		.attr("dy","0.3em")
		.attr("fill","white").attr("font-size","25px")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value});

	var rank_text = test_fail_svg.append("g").attr("class","rank_label");
	rank_text.append("text").attr("transform","translate(150,115)").attr("dy","0.3em").attr("font-size","30px").style("text-anchor", "middle").text("A");
	rank_text.append("text").attr("transform","translate(420,115)").attr("dy","0.3em").attr("font-size","30px").style("text-anchor", "middle").text("B");
	rank_text.append("text").attr("transform","translate(690,115)").attr("dy","0.3em").attr("font-size","30px").style("text-anchor", "middle").text("C");
	rank_text.append("text").attr("transform","translate(960,115)").attr("dy","0.3em").attr("font-size","30px").style("text-anchor", "middle").text("D");

}

function drawDeviceFail (data) {

	var fail_by_device_svg = d3.select("#test_fail_bar_graph").append("svg")
								.attr("width",700).attr("height",350);

	var y_domain = [];
	for (var each in data) {
		y_domain.push(data[each].device_name);
	}

	var x_extent = [0,data[0].fail_data.A.length+data[0].fail_data.B.length+data[0].fail_data.C.length+data[0].fail_data.D.length];

	var x_scale = d3.scale.linear().domain(x_extent).range([120,600]);
	var y_scale = d3.scale.ordinal().domain(y_domain).rangeRoundBands([300,30],0.3,0.3);

	var x_axis = fail_by_device_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,300)")
				.call(d3.svg.axis()
					.scale(x_scale)
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = fail_by_device_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate(120,0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.orient("left"));

	var columns = fail_by_device_svg.selectAll("g column")
		.data(data).enter().append("g")
			.attr("class","device_row")
			.attr("transform",function (d) {return "translate(120,"+y_scale(d.device_name)+")"});
	
	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.A.length)-x_scale(0);}).attr("height",40)
			.attr("x",function (d) {return x_scale(0)-x_scale(0);}).attr("y",0)
			.attr("fill","#EA7C4B")
			.on("click",function (d) {renewDetailTable("A", d.device_name, d.fail_data.A)});

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.B.length)-x_scale(0);}).attr("height",40)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length)-x_scale(0);}).attr("y",0)
			.attr("fill","#ED9FBD")
			.on("click",function (d) {renewDetailTable("B", d.device_name, d.fail_data.B)});

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.C.length)-x_scale(0);}).attr("height",40)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length+d.fail_data.B.length)-x_scale(0);}).attr("y",0)
			.attr("fill","#52C4D0")
			.on("click",function (d) {renewDetailTable("C", d.device_name, d.fail_data.C)});

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.D.length)-x_scale(0);}).attr("height",40)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length+d.fail_data.B.length+d.fail_data.C.length)-x_scale(0);}).attr("y",0)
			.attr("fill","#D6B6EF")
			.on("click",function (d) {renewDetailTable("D", d.device_name, d.fail_data.D)});


	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.A.length)-x_scale(0);}).attr("height",8)
			.attr("x",function (d) {return x_scale(0)-x_scale(0);}).attr("y",32)
			.attr("fill","#C1633E");

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.B.length)-x_scale(0);}).attr("height",8)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length)-x_scale(0);}).attr("y",32)
			.attr("fill","#BF7593");

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.C.length)-x_scale(0);}).attr("height",8)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length+d.fail_data.B.length)-x_scale(0);}).attr("y",32)
			.attr("fill","#34989A");

	columns.append("rect")
			.attr("width",function (d) {return x_scale(d.fail_data.D.length)-x_scale(0);}).attr("height",8)
			.attr("x",function (d) {return x_scale(d.fail_data.A.length+d.fail_data.B.length+d.fail_data.C.length)-x_scale(0);}).attr("y",32)
			.attr("fill","#A28BBC");

	function renewDetailTable (rank, device_name, error_array) {

		d3.select("#table_title_rank").text(rank);
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
