function drawPies() {

	var fail_data = {
			"A":[7,17],
			"B":[34,23],
			"C":[5,10],
			"D":[2,19]
			};

	var test_fail_svg = d3.select("#test_fail_box_1")
						.append("svg")
						.attr("width",540)
						.attr("height",120);

	var arc = d3.svg.arc()
			.outerRadius(45)
			.innerRadius(22);

	var innerarc = d3.svg.arc()
				.outerRadius(29)
				.innerRadius(22);

	var pie = d3.layout.pie()
				.sort(null)
				.value(function (d) {return d});

	var pieA = test_fail_svg.selectAll(".arc A")
				.data(pie(fail_data.A))
				.enter()
				.append("g")
				.attr("transform", "translate(50,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var pieB = test_fail_svg.selectAll(".arc B")
				.data(pie(fail_data.B))
				.enter()
				.append("g")
				.attr("transform", "translate(160,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var pieC = test_fail_svg.selectAll(".arc C")
				.data(pie(fail_data.C))
				.enter()
				.append("g")
				.attr("transform", "translate(270,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var pieD = test_fail_svg.selectAll(".arc D")
				.data(pie(fail_data.D))
				.enter()
				.append("g")
				.attr("transform", "translate(380,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var rank_text = test_fail_svg.append("g").attr("class","rank_label");
	rank_text.append("text").attr("transform","translate(50,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("A");
	rank_text.append("text").attr("transform","translate(160,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("B");
	rank_text.append("text").attr("transform","translate(270,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("C");
	rank_text.append("text").attr("transform","translate(380,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("D");

}

function drawPiesTemp() {

	var fail_data = {
			"A":[6,18],
			"B":[19,13],
			"C":[4,9],
			"D":[6,11]
			};

	var test_fail_svg = d3.select("#test_fail_box_2")
						.append("svg")
						.attr("width",540)
						.attr("height",120);

	var arc = d3.svg.arc()
			.outerRadius(45)
			.innerRadius(22);

	var innerarc = d3.svg.arc()
				.outerRadius(29)
				.innerRadius(22);

	var pie = d3.layout.pie()
				.sort(null)
				.value(function (d) {return d});

	var pieA = test_fail_svg.selectAll(".arc A")
				.data(pie(fail_data.A))
				.enter()
				.append("g")
				.attr("transform", "translate(50,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var pieB = test_fail_svg.selectAll(".arc B")
				.data(pie(fail_data.B))
				.enter()
				.append("g")
				.attr("transform", "translate(160,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var pieC = test_fail_svg.selectAll(".arc C")
				.data(pie(fail_data.C))
				.enter()
				.append("g")
				.attr("transform", "translate(270,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var pieD = test_fail_svg.selectAll(".arc D")
				.data(pie(fail_data.D))
				.enter()
				.append("g")
				.attr("transform", "translate(380,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var rank_text = test_fail_svg.append("g").attr("class","rank_label");
	rank_text.append("text").attr("transform","translate(50,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("A");
	rank_text.append("text").attr("transform","translate(160,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("B");
	rank_text.append("text").attr("transform","translate(270,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("C");
	rank_text.append("text").attr("transform","translate(380,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("D");

}

function drawPiesTemp2() {

	var fail_data = {
			"A":[6,18],
			"B":[15,17],
			"C":[4,9],
			"D":[6,11]
			};

	var test_fail_svg = d3.select("#test_fail_box_3")
						.append("svg")
						.attr("width",540)
						.attr("height",120);

	var arc = d3.svg.arc()
			.outerRadius(45)
			.innerRadius(22);

	var innerarc = d3.svg.arc()
				.outerRadius(29)
				.innerRadius(22);

	var pie = d3.layout.pie()
				.sort(null)
				.value(function (d) {return d});

	var pieA = test_fail_svg.selectAll(".arc A")
				.data(pie(fail_data.A))
				.enter()
				.append("g")
				.attr("transform", "translate(50,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var pieB = test_fail_svg.selectAll(".arc B")
				.data(pie(fail_data.B))
				.enter()
				.append("g")
				.attr("transform", "translate(160,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var pieC = test_fail_svg.selectAll(".arc C")
				.data(pie(fail_data.C))
				.enter()
				.append("g")
				.attr("transform", "translate(270,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var pieD = test_fail_svg.selectAll(".arc D")
				.data(pie(fail_data.D))
				.enter()
				.append("g")
				.attr("transform", "translate(380,60)")
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
		.attr("fill","white")
		.style("text-anchor", "middle")
		.text(function (d, i) {return d.value;});

	var rank_text = test_fail_svg.append("g").attr("class","rank_label");
	rank_text.append("text").attr("transform","translate(50,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("A");
	rank_text.append("text").attr("transform","translate(160,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("B");
	rank_text.append("text").attr("transform","translate(270,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("C");
	rank_text.append("text").attr("transform","translate(380,60)").attr("dy","0.3em").attr("font-size","16px").style("text-anchor", "middle").text("D");

}

function drawTestFailPies() {

	var fail_data = {
			"A":[7,17],
			"B":[34,23],
			"C":[5,10],
			"D":[2,19]
			};

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

function drawDeviceFailure () {

	var data = [
		{
			"device_name":"Galaxy S2",
			"os_version":"2.3",
			"fail_data": {
				"A": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"B": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"C": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"D": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}]
			}
		},
		{
			"device_name":"LG Optimus",
			"os_version":"2.2",
			"fail_data":{
				"A": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"B": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"C": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"D": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}]
			}
		},
		{
			"device_name":"Nexus S",
			"os_version":"2.3",
			"fail_data":{
				"A": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"B": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"C": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"D": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}]
			}
		},
		{
			"device_name":"Nexus 7",
			"os_version":"4.4",
			"fail_data":{
				"A": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"B": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"C": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"D": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}]
			}
		},
		{
			"device_name":"Galaxy S4",
			"os_version":"4.3",
			"fail_data":{
				"A": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"B": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"C": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}],
				"D": [{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"},
					{"scenario_name":"login test","error_message":"out of memory error","link":"#"}]
			}
		}
	]

	var device_fail_svg = d3.select("#device_failure").append("svg")
								.attr("width",1150).attr("height",400);

	var x_domain = [];
	for (var each in data) {
		x_domain.push(data[each].device_name);
	}
	var y_domain = [0,data[0].fail_data.A.length+data[0].fail_data.B.length+data[0].fail_data.C.length+data[0].fail_data.D.length];

	var x_scale = d3.scale.ordinal().domain(x_domain).rangeRoundBands([100,1000],0.2,0.2);
	var y_scale = d3.scale.linear().domain(y_domain).range([350,50]);
	var height_scale = d3.scale.linear().domain(y_domain).range([0,300]);	

	var x_axis = device_fail_svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0,350)")
				.call(d3.svg.axis()
					.scale(x_scale)
					.innerTickSize(3)
					.outerTickSize(0));

	var y_axis = device_fail_svg.append("g")
				.attr("class", "y axis")
				.attr("transform","translate(100,0)")
				.call(d3.svg.axis()
					.scale(y_scale)
					.orient("left"));

	var columns = device_fail_svg.selectAll("g column")
		.data(data).enter().append("g")
			.attr("class","device_col")
			.attr("transform",function (d) {return "translate("+x_scale(d.device_name)+",0)"})

	columns.append("rect")
			.attr("width",50).attr("height",function (d) {return height_scale(d.fail_data.A.length)})
			.attr("x",10).attr("y",function (d) {return y_scale(0)-height_scale(d.fail_data.A.length)})
			.attr("fill","#EA7C4B");
	columns.append("rect")
			.attr("width",10).attr("height",function (d) {return height_scale(d.fail_data.A.length)})
			.attr("x",60).attr("y",function (d) {return y_scale(0)-height_scale(d.fail_data.A.length)})
			.attr("fill","#C1633E");

	columns.append("rect")
			.attr("width",50).attr("height",function (d) {return height_scale(d.fail_data.B.length)})
			.attr("x",10).attr("y",function (d) {return y_scale(0+d.fail_data.A.length)-height_scale(d.fail_data.B.length)})
			.attr("fill","#ED9FBD");
	columns.append("rect")
			.attr("width",10).attr("height",function (d) {return height_scale(d.fail_data.B.length)})
			.attr("x",60).attr("y",function (d) {return y_scale(0+d.fail_data.A.length)-height_scale(d.fail_data.B.length)})
			.attr("fill","#BF7593");

	columns.append("rect")
			.attr("width",50).attr("height",function (d) {return height_scale(d.fail_data.C.length)})
			.attr("x",10).attr("y",function (d) {return y_scale(0+d.fail_data.A.length+d.fail_data.B.length)-height_scale(d.fail_data.C.length)})
			.attr("fill","#52C4D0");
	columns.append("rect")
			.attr("width",10).attr("height",function (d) {return height_scale(d.fail_data.C.length)})
			.attr("x",60).attr("y",function (d) {return y_scale(0+d.fail_data.A.length+d.fail_data.B.length)-height_scale(d.fail_data.C.length)})
			.attr("fill","#34989A");

	columns.append("rect")
			.attr("width",50).attr("height",function (d) {return height_scale(d.fail_data.D.length)})
			.attr("x",10).attr("y",function (d) {return y_scale(0+d.fail_data.A.length+d.fail_data.B.length+d.fail_data.C.length)-height_scale(d.fail_data.D.length)})
			.attr("fill","#D6B6EF");
	columns.append("rect")
			.attr("width",10).attr("height",function (d) {return height_scale(d.fail_data.D.length)})
			.attr("x",60).attr("y",function (d) {return y_scale(0+d.fail_data.A.length+d.fail_data.B.length+d.fail_data.C.length)-height_scale(d.fail_data.D.length)})
			.attr("fill","#A28BBC");

}
