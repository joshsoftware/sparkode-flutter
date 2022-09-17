import 'package:sparkode/models/candidate_model/candidate_list_request_model.dart';
import 'package:sparkode/utility/helpers/APIHelper/api_response_model.dart';

import '../base/services/base_service.dart';

class CandidateListService {
  Future<ResponseModel> getResultListForId(
      {required String id, required int page, String search = ""}) async {
    final ServiceResponseModel response = await BaseServiceManager
        .sharedInstance
        .sendRequest(CandidateListRequestModel(id: id, page: page));

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
