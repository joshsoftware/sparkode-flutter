import 'package:sparkode/models/result_model/result_list_request_model.dart';
import 'package:sparkode/utility/helpers/APIHelper/api_response_model.dart';

import '../base/services/base_service.dart';

class ResultListService {
  Future<ResponseModel> getResultListForId(
      {required String id, required int page}) async {
    final ServiceResponseModel response = await BaseServiceManager
        .sharedInstance
        .sendRequest(ResultListRequestModel(id: id, page: page));

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
