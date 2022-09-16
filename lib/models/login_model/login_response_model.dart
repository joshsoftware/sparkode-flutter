// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.data,
  });

  Data data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.mobileNumber,
    required this.isFirstTimeLogin,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.organization,
    required this.credits,
    required this.organizationId,
    required this.allowCoding,
    required this.allowMcq,
    required this.authToken,
    this.isParamAiAllowed,
  });

  int id;
  String email;
  int mobileNumber;
  bool isFirstTimeLogin;
  String firstName;
  String lastName;
  String role;
  String organization;
  int credits;
  int organizationId;
  bool allowCoding;
  bool allowMcq;
  String authToken;
  bool? isParamAiAllowed;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        isFirstTimeLogin: json["is_first_time_login"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        role: json["role"],
        organization: json["organization"],
        credits: json["credits"],
        organizationId: json["organization_id"],
        allowCoding: json["allow_coding"],
        allowMcq: json["allow_mcq"],
        authToken: json["auth_token"],
        isParamAiAllowed: json["is_param_ai_allowed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "mobile_number": mobileNumber,
        "is_first_time_login": isFirstTimeLogin,
        "first_name": firstName,
        "last_name": lastName,
        "role": role,
        "organization": organization,
        "credits": credits,
        "organization_id": organizationId,
        "allow_coding": allowCoding,
        "allow_mcq": allowMcq,
        "auth_token": authToken,
        "is_param_ai_allowed": isParamAiAllowed,
      };
}
