import 'package:json_annotation/json_annotation.dart';

/// status : "Success"
/// code : 200
/// message : "Authentication Successful"
/// technician : {"firstTime":2,"isEmailVerified":false,"isPhoneVerified":false,"available":false,"changePasswordRequired":false,"resetPasswordToken":"","resetPasswordExpires":null,"_id":"60e25aae04c9b8001597a9f5","fullName":"Nancy Feyi","email":"nancyfeyi@yahoo.com","phone":"+23490807732","type":"Generator","password":"$2a$10$P19rZUjMmMKEXJCp2G8HcuYLLr8Gkvx3UIyshfSp9At35sOsrdWJC","staffId":"FX-0001","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5hbmN5ZmV5aUB5YWhvby5jb20iLCJpZCI6IjYwZTI1YWFlMDRjOWI4MDAxNTk3YTlmNSIsImlhdCI6MTYyNTQ1MTk3NSwiZXhwIjozMjUwOTI3OTUwLCJpc3MiOiJJT05FQyJ9.vbslBipkXa5yY3EPdf2KWHF4YEIzp_UopOA-TwG3Ua4","createdAt":"2021-07-05T01:04:46.809Z","updatedAt":"2021-07-05T02:26:14.463Z","__v":0}

class MyResponseModel {
  String _status;
  int _code;
  String _message;
  dynamic _data;

  String get status => _status;
  int get code => _code;
  String get message => _message;
  dynamic get data => _data;

  MyResponseModel({
      String status,
      int code,
      String message,
      dynamic data}){
    _status = status;
    _code = code;
    _message = message;
    _data = data;
}

  MyResponseModel.fromJson(dynamic json) {
    _status = json["status"];
    _code = json["code"];
    _message = json["message"];
    _data = json["data"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["code"] = _code;
    map["message"] = _message;
    map["data"] = _data;
    return map;
  }

}
