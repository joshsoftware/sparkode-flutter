import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparkode/models/login_model/login_response_model.dart';

class Preference {
  static late final SharedPreferences _prefs;
  static final Map<String, dynamic> _memoryPrefs = {};

  static Future<SharedPreferences> load() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static void setString(String key, String value) {
    _prefs.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _prefs.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
    _memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static String? getString(String key) =>
      _memoryPrefs[key] ?? _prefs.getString(key);

  static int? getInt(String key) => _memoryPrefs[key] ?? _prefs.getInt(key);

  static double? getDouble(String key) =>
      _memoryPrefs[key] ?? _prefs.getDouble(key);

  static bool? getBool(String key) => _memoryPrefs[key] ?? _prefs.getBool(key);

  static void setUser(String key,LoginResponseModel value){
    String json = jsonEncode(value);
    _prefs.setString(key, json);
  }

  static LoginResponseModel? getUser(String key){
    Map<String,dynamic> json;
    if(_prefs.getString(key)!=null) {
      json = jsonDecode(_prefs.getString(key)!);
    } else {
      return null;
    }

    var user = LoginResponseModel.fromJson(json);
    return user;
  }

  static void setHeaders(String key,Map<String,String>? value){
    String json = jsonEncode(value);
    _prefs.setString(key,json);
  }

  static Map<String,String>? getHeaders(String key){
    Map<String,dynamic> json;
    if(_prefs.getString(key)!=null && _prefs.getString(key)?.toLowerCase() != "null"){
      json = jsonDecode(_prefs.getString(key)!);
    }
    else{
      return null;
    }
    Map<String, String> stringQueryParameters =
    json.map((key, value) => MapEntry(key, value?.toString()??""));

    return stringQueryParameters;
  }


}
