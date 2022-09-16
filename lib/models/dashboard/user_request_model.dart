import 'package:sparkode/base/Model/base_request_model.dart';
import 'package:sparkode/utility/constants/api_constants.dart';

class UsersRequestModel extends BaseRequestModel {
  UsersRequestModel();

  @override
  String get path => ApiConstants.getUsers;

  // @override
  // Map<String, String> get header => {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json",
  //     };

  // @override
  // Map<String, String> get param => {"mobile_number": mobileNumber};

  @override
  RequestType get requestType => RequestType.get;
}
