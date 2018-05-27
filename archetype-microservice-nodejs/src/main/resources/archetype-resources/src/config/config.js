
const fp = require("find-free-port");
const client = require("cloud-config-client");
const msg = require("../utils/messages");


module.exports = {

  getPort (callback) {
    fp(3000).then(([freep]) => {
        msg.line("node port free to be used: " + freep);
        callback(freep);
    }).catch((err) => {
        console.error(err);
    });
  },

  getEurekaConfig (callback) {

    client.load({
        application: "${microservice-name}",
        endpoint: "http://${config-server-host}:${config-server-port}"

    }).then((config) => {

        const eureka = {
          port: config.get("eureka.server.port"),
          host: config.get("eureka.server.host"),
          path: config.get("eureka.service.path"),
          metadata: config.get("eureka.use.metadata"),
          app: config.get("eureka.instance.app"),
          vipAddress: config.get("eureka.instance.vip.address"),
          statusPage: config.get("eureka.instance.status.page"),
          homePage: config.get("eureka.instance.home.page"),
          healthPage: config.get("eureka.instance.health.page")
        }

        callback(eureka);

        // Using a prefix, this is equivalent to .get("this.is.another.key");
        //const value2 = config.get("this.is", "another.key");
    }).catch((error) => {
        msg.box("error recoverign eureka config from config-server");
        msg.box(error);
    });

  },

  getZipkinConfig (callback) {
    client.load({
        application: "${microservice-name}",
        endpoint: "http://${config-server-host}:${config-server-port}"

    }).then((config) => {

        const zipkin = {
          port: config.get("zipkin.server.port"),
          host: config.get("zipkin.server.host"),
          path: config.get("zipkin.server.path"),
        }
        callback(zipkin);
    }).catch((error) => {
        msg.box("error recoverign zipkin config from config-server");
        msg.box(error);
    });
  }

};