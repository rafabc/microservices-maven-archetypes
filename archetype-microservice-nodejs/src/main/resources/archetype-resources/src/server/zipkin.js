
const { BatchRecorder } = require('zipkin');
const { HttpLogger } = require('zipkin-transport-http');
const CLSContext = require('zipkin-context-cls');
const { Tracer, Annotation, InetAddress, Request } = require('zipkin');
const ctxImpl = new CLSContext('zipkin');
const config = require('../config');
const msg = require('../utils/messages');
//const recorder = new ConsoleRecorder();

module.exports = {
  
  start: function (callback) {

    config.getZipkinConfig(function(data){

    	msg.initializing('zipkin');

    	const recorder = new BatchRecorder({
		  logger: new HttpLogger({
		    endpoint: data.host + ":" + data.port + data.path
		  })
		});

		const tracer = new Tracer({ ctxImpl, recorder });
		const zipkinMiddleware = require('zipkin-instrumentation-express').expressMiddleware;
		
		msg.ready('zipkin', data.host + ":" + data.port + data.path);

		callback(tracer, zipkinMiddleware);

    });
  }
};
