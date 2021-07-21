/// staffId : "FX-0001"
/// password : "IONEC"

class LoginRequestModel {
  String _staffId;
  String _password;

  String get staffId => _staffId;
  String get password => _password;

  LoginRequestModel({
      String staffId,
      String password}){
    _staffId = staffId;
    _password = password;
}

  LoginRequestModel.fromJson(dynamic json) {
    _staffId = json["staffId"];
    _password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["staffId"] = _staffId;
    map["password"] = _password;
    return map;
  }

}