'use strict';
const http = require('http');
const redis = require('redis');

const REDISHOST = process.env.REDISHOST || 'localhost';
const REDISPORT = process.env.REDISPORT || 6379;

const client = redis.createClient(REDISPORT, REDISHOST);
client.on('error', err => console.error('ERR:REDIS:', err));

// create a server
http
  .createServer((req, res) => {
    // For CORS Allowing
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Request-Method', '*');
    res.setHeader('Access-Control-Allow-Methods', 'OPTIONS, GET');
    res.setHeader('Access-Control-Allow-Headers', '*');

    // increment the visit counter
    client.incr('visits', (err, reply) => {
      if (err) {
        console.log(err);
        res.status(500).send(err.message);
        return;
      }
      res.end(JSON.stringify({status: 10}));
    });
  })
  .listen(8080);