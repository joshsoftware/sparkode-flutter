// To parse this JSON data, do
//
//     final resultListResponseModel = resultListResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResultListResponseModel resultListResponseModelFromJson(String str) =>
    ResultListResponseModel.fromJson(json.decode(str));

String resultListResponseModelToJson(ResultListResponseModel data) =>
    json.encode(data.toJson());

class ResultListResponseModel {
  ResultListResponseModel({
    required this.data,
    this.message,
  });

  Data data;
  String? message;

  factory ResultListResponseModel.fromJson(Map<String, dynamic> json) =>
      ResultListResponseModel(
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
    required this.result,
    required this.page,
    required this.pages,
    required this.driveName,
    this.totalSelectedCandidates,
  });

  List<Result> result;
  int page;
  int pages;
  String driveName;
  int? totalSelectedCandidates;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        page: json["page"],
        pages: json["pages"],
        driveName: json["drive_name"],
        totalSelectedCandidates: json["total_selected_candidates"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "page": page,
        "pages": pages,
        "drive_name": driveName,
        "total_selected_candidates": totalSelectedCandidates,
      };
}

class Result {
  Result({
    required this.candidateId,
    this.firstName,
    this.lastName,
    this.email,
    this.score,
    // this.endTimes,
    // this.timeTaken,
    this.token,
    this.isSelected = false,
  });

  int candidateId;
  String? firstName;
  String? lastName;
  String? email;
  int? score;
  String? token;
  bool? isSelected;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        candidateId: json["candidate_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        score: json["score"],
        // endTimes: DateTime.parse(json["end_times"]),
        // timeTaken: json["time_taken"],
        token: json["token"],
        isSelected: json["is_selected"],
      );

  Map<String, dynamic> toJson() => {
        "candidate_id": candidateId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "score": score,
        // "end_times": endTimes?.toIso8601String(),
        // "time_taken": timeTaken,
        "token": token,
        "is_selected": isSelected,
      };
}
