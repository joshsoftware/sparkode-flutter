import 'package:sparkode/base/Model/base_request_model.dart';
import 'package:sparkode/utility/constants/api_constants.dart';

class ForgotPasswordRequestModel extends BaseRequestModel{
  ForgotPasswordRequestModel({required this.email});
  String email;

  @override
  String get path => "${ApiConstants.apiPath}/forgot_password";

  @override
  Map<String, String> get header => {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };


  @override
  RequestType get requestType => RequestType.post;

}