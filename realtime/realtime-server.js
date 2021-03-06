var io = require('socket.io').listen(5001),
    redis = require('redis').createClient();

redis.subscribe('rt-change');

// io.configure(function(){
// 	io.set('transports', ['websocket', 'xhr-polling', 'jsonp-polling', 'htmlfile', 'flashsocket']);
// 	io.set('origins', '*:*');	
// });

// io.configure(function () { 
//   io.set("transports", ["xhr-polling"]); 
//   io.set("polling duration", 10); 
// });

var rooms = [];

io.sockets.on('connection', function(socket){
	socket.on('chat message', function(msg){
		console.log('message: ' + msg);
	});

	socket.on('create', function(room){
		rooms.push(room);
		socket.emit('updateromms', rooms, socket.room);
	});

  redis.on('message', function(channel, message){
    socket.emit('rt-change', JSON.parse(message));
  });
});
