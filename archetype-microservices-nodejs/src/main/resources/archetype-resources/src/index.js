'use strict'
//const {EventEmitter} = require('events')
const server = require('./server/server')


process.on('uncaughtException', (err) => {
  console.error('Unhandled Exception', err)
})

process.on('uncaughtRejection', (err, promise) => {
  console.error('Unhandled Rejection', err)
})


console.log('Connected. Starting Server')
return server.start();
