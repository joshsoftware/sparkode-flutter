import 'package:sparkode/base/Model/base_request_model.dart';
import 'package:sparkode/utility/constants/api_constants.dart';

class DriveRequestModel extends BaseRequestModel {
  DriveRequestModel(
      {required this.limit, required this.offset, required this.drivePath});

  int offset;
  int limit;
  String drivePath;

  @override
  String get path => "${ApiConstants.apiPath}/admin/drives/$drivePath";

  @override
  RequestType get requestType => RequestType.get;

  @override
  Map<String, dynamic> get param => {"offset": offset, "limit": limit};
}
