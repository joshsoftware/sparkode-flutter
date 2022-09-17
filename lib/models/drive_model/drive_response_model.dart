import 'dart:convert';

DriveResponseModel driveResponseModelFromJson(String str) => DriveResponseModel.fromJson(json.decode(str));

String driveResponseModelToJson(DriveResponseModel data) => json.encode(data.toJson());

class DriveResponseModel {
  DriveResponseModel({
    required this.data,
    this.message,
  });

  Data data;
  String? message;

  factory DriveResponseModel.fromJson(Map<String, dynamic> json) => DriveResponseModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.drives,
    required this.totalDrives,
  });

  List<Drive> drives;
  int totalDrives;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    drives: List<Drive>.from(json["drives"].map((x) => Drive.fromJson(x))),
    totalDrives: json["total_drives"],
  );

  Map<String, dynamic> toJson() => {
    "drives": List<dynamic>.from(drives.map((x) => x.toJson())),
    "total_drives": totalDrives,
  };
}

class Drive {
  Drive({
    required this.id,
    this.name,
    this.description,
    this.startTime,
    this.endTime,
    this.invitationSent,
    this.appeared,
    this.totalSubmissions,
    this.uuid,
  });

  int id;
  String? name;
  String? description;
  String? startTime;
  String? endTime;
  int? invitationSent;
  int? appeared;
  int? totalSubmissions;
  String? uuid;

  factory Drive.fromJson(Map<String, dynamic> json) => Drive(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    invitationSent: json["invitation_sent"],
    appeared: json["appeared"],
    totalSubmissions: json["total_submissions"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "start_time": startTime,
    "end_time": endTime,
    "invitation_sent": invitationSent,
    "appeared": appeared,
    "total_submissions": totalSubmissions,
    "uuid": uuid,
  };
}
