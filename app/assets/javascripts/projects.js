

function projectsShow (data) {

	var svg_margin_rl=10;
	var svg_full_width=1170-svg_margin_rl*2, svg_half_width=1170/2-svg_margin_rl*2;
	var test_fail_svg;

	function initialize() {

		var initialize_svg = function () {

			test_fail_svg = d3.select("#test_fail_svg")
								.append("svg")
								.attr("width",svg_half_width)
								.attr("height",150);

		}

		var temp = function () {
			var data = [1,2,3,4];
			test_fail_svg.selectAll("g circle")
						.data(data)
						.enter()
						.append("circle")
						.attr("r",50)
						.attr("cx",function (d, i) {return i*140+70;})
						.attr("cy",70)
						.attr("stroke","black")
						.attr("fill","black");
		}

		initialize_svg();
		temp();
	}

	initialize();

}