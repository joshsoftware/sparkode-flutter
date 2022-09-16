import 'package:sparkode/base/Model/base_request_model.dart';
import 'package:sparkode/utility/constants/api_constants.dart';

class LoginRequestModel extends BaseRequestModel {
  LoginRequestModel({required this.email, required this.password});
  String email;
  String password;

  @override
  String get path => ApiConstants.loginPath;

  @override
  Map<String, String> get header => {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

  @override
  Map<String, String> get param => {"email": email, "password": password};

  @override
  RequestType get requestType => RequestType.post;
}
