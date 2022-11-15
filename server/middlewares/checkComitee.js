verifyComitee = (req, res, next) => {
  const comitee = ["3121600028", "3121600001"];
  let nrp = req.nrp;

  if (!comitee.includes(nrp)) {
    return res.status(403).send({ message: "Anda bukan panitia!" });
  } else {
    next();
  }
};

const checkComitee = {
  verifyComitee,
};
module.exports = checkComitee;
