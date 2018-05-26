
const express = require("express");
const helmet = require("helmet");
const api = require("../api/${microservice-name}");
const config = require("../config");
const eureka = require("./eureka");

const swaggerUi = require("swagger-ui-express");
const swaggerDocument = require("../api/swagger.json");

const expressMiddleware = require("zipkin-instrumentation-express").expressMiddleware
const zipkin = require ("./zipkin");
const serviceName = "${microservice-name}";
const msg = require("../utils/messages");


function exitHandler(options, err) {
    try{
      eureka.stop();
  }catch(e){
    msg.box("error closing eureka:" + e);
  }
    process.exit(1);
}

const start = () => {
  return new Promise((resolve, reject) => {
    msg.getGfiStart("0.0.1");
    msg.initializing("node")

    const app = express();

    app.use(helmet());
    
    app.use((err, req, res, next) => {
      reject(new Error("Something went wrong!, err:" + err))
      res.status(500).send("Something went wrong!");
    });

    config.getPort(function(port){

        if (!port) {
          reject(new Error("The server must be started with an available port"));
        }

        zipkin.start(function(tracer, middleware){
          app.use(middleware({tracer, serviceName, port, }));
          app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
          api(app);
        });

        const server = app.listen(port,() => {
          eureka.start(port);
        });   

        msg.ready("node", "http://localhost:" + port);
    });

    process.on("SIGTERM", exitHandler.bind(null,{cleanup:true}));
    process.on("SIGINT", exitHandler.bind(null,{cleanup:true}));});
    process.on("exit", exitHandler.bind(null,{cleanup:true}));
};

module.exports = Object.assign({}, {start});