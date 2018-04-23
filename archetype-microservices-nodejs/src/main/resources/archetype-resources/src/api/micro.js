'use strict'
const status = require('http-status')

module.exports = (app) => {
  

  app.get('/micro', (req, res, next) => {
    res.status(status.OK).json("test");
    /*
    repo.getAll().then(res => {
      res.status(status.OK).json(all)
    }).catch(next)*/
  });

  app.get('/micro/id/:id', (req, res, next) => {
    
    res.status(status.OK).json(req.params.id)
    
  });

};
