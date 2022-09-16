import 'package:sparkode/base/services/base_service.dart';
import 'package:sparkode/models/drive_model/drive_request_model.dart';
import 'package:sparkode/utility/helpers/APIHelper/api_response_model.dart';

class HomeServices {
  Future<ResponseModel> getDrives(String drivePath) async {
    final ServiceResponseModel response =
        await BaseServiceManager.sharedInstance.sendRequest(
            DriveRequestModel(limit: 20, offset: 0, drivePath: drivePath));

    if (response.isSuccess) {
      try {
        return ResponseModel(data: response.data);
      } catch (e) {
        return ResponseModel(errorMessage: "Parsing Error", isSuccess: false);
      }
    } else {
      return ResponseModel(
          errorMessage: "error: ${response.errorMessage}",
          isSuccess: false,
          data: response.data);
    }
  }
}
