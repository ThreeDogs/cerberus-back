function drawPies() {

	var fail_data = {
			"A":[20,80],
			"B":[20,80],
			"C":[20,80],
			"D":[20,80]
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
		.text(function (d, i) {if (i==1) return "80"; else return "20";});

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
		.text(function (d, i) {if (i==1) return "80"; else return "20";});

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
		.text(function (d, i) {if (i==1) return "80"; else return "20";});

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
		.text(function (d, i) {if (i==1) return "80"; else return "20";});

	}