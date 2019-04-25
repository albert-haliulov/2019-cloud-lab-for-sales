var express = require('express');

// Constants
var DEFAULT_PORT = 8080;
var PORT = process.env.PORT || DEFAULT_PORT;

// App
var app = express();
app.get('/', function (req, res) {
  res.send('<h1>Hello World sample</h1><h2>Congrats! Your app is running.</h2>');
});

app.listen(PORT)
console.log('Running on http://localhost:' + PORT);