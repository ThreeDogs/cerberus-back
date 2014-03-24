
function projectsShow (data) {

	var test_fail_svg, arc, innerarc, pie, pieA, pieB, pieC, pieD;

	var svg_margin_rl=10;
	var svg_full_width=970-svg_margin_rl*2;
	var svg_half_width=970/2-svg_margin_rl*2;

	var inner_radius=25;
	var outer_radius=50;

	/** TEMPORARY DATA **/
	var fail_data = {
			"A":[20,80],
			"B":[20,80],
			"C":[20,80],
			"D":[20,80]
			};
	
	function initialize() {

		test_fail_svg = d3.select("#test_fail_box")
							.append("svg")
							.attr("width",svg_half_width)
							.attr("height",150);

		arc = d3.svg.arc()
				.outerRadius(outer_radius)
				.innerRadius(inner_radius);

		innerarc = d3.svg.arc()
					.outerRadius(inner_radius+10)
					.innerRadius(inner_radius);

		pie = d3.layout.pie()
					.sort(null)
					.value(function (d) {return d});

		pieA = test_fail_svg.selectAll(".arc A")
					.data(pie(fail_data.A))
					.enter()
					.append("g")
					.attr("transform", "translate(50,60)")
					.attr("class","arc");
		pieA.append("path")
			.attr("d",arc)
			.style("fill",function (d, i) {if (i==1) return "black"; else return "grey";});
		pieA.append("path")
			.attr("d",innerarc)
			.style("fill",function (d, i) {if (i==1) return "darkgrey"; else return "lightgrey";});


		pieB = test_fail_svg.selectAll(".arc B")
					.data(pie(fail_data.B))
					.enter()
					.append("g")
					.attr("transform", "translate(160,60)")
					.attr("class","arc");
		pieB.append("path")
			.attr("d",arc)
			.style("fill",function (d, i) {if (i==1) return "black"; else return "grey";});
		pieB.append("path")
			.attr("d",innerarc)
			.style("fill",function (d, i) {if (i==1) return "darkgrey"; else return "lightgrey";});


		pieC = test_fail_svg.selectAll(".arc C")
					.data(pie(fail_data.C))
					.enter()
					.append("g")
					.attr("transform", "translate(270,60)")
					.attr("class","arc");
		pieC.append("path")
			.attr("d",arc)
			.style("fill",function (d, i) {if (i==1) return "black"; else return "grey";});
		pieC.append("path")
			.attr("d",innerarc)
			.style("fill",function (d, i) {if (i==1) return "darkgrey"; else return "lightgrey";});


		pieD = test_fail_svg.selectAll(".arc D")
					.data(pie(fail_data.D))
					.enter()
					.append("g")
					.attr("transform", "translate(380,60)")
					.attr("class","arc");
		pieD.append("path")
			.attr("d",arc)
			.style("fill",function (d, i) {if (i==1) return "black"; else return "grey";});
		pieD.append("path")
			.attr("d",innerarc)
			.style("fill",function (d, i) {if (i==1) return "darkgrey"; else return "lightgrey";});

	}

	initialize();

}

function drawTestResults() {

	var test_results_data = [
		{
			"pass":5,
			"warning":4,
			"failure":3
		},
		{
			"pass":5,
			"warning":4,
			"failure":3
		},
		{
			"pass":5,
			"warning":4,
			"failure":3
		},
		{
			"pass":6,
			"warning":4,
			"failure":2
		},
		{
			"pass":6,
			"warning":4,
			"failure":2
		},
		{
			"pass":6,
			"warning":4,
			"failure":2
		},
		{
			"pass":7,
			"warning":3,
			"failure":2
		},
		{
			"pass":7,
			"warning":3,
			"failure":2
		},
		{
			"pass":7,
			"warning":3,
			"failure":2
		},
		{
			"pass":8,
			"warning":2,
			"failure":2
		}
	]

	var svg_margin_rl=10;
	var svg_full_width=920-svg_margin_rl*2;
	var svg_half_width=920/2-svg_margin_rl*2;

	var test_results_svg, g_run, x_axis;

	var initialize = function () {

		test_results_svg = d3.select("#test_results")
								.append("svg")
								.attr("width",svg_full_width)
								.attr("height",150);

		var run_scale = d3.scale.linear().domain([1,10]).range([20,svg_full_width-20]);
		var y_scale = d3.scale.linear().domain([0,12]).range([130,20]);

		var line = d3.svg.line()
						.x(function (d, i) {return run_scale(i+1)})
						.y(function (d, i) {return y_scale(d.failure)});
		test_results_svg.append("path")
						.attr("d",line(test_results_data))
						.attr("class","failure_path")
						.attr("stroke","red")
						.attr("fill","none");
		line = d3.svg.line()
						.x(function (d, i) {return run_scale(i+1)})
						.y(function (d, i) {return y_scale(d.failure+d.warning)});
		test_results_svg.append("path")
						.attr("d",line(test_results_data))
						.attr("class","warning_path")
						.attr("stroke","yellow")
						.attr("fill","none");
		line = d3.svg.line()
						.x(function (d, i) {return run_scale(i+1)})
						.y(function (d, i) {return y_scale(d.failure+d.warning+d.pass)});
		test_results_svg.append("path")
						.attr("d",line(test_results_data))
						.attr("class","pass_path")
						.attr("stroke","green")
						.attr("fill","none");


		g_run = test_results_svg.selectAll("g_run")
						.data(test_results_data)
						.enter()
						.append("g");

		g_run.append("circle")
				.attr("class","circle_failure")
				.attr("r",2)
				.attr("cx", function (d, i) {return run_scale(i+1)})
				.attr("cy", function (d, i) {return y_scale(d.failure)})
				.attr("stroke","black")
				.attr("fill","black");

		g_run.append("circle")
				.attr("class","circle_warning")
				.attr("r",2)
				.attr("cx", function (d, i) {return run_scale(i+1)})
				.attr("cy", function (d, i) {return y_scale(d.failure+d.warning)})
				.attr("stroke","black")
				.attr("fill","black");

		g_run.append("circle")
				.attr("class","circle_pass")
				.attr("r",2)
				.attr("cx", function (d, i) {return run_scale(i+1)})
				.attr("cy", function (d, i) {return y_scale(d.failure+d.warning+d.pass)})
				.attr("stroke","black")
				.attr("fill","black");

		x_axis = test_results_svg.append("g")
					.attr("class", "x axis")
					.attr("transform", "translate(0,130)")
					.call(d3.svg.axis().scale(run_scale));

	}

	initialize();
}

function drawCPUusage() {

	var cpu_trend_data = [
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 50,"avg": 70,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10}
	]
	var svg_margin_rl=10;
	var svg_half_width=970/2-svg_margin_rl*2;

	var cpu_trend_svg = d3.select("#cpu_trend")
								.append("svg")
								.attr("width",svg_half_width)
								.attr("height",200);

	var initialize = function () {
		var run_scale = d3.scale.linear().domain([1,10]).range([20,svg_half_width-20]);
		var y_scale = d3.scale.linear().domain([0,100]).range([130,20]);

		var line = d3.svg.line()
						.x(function (d, i) {return run_scale(i+1)})
						.y(function (d, i) {return y_scale(d.max)});
		cpu_trend_svg.append("path")
						.attr("d",line(cpu_trend_data))
						.attr("class","max_path")
						.attr("stroke","red")
						.attr("fill","none");
		line = d3.svg.line()
						.x(function (d, i) {return run_scale(i+1)})
						.y(function (d, i) {return y_scale(d.avg)});
		cpu_trend_svg.append("path")
						.attr("d",line(cpu_trend_data))
						.attr("class","avg_path")
						.attr("stroke","green")
						.attr("fill","none");
		line = d3.svg.line()
						.x(function (d, i) {return run_scale(i+1)})
						.y(function (d, i) {return y_scale(d.min)});
		cpu_trend_svg.append("path")
						.attr("d",line(cpu_trend_data))
						.attr("class","min_path")
						.attr("stroke","skyblue")
						.attr("fill","none");


		var g_run = cpu_trend_svg.selectAll("g_run")
						.data(cpu_trend_data)
						.enter()
						.append("g");

		g_run.append("circle")
				.attr("class","circle_max")
				.attr("r",2)
				.attr("cx", function (d, i) {return run_scale(i+1)})
				.attr("cy", function (d, i) {return y_scale(d.max)})
				.attr("stroke","black")
				.attr("fill","black");

		g_run.append("circle")
				.attr("class","circle_avg")
				.attr("r",2)
				.attr("cx", function (d, i) {return run_scale(i+1)})
				.attr("cy", function (d, i) {return y_scale(d.avg)})
				.attr("stroke","black")
				.attr("fill","black");

		g_run.append("circle")
				.attr("class","circle_min")
				.attr("r",2)
				.attr("cx", function (d, i) {return run_scale(i+1)})
				.attr("cy", function (d, i) {return y_scale(d.min)})
				.attr("stroke","black")
				.attr("fill","black");

		x_axis = cpu_trend_svg.append("g")
					.attr("class", "x axis")
					.attr("transform", "translate(0,130)")
					.call(d3.svg.axis().scale(run_scale));
	}

	initialize();
}

