const db = require("../models");
const User = db.user;
const Event = db.event;
const Attendance = db.attendance;

exports.addAttendance = (req, res) => {
  User.findById(req.body.id).exec((err, user) => {
    Event.findOne({ token: req.body.token }).exec((err, event) => {
      const attendance = new Attendance({
        name: user.name,
        event: event.name,
        time: Date.now(),
        status: "aman"
      });

      res.send({ message: user });
    });
  });
};

exports.deleteAttendance = (req, res) => {
  Attendance.findByIdAndRemove(req.body.id).exec((err, attendance) => {
    if (err) {
      return res.status(404).send({ message: err });
    }

    res.send({ message: "Berhasil menghapus absen" });
  })
}

exports.getAllAttendance = (req, res) => {
  
  Attendance.find().exec((err, attendance) => {
    if (err) {
      return res.status(500).send({ message: err });
    }

    res.send({ 
      message: "Berhasil mendapatkan semua absen",
      data: attendance
     });
  })
}
