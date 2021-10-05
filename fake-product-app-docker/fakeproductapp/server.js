//Fake Product App

var express = require('express')
var app = express()

app.get('/', function (req, res) {
const product = 'Fake Product'
res.send('Hello' + ' ' + product)
})
app.listen(8080, function () {
console.log('app started on http://localhost:8080/')
})