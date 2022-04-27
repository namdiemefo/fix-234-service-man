/// firstTime : 2
/// isEmailVerified : false
/// isPhoneVerified : false
/// available : false
/// changePasswordRequired : false
/// resetPasswordToken : ""
/// resetPasswordExpires : null
/// _id : "60e25aae04c9b8001597a9f5"
/// fullName : "Nancy Feyi"
/// email : "nancyfeyi@yahoo.com"
/// phone : "+23490807732"
/// type : "Generator"
/// password : "$2a$10$P19rZUjMmMKEXJCp2G8HcuYLLr8Gkvx3UIyshfSp9At35sOsrdWJC"
/// staffId : "FX-0001"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5hbmN5ZmV5aUB5YWhvby5jb20iLCJpZCI6IjYwZTI1YWFlMDRjOWI4MDAxNTk3YTlmNSIsImlhdCI6MTYyNTQ1MTk3NSwiZXhwIjozMjUwOTI3OTUwLCJpc3MiOiJJT05FQyJ9.vbslBipkXa5yY3EPdf2KWHF4YEIzp_UopOA-TwG3Ua4"
/// createdAt : "2021-07-05T01:04:46.809Z"
/// updatedAt : "2021-07-05T02:26:14.463Z"
/// __v : 0

class LoginResponseModel {
  int _firstTime;
  bool _isEmailVerified;
  bool _isPhoneVerified;
  bool _available;
  bool _changePasswordRequired;
  String _resetPasswordToken;
  dynamic _resetPasswordExpires;
  String _id;
  String _fullName;
  String _email;
  String _phone;
  String _type;
  String _image;
  String _password;
  String _staffId;
  String _token;
  String _createdAt;
  String _updatedAt;
  int _v;

  int get firstTime => _firstTime;
  bool get isEmailVerified => _isEmailVerified;
  bool get isPhoneVerified => _isPhoneVerified;
  bool get available => _available;
  bool get changePasswordRequired => _changePasswordRequired;
  String get resetPasswordToken => _resetPasswordToken;
  dynamic get resetPasswordExpires => _resetPasswordExpires;
  String get id => _id;
  String get fullName => _fullName;
  String get email => _email;
  String get phone => _phone;
  String get type => _type;
  String get image => _image;
  String get password => _password;
  String get staffId => _staffId;
  String get token => _token;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get v => _v;

  // ignore: unnecessary_getters_setters
  set image(String newImage) {
    _image = newImage;
  }

  LoginResponseModel({
      int firstTime, 
      bool isEmailVerified, 
      bool isPhoneVerified, 
      bool available, 
      bool changePasswordRequired, 
      String resetPasswordToken, 
      dynamic resetPasswordExpires, 
      String id, 
      String fullName, 
      String email, 
      String phone, 
      String type,
      String image,
      String password, 
      String staffId, 
      String token, 
      String createdAt, 
      String updatedAt, 
      int v}){
    _firstTime = firstTime;
    _isEmailVerified = isEmailVerified;
    _isPhoneVerified = isPhoneVerified;
    _available = available;
    _changePasswordRequired = changePasswordRequired;
    _resetPasswordToken = resetPasswordToken;
    _resetPasswordExpires = resetPasswordExpires;
    _id = id;
    _fullName = fullName;
    _email = email;
    _phone = phone;
    _type = type;
    _image = image;
    _password = password;
    _staffId = staffId;
    _token = token;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  LoginResponseModel.fromJson(dynamic json) {
    _firstTime = json["firstTime"];
    _isEmailVerified = json["isEmailVerified"];
    _isPhoneVerified = json["isPhoneVerified"];
    _available = json["available"];
    _changePasswordRequired = json["changePasswordRequired"];
    _resetPasswordToken = json["resetPasswordToken"];
    _resetPasswordExpires = json["resetPasswordExpires"];
    _id = json["_id"];
    _fullName = json["fullName"];
    _email = json["email"];
    _phone = json["phone"];
    _type = json["type"];
    _image = json["image"];
    _password = json["password"];
    _staffId = json["staffId"];
    _token = json["token"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
    _v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["firstTime"] = _firstTime;
    map["isEmailVerified"] = _isEmailVerified;
    map["isPhoneVerified"] = _isPhoneVerified;
    map["available"] = _available;
    map["changePasswordRequired"] = _changePasswordRequired;
    map["resetPasswordToken"] = _resetPasswordToken;
    map["resetPasswordExpires"] = _resetPasswordExpires;
    map["_id"] = _id;
    map["fullName"] = _fullName;
    map["email"] = _email;
    map["phone"] = _phone;
    map["type"] = _type;
    map["image"] = _image;
    map["password"] = _password;
    map["staffId"] = _staffId;
    map["token"] = _token;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["__v"] = _v;
    return map;
  }

}