/// email : "nnaemefo@gmail.com"

class ForgotPasswordResponseModel {
  String _email;

  String get email => _email;

  ForgotPasswordResponseModel({
      String email}){
    _email = email;
}

  ForgotPasswordResponseModel.fromJson(dynamic json) {
    _email = json["email"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["email"] = _email;
    return map;
  }

}