//https://sparkode-api.sparkode.online/api/v1/admin/drives/457/results?page=1&search=

import 'package:sparkode/base/Model/base_request_model.dart';
import 'package:sparkode/utility/constants/api_constants.dart';

class ResultListRequestModel extends BaseRequestModel {
  ResultListRequestModel({required this.id, required this.page});
  String id;
  int page;

  @override
  String get path => "${ApiConstants.apiPath}/admin/drives/$id/results";

  @override
  RequestType get requestType => RequestType.get;

  @override
  Map<String, dynamic> get param => {"page": page};
}
