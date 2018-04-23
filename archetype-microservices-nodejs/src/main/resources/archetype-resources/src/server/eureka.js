const Eureka = require('eureka-js-client').Eureka;
const ip = require('ip');
/*const morgan = require('morgan'); --> to manage environmets*/

const client = new Eureka({

    instance: {
      app: 'nodeservice',
      hostName: 'localhost',
      ipAddr: ip.address(),
      instanceId: ip.address() + ":nodeservice:" + "0",
      port: {
            '$': 3000,
            '@enabled': true
      },
      vipAddress: 'nodeservice',
      statusPageUrl: 'http://localhost:3000',
      homePageUrl: 'http://localhost:3000',
      healthCheckUrl: 'http://localhost:3000',
      dataCenterInfo: {
        name: 'MyOwn',
        '@class': 'com.netflix.appinfo.InstanceInfo$DefaultDataCenterInfo',
      },
    },
    eureka: {
      useLocalMetadata: true,
      host: 'localhost',
      port: 2222,
      servicePath: '/eureka/apps/'
    },
});

module.exports = Object.assign({}, {client});