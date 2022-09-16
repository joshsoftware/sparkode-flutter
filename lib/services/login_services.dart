import 'package:sparkode/base/services/base_service.dart';
import 'package:sparkode/models/login_model/login_request_model.dart';
import 'package:sparkode/models/login_model/login_response_model.dart';
import 'package:sparkode/utility/helpers/APIHelper/api_response_model.dart';

class LoginServices {
  Future<ResponseModel> loginUser(String email, String password) async {
    final ServiceResponseModel response = await BaseServiceManager
        .sharedInstance
        .sendRequest(LoginRequestModel(email: email, password: password));
    if (response.isSuccess) {
      try {
        return ResponseModel(data: response.data);
      } catch (e) {
        return ResponseModel(errorMessage: "Parsing Error", isSuccess: false);
      }
    } else {
      return ResponseModel(
          errorMessage: "error: ${response.errorMessage}", isSuccess: false);
    }
  }
}
