/// email : "nnaemefo@gmail.com"

class ForgotPasswordRequestModel {
  String _email;

  String get email => _email;

  ForgotPasswordRequestModel({
      String email}){
    _email = email;
}

  ForgotPasswordRequestModel.fromJson(dynamic json) {
    _email = json["email"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["email"] = _email;
    return map;
  }

}