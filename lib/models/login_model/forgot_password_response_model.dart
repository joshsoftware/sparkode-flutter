import 'dart:convert';

ForgotPasswordResponseModel forgotPasswordResponseModelFromJson(String str) => ForgotPasswordResponseModel.fromJson(json.decode(str));

String forgotPasswordResponseModelToJson(ForgotPasswordResponseModel data) => json.encode(data.toJson());

class ForgotPasswordResponseModel {
  ForgotPasswordResponseModel({
    required this.message,
    required this.status,
  });

  String message;
  int status;

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) => ForgotPasswordResponseModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
