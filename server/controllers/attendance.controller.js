const db = require("../models");
const User = db.user;
const Event = db.event;
const Attendance = db.attendance;

const compareDates = (time, start, end) => {
  let times = new Date(time).getTime();
  let starts = new Date(start).getTime();
  let ends = new Date(end).getTime();

  if (times < ends && times > starts) {
    return "Aman";
  } else {
    return "Telat";
  }
  
};

exports.addAttendance = (req, res) => {
  User.findById(req.body.id).exec((err, user) => {
    Event.findOne({ token: req.body.token }).exec((err, event) => {
      const attendance = new Attendance({
        idEvent: event.id,
        name: user.name,
        event: event.name,
        time: req.body.time,
        status: compareDates(req.body.time, event.start, event.end)
      });

      attendance.save((err, attendance) => {
        if (err) {
          res.status(500).send({ message: err });
          return;
        }
    
        res.send({ message: "Berhasil melakukan absensi" });
      });
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
  
  Attendance.find({idEvent: req.query.id}).exec((err, attendance) => {
    if (err) {
      return res.status(500).send({ message: err });
    }

    res.send({ 
      message: "Berhasil mendapatkan semua absen",
      data: attendance
     });
  })
}


