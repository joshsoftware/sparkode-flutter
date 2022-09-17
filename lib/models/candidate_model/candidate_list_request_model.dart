//https://sparkode-api.sparkode.online/api/v1/admin/drives/457/results?page=1&search=

import 'package:sparkode/base/Model/base_request_model.dart';
import 'package:sparkode/utility/constants/api_constants.dart';

class CandidateListRequestModel extends BaseRequestModel {
  CandidateListRequestModel({required this.id, required this.page,this.search=""});
  String id;
  int page;
  String search;

  @override
  String get path => "${ApiConstants.apiPath}/admin/drives/$id/candidate_list";

  @override
  RequestType get requestType => RequestType.get;

  @override
  Map<String, dynamic> get param => {"page": page,"search":search};
}
