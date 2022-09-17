// To parse this JSON data, do
//
//     final candidateListResponseModel = candidateListResponseModelFromJson(jsonString);

import 'dart:convert';

CandidateListResponseModel candidateListResponseModelFromJson(String str) => CandidateListResponseModel.fromJson(json.decode(str));

String candidateListResponseModelToJson(CandidateListResponseModel data) => json.encode(data.toJson());

class CandidateListResponseModel {
  CandidateListResponseModel({
    required this.data,
    this.message,
  });

  Data data;
  String? message;

  factory CandidateListResponseModel.fromJson(Map<String, dynamic> json) => CandidateListResponseModel(
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
    required this.candidates,
    this.totalCandidates,
    required this.driveName,
    required this.page,
    required this.pages,
  });

  List<Candidate> candidates;
  int? totalCandidates;
  String driveName;
  int page;
  int pages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    candidates: List<Candidate>.from(json["candidates"].map((x) => Candidate.fromJson(x))),
    totalCandidates: json["total_candidates"],
    driveName: json["drive_name"],
    page: json["page"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "candidates": List<dynamic>.from(candidates.map((x) => x.toJson())),
    "total_candidates": totalCandidates,
    "drive_name": driveName,
    "page": page,
    "pages": pages,
  };
}

class Candidate {
  Candidate({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
  });

  int id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile_number": mobileNumber,
  };
}
