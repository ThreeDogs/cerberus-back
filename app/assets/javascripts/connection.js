$(document).ready(function() {
	var socket = io.connect("localhost:5001");
	
	socket.on("rt-change", function(message){
		console.log(message);
	});
});