class EventModel {
  EventModel({
    this.id,
    this.name,
    this.token,
    this.start,
    this.end,
    this.v,
  });

  String? id;
  String? name;
  String? token;
  DateTime? start;
  DateTime? end;
  int? v;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    id: json["_id"],
    name: json["name"],
    token: json["token"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "token": token,
    "start": start?.toIso8601String(),
    "end": end?.toIso8601String(),
    "__v": v,
  };
}
