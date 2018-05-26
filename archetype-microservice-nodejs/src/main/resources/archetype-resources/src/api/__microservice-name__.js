"use strict"
const status = require("http-status");


module.exports = (app) => {
  
  
  app.get("/health", (req, res, next) => {
    res.status(status.OK).json({status: "UP", description: "micro ${microservice-name}"});
  });

  app.get("/info", (req, res, next) => {
    res.status(status.OK).json({author: "Rafael Blanco", description: "micro nodejs ${microservice-name}"});
  });

  app.get("/${microservice-mapping}", (req, res, next) => {
    res.status(status.OK).json({object: {field1:"value1", field2: "value2"}});
    /*
    repo.getAll().then(res => {
      res.status(status.OK).json(all)
    }).catch(next)*/
  });

  app.get("/${microservice-mapping}/id/:id", (req, res, next) => {
    res.status(status.OK).json(req.params.id);
  });

};
