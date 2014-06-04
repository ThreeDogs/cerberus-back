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
//= require socket.io
//= require connection
//= require bootstrap.min
//= require jquery_nested_form
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require d3.v3
//= require spin.min
//
//= require apks
//= require detail_reports
//= require main
//= require motion_events
//= require projects
//= require test_scenarios
//= require total_reports
//= require total_reports_progress
//= require crashes
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
	filter_address = "http://127.0.0.1:3000/api/v1/total_reports/1/filter";
	var div = d3.select("#"+div_id).append("form");

	var data = {
	    "name": [
	        "TestScenario 2014-05-29T21:04:57+09:00",
	        "TestScenario 2014-05-29T21:04:57+09:00",
	        "TestScenario 2014-05-29T21:04:57+09:00",
	        "TestScenario 2014-05-29T21:04:57+09:00"
	    ],
	    "device": [
	        "Galaxy",
	        "G2",
	        "Nokia",
	        "XaomiXXX",
	        "GogolPhone"
	    ],
	    "rank": {
	        "A": 15,
	        "B": 15,
	        "C": 10,
	        "D": 11
	    },
	    "os_version": {
	        "4.1": 10,
	        "2.3": 10,
	        "4.3": 11,
	        "4.4": 10,
	        "4.0": 10
	    },
	    "status": {
	        "-1": 51
	    }
	};
	//d3.json(filter_address, function (data) {
	
	var field, field_key, field_value, field_value_each, dropdown_button, dropdown;
	if (fields.indexOf("rank")>-1) {
		field = div.append("div").attr("class","filter-field");
		field_key = field.append("div").attr("class","filter-key").text("Rank")
		field_value = field.append("div").attr("class","filter-value");
		for (i in data.rank) {
			field_value.append("input").attr("type","checkbox");
			field_value.append("span");
			field_value.append("div").attr("class","filter-value-each")
				.text(i+"("+data.rank[i]+")");
		}
	}
	if (fields.indexOf("status")>-1) {
		field = div.append("div").attr("class","filter-field");
		field_key = field.append("div").attr("class","filter-key").text("Status")
		field_value = field.append("div").attr("class","filter-value");
		for (i in data.status) {
			var status;
			if (i==-1) {status="Error"}
			else if (i==0) {status="Warning"}
			else if (i==1) {status="Pass"}
			field_value.append("input").attr("type","checkbox");
			field_value.append("span");
			field_value.append("div").attr("class","filter-value-each")
				.text(status+"("+data.status[i]+")");
		}
	}
	if (fields.indexOf("os_version")>-1) {
		field = div.append("div").attr("class","filter-field");
		field_key = field.append("div").attr("class","filter-key").text("OS Version")
		field_value = field.append("div").attr("class","filter-value");
		for (i in data.os_version) {
			field_value.append("input").attr("type","checkbox");
			field_value.append("span");
			field_value.append("div").attr("class","filter-value-each")
				.text(i+"("+data.os_version[i]+")");
		}
	}
	if (fields.indexOf("device")>-1) {
		field = div.append("div").attr("class","filter-field");
		field_key = field.append("div").attr("class","filter-key").text("Device")
		field_value = field.append("div").attr("class","filter-value");
		dropdown_button = field_value.append("div").attr("class","filter-value-each")
			.append("div").attr("class","filter-value-device").style("position","relative")
			.on("mouseover",function (){
				d3.select(this).select(".filter-value-dropdown").style("display","block");
			})
			.on("mouseout",function (){
				d3.select(this).select(".filter-value-dropdown").style("display","none");
			});
		dropdown = dropdown_button.append("div").attr("class","filter-value-dropdown");
		for (i in data.device) {
			dropdown.append("div").attr("class","filter-value-dropdown-each")
				.text(""+data.device[i]);
		}
	}
	if (fields.indexOf("name")>-1) {
		field = div.append("div").attr("class","filter-field");
		field_key = field.append("div").attr("class","filter-key").text("Name")
		field_value = field.append("div").attr("class","filter-value");
		dropdown_button = field_value.append("div").attr("class","filter-value-each")
			.append("div").attr("class","filter-value-scenario").style("position","relative")
			.on("mouseover",function (){
				d3.select(this).select(".filter-value-dropdown").style("display","block");
			})
			.on("mouseout",function (){
				d3.select(this).select(".filter-value-dropdown").style("display","none");
			});
		dropdown = dropdown_button.append("div").attr("class","filter-value-dropdown");
		for (i in data.name) {
			dropdown.append("div").attr("class","filter-value-dropdown-each")
				.text(""+data.name[i]);
		}
	}
	field = div.append("div").attr("class","filter-submit");
	field.append("input").attr("type","submit")
	//})
}
