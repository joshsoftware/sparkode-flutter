// import 'package:sparkode/base/services/base_service.dart';
// import 'package:sparkode/utility/helpers/APIHelper/api_response_model.dart';

// import '../models/login_model/login_request_model.dart';
// import '../models/login_model/login_response_model.dart';

// class DashboardServices {
//   Future<ResponseModel> getUsers() async {
//     final ServiceResponseModel response = await BaseServiceManager
//         .sharedInstance
//         .sendRequest(UsersRequestModel());

//     if (response.isSuccess) {
//       try {
//         return ResponseModel(
//             data: userlistFromJson(response.data as List<dynamic>));
//       } catch (e) {
//         return ResponseModel(
//             errorMessage: 'Parsing Error : ${e.toString()}', isSuccess: false);
//       }
//     } else {
//       return ResponseModel(
//           errorMessage: "error: ${response.errorMessage}", isSuccess: false);
//     }
//   }
// }