function drawMemUsage() {

	var mem_trend_data = [
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10},
		{"max": 90,"avg": 30,"min": 10}
	]
	var svg_margin_rl=10;
	var svg_half_width=970/2-svg_margin_rl*2;

	var mem_trend_svg = d3.select("#mem_trend")
								.append("svg")
								.attr("width",svg_half_width)
								.attr("height",200);

	var initialize = function () {
		var run_scale = d3.scale.linear().domain([1,10]).range([20,svg_half_width-20]);
		var y_scale = d3.scale.linear().domain([0,100]).range([130,20]);

		var line = d3.svg.line()
						.x(function (d, i) {return run_scale(i+1)})
						.y(function (d, i) {return y_scale(d.max)});
		mem_trend_svg.append("path")
						.attr("d",line(mem_trend_data))
						.attr("class","max_path")
						.attr("stroke","red")
						.attr("fill","none");
		line = d3.svg.line()
						.x(function (d, i) {return run_scale(i+1)})
						.y(function (d, i) {return y_scale(d.avg)});
		mem_trend_svg.append("path")
						.attr("d",line(mem_trend_data))
						.attr("class","avg_path")
						.attr("stroke","green")
						.attr("fill","none");
		line = d3.svg.line()
						.x(function (d, i) {return run_scale(i+1)})
						.y(function (d, i) {return y_scale(d.min)});
		mem_trend_svg.append("path")
						.attr("d",line(mem_trend_data))
						.attr("class","min_path")
						.attr("stroke","skyblue")
						.attr("fill","none");


		var g_run = mem_trend_svg.selectAll("g_run")
						.data(mem_trend_data)
						.enter()
						.append("g");

		g_run.append("circle")
				.attr("class","circle_max")
				.attr("r",4)
				.attr("cx", function (d, i) {return run_scale(i+1)})
				.attr("cy", function (d, i) {return y_scale(d.max)})
				.attr("stroke","red")
				.attr("fill","white");

		g_run.append("circle")
				.attr("class","circle_avg")
				.attr("r",4)
				.attr("cx", function (d, i) {return run_scale(i+1)})
				.attr("cy", function (d, i) {return y_scale(d.avg)})
				.attr("stroke","green")
				.attr("fill","white");

		g_run.append("circle")
				.attr("class","circle_min")
				.attr("r",4)
				.attr("cx", function (d, i) {return run_scale(i+1)})
				.attr("cy", function (d, i) {return y_scale(d.min)})
				.attr("stroke","skyblue")
				.attr("fill","white");

		x_axis = mem_trend_svg.append("g")
					.attr("class", "x axis")
					.attr("transform", "translate(0,130)")
					.call(d3.svg.axis().scale(run_scale));
	}

	initialize();
}