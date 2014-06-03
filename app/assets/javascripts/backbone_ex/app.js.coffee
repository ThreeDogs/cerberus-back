$ () ->
  start = () ->
    app.realtime.connect();
    Backbone.history.start({pushState: true});

  start();
  