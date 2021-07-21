/// oldPassword : "barcelona"
/// newPassword : "adeola"

class ChangePasswordResponseModel {
  String _oldPassword;
  String _newPassword;

  String get oldPassword => _oldPassword;
  String get newPassword => _newPassword;

  ChangePasswordResponseModel({
      String oldPassword, 
      String newPassword}){
    _oldPassword = oldPassword;
    _newPassword = newPassword;
}

  ChangePasswordResponseModel.fromJson(dynamic json) {
    _oldPassword = json["oldPassword"];
    _newPassword = json["newPassword"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["oldPassword"] = _oldPassword;
    map["newPassword"] = _newPassword;
    return map;
  }

}