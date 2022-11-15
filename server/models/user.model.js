const mongoose = require("mongoose");

const User = mongoose.model(
  "User",
  new mongoose.Schema({
    email: String,
    nrp: String,
    name: String,
    password: String
  })
);

module.exports = User;