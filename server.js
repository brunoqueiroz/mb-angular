var fs = require('fs');
var file = __dirname + '/json/';
var express = require('express');
var app = express();

//app.use(express.bodyParser());
//app.use(express.methodOverride());
//app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));

getData = function (usuario) {
  return fs.readFileSync(file + usuario)  
}

app.get('/api/me', function(req, res){
  var result = getData('usuario.json');
  res.type('text/json');
  res.send(result);
});

app.get('/api/usuarios', function(req, res){
  var result = getData('listarUsuarios.json');
  res.type('text/json');
  res.send(result);
});

app.get('/api/usuario/:id', function(req, res){
  var collection = JSON.parse(getData('listarUsuarios.json'))
  result = {}
  for(i=0;i<collection.length;i++){
    u = collection[i]
    if(u.id === parseInt(req.param('id')))
      result = u
  }
  res.type('text/json');
  res.send(result);
});

app.post('/api/login', function(req, res){
  var result = getData('listarUsuarios.json');
  res.type('text/json');
  res.send(result);
});

app.get('/api/usuario/detalhes', function(req, res){
  var result = getData('listarUsuarios.json');
  res.type('text/json');
  res.send(result);
});

app.listen(8080);


