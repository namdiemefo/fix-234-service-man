/// token : "hehnfjrj"

class TokenModel {
  String _token;

  String get token => _token;

  TokenModel({
      String token}){
    _token = token;
}

  TokenModel.fromJson(dynamic json) {
    _token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = _token;
    return map;
  }

}