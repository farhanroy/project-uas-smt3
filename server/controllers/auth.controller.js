const config = require("../config/auth.config");
const db = require("../models");
const User = db.user;

var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");

exports.signup = (req, res) => {
  const user = new User({
    email: req.body.email,
    nrp: req.body.nrp,
    name: req.body.name,
    password: bcrypt.hashSync(req.body.password, 8),
  });

  user.save((err, user) => {
    if (err) {
      res.status(500).send({ message: err });
      return;
    }
    var token = jwt.sign({ id: user.id, nrp: user.nrp }, config.secret, {
      expiresIn: 86400, // 24 hours
    });

     res.status(200).send({
      message: "User was registered successfully!",
      data: {
        id: user._id,
        name: user.name,
        email: user.email,
        nrp: user.nrp,
      },
      token: token
    });
  });
};

exports.signin = (req, res) => {
  User.findOne({
    email: req.body.email,
  })
    .exec((err, user) => {
      if (err) {
        res.status(500).send({ message: err });
        return;
      }

      if (!user) {
        return res.status(404).send({ message: "User Not found." });
      }

      var passwordIsValid = bcrypt.compareSync(
        req.body.password,
        user.password
      );

      if (!passwordIsValid) {
        return res.status(401).send({ message: "Invalid Password!" });
      }

      var token = jwt.sign({ id: user.id, nrp: user.nrp }, config.secret, {
        expiresIn: 86400, // 24 hours
      });

      req.session.token = token;

      res.status(200).send({
        message: "User found.",
        data: {
          id: user._id,
          name: user.name,
          email: user.email,
          nrp: user.nrp,
        },
        token: token
      });
    });
};

exports.signout = async (req, res) => {
  try {
    req.session = null;
    return res.status(200).send({ message: "You've been signed out!" });
  } catch (err) {
    this.next(err);
  }
};