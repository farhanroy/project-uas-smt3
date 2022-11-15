const { authJwt, checkComitee } = require("../middlewares");
const controller = require("../controllers/event.controller");

module.exports = function (app) {
  app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "Origin, Content-Type, Accept");
    next();
  });

  app.post("/api/event/add", [authJwt.verifyToken, checkComitee.verifyComitee], controller.addEvent);

  app.post("/api/event/delete", [authJwt.verifyToken, checkComitee.verifyComitee], controller.deleteEvent);

  app.get("/api/event/all", [authJwt.verifyToken, checkComitee.verifyComitee], controller.getAllEvent);
};
