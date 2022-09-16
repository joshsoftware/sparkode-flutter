import 'package:sparkode/base/Model/base_request_model.dart';
import 'package:sparkode/utility/constants/api_constants.dart';

class DriveRequestModel extends BaseRequestModel{

  DriveRequestModel({required this.limit,required this.offset,required this.drivePath});

  String offset;
  String limit;
  String drivePath;

  @override
  String get path => "${ApiConstants.apiPath}/admin/drives/$drivePath";

  @override
  RequestType get requestType => RequestType.get;

  @override
  Map<String, String> get param => {"offset":offset,"limit":limit};

  @override
  Map<String, String> get header => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "access-token":"I2rFBdo3cgaF0woz9w2iDw",
    "expiry":"1664569941",
    "token_type":"Bearer",
    "client":"j-tKgc5dGY6imhiwL8Xnbg",
    "uid":"krushna.upadhye@joshsoftware.com"
  };

}