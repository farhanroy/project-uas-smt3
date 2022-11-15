const db = require("../models");
const Event = db.event;

exports.addEvent = (req, res) => {
  const event = new Event({
    name: req.body.name,
    token: (Math.random() + 1).toString(36).substring(7),
    start: req.body.start,
    end: req.body.end,
  });

  event.save((err, event) => {
    if (err) {
      res.status(500).send({ message: err });
      return;
    }

    res.send({ message: "Event was added successfully!" });
  });
};

exports.deleteEvent = (req, res) => {
  Event.findOneAndRemove(req.body.id).exec((err, event) => {
    if (err) {
      res.status(500).send({ message: err });
      return;
    }

    res.send({ message: "Event was deleted successfully!" });
  });
};

exports.getAllEvent = (req, res) => {
  
  Event.find().exec((err, event) => {
    if (err) {
      res.status(500).send({ message: err });
      return;
    }

    res.send({ 
      message: "Berhasil mendapatkan semua data event",
      data: event
     });

  });
};

exports.exportEvent = (req, res) => {};
