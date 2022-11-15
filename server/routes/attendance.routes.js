const { authJwt, checkComitee } = require("../middlewares");
const controller = require("../controllers/attendance.controller");

module.exports = function (app) {
  app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "Origin, Content-Type, Accept");
    next();
  });

  app.post("/api/attendance/add", [authJwt.verifyToken], controller.addAttendance);

  app.get("/api/attendance/all", [authJwt.verifyToken, checkComitee.verifyComitee], controller.getAllAttendance);
};
