$(document).ready(function() {
	var socket = io.connect("http://0.0.0.0:5001");
	
	socket.on("rt-change", function(message){
		console.log(message);
		$('.device-list').append('<li>'+ message + '</li>')
	});
});