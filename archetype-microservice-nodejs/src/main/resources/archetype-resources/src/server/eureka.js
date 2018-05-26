const Eureka = require("eureka-js-client").Eureka;
const ip = require("ip");
const config = require("../config");
const os = require("os");
const chalk = require("chalk");
const log = console.log;
const msg = require("../utils/messages");

/*const morgan = require('morgan'); --> to manage environmets*/
var client = null;

module.exports = {
  
  start: function (port) {

    config.getEurekaConfig(function(data){

      msg.initializing("eureka");
      
      client = new Eureka({

        instance: {
          app: data.app,
          hostName: os.hostname(),
          ipAddr: ip.address(),
          instanceId: os.hostname() + ":" + data.app + ":" + port,
          port: {
                "$": port,
                "@enabled": true
          },
          vipAddress: "${microservice-name}",
          statusPageUrl: "http://localhost:" + port + data.statusPage,
          homePageUrl: "http://localhost:" + port + data.homePage,
          healthCheckUrl: "http://localhost:" + port + data.healthPage,
          dataCenterInfo: {
            name: "MyOwn",
            "@class": "com.netflix.appinfo.InstanceInfo$DefaultDataCenterInfo",
          },
        },
        eureka: {
          useLocalMetadata: data.metadata,
          host: data.host,
          port: data.port,
          servicePath: data.path
        },
      });

      client.logger.level("error");
      client.start();

      msg.ready("eureka", "http://" + data.host + ":" + data.port + data.path);
    });

  },
  stop: function () {
    msg.box("de-registering service from eureka");
    client.stop();

  }

};