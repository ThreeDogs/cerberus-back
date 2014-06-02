// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require jquery_nested_form
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require d3.v3
//= require apks
//= require detail_reports
//= require main
//= require motion_events
//= require projects
//= require spin.min
//= require test_scenarios
//= require total_reports
//= require total_reports_progress
//= require_self


var w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName('body')[0],
    window_x = w.innerWidth || e.clientWidth || g.clientWidth,
    window_y = w.innerHeight|| e.clientHeight|| g.clientHeight;

function updateWindow(){
    window_x = w.innerWidth || e.clientWidth || g.clientWidth;
    window_y = w.innerHeight|| e.clientHeight|| g.clientHeight;
}

window.onresize = updateWindow;

//a helper function to move SVG element to front (as html element would using z-index)
d3.selection.prototype.moveToFront = function() {
	return this.each(function(){this.parentNode.appendChild(this);});
};

$(function () {
	$(".sidebar").css("height",$(".container-fluid").css("height"));
})


function generateFilter(div_id, fields, callback) {
	fields = ["rank","status","os_version","device","name"];
	filter_address = "127.0.0.1:3000/api/v1/total_reports/1/filter";
	var div = d3.select("#"+div_id);
	d3.json(filter_address, function (data) {
		var field, field_key, field_value;
		if (fields.indexOf("rank")>-1) {
			field = div.append("div").attr("class","filter-field");
			field_key = field.append("div").attr("class","filter-key").text()
			field_value = field.append("div").attr("class","filter-value");
			for (i in data.rank) {
				field_value.append("div").attr("class","filter-value-each")
					.text(i+"("+data.rank[i]+")");
			}
		}
	})
}