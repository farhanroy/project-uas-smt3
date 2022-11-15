const mongoose = require("mongoose");

const Attendance = mongoose.model(
  "Attendance",
  new mongoose.Schema({
    name: String,
    nrp: String,
    nameEvent: String,
    time: { type: Date, default: Date.now },
    status: String
  })
);

module.exports = Attendance;