const express = require('express');
const helmet = require('helmet');
const api = require('../api/micro');
const config = require('../config');
const eureka = require('./eureka');



const start = () => {
  return new Promise((resolve, reject) => {

    if (!config.serverSettings.port) {
      reject(new Error('The server must be started with an available port'));
    }
    
    const app = express();
    app.use(helmet());
    app.use((err, req, res, next) => {
      reject(new Error('Something went wrong!, err:' + err))
      res.status(500).send('Something went wrong!')
    });

    api(app);



    var server = app.listen(config.serverSettings.port,() => {
      console.log(eureka);
      eureka.client.start();
      console.log("Servie is listening to http://localhost:%s", config.serverSettings.port);
    });

    process.on('SIGTERM', exitHandler.bind(null,{cleanup:true}));
    process.on('SIGINT', exitHandler.bind(null,{cleanup:true}));});
    process.on('exit', exitHandler.bind(null,{cleanup:true}));
}

function exitHandler(options, err) {
    console.log("de-registering service from eureka");
    eureka.client.stop();
    process.exit(1);
}

module.exports = Object.assign({}, {start});