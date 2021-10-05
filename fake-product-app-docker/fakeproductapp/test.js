//Endpoint health checker tests

var expect  = require('chai').expect;
var request = require('request');

it('Endpoint Health Checker Test', function(done) {
    request('http://localhost:8080' , function(error, response, body) {
        expect(body).to.equal('Hello Fake Product');
        done();
    });
});