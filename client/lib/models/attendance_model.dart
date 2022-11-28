class Attendance {
  Attendance({
    this.id,
    this.name,
    this.time,
    this.status,
    this.v,
  });

  String? id;
  String? name;
  DateTime? time;
  String? status;
  int? v;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    id: json["_id"],
    name: json["name"],
    time: DateTime.parse(json["time"]),
    status: json["status"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "time": time?.toIso8601String(),
    "status": status,
    "__v": v,
  };
}