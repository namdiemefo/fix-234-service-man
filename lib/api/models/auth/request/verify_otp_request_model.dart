/// phone : "+23409080773642"
/// code : "5982"

class VerifyOtpResponseModel {
  String _phone;
  String _code;

  String get phone => _phone;
  String get code => _code;

  VerifyOtpResponseModel({
      String phone, 
      String code}){
    _phone = phone;
    _code = code;
}

  VerifyOtpResponseModel.fromJson(dynamic json) {
    _phone = json["phone"];
    _code = json["code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["phone"] = _phone;
    map["code"] = _code;
    return map;
  }

}