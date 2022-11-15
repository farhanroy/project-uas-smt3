const mongoose = require("mongoose");

const Event = mongoose.model(
  "Event",
  new mongoose.Schema({
    name: String,
    token: String,
    start: { type: Date, default: Date.now },
    end: { type: Date, default: Date.now },
  })
);

module.exports = Event;