/// _id : "62aa674e3b7eabf64f18eaf4"
/// name : "Air Conditioner"
/// user : "Nnamdi Emefo"
/// user_image : ""
/// date : "11 November, 2020"
/// bookingId : "67B405"
/// time : "Afternoon"
/// service : "622be2e51b6f2c9f3a5a5c2e"
/// description : "Huge Fan Issue"
/// owner : "62aa5b4ad0d1c02e4024876a"
/// frequency : "Monthly"
/// location : "No 6, Wrights Avenue, Magodo, Lagos"
/// assigned : true
/// status : "Assigned"
/// userPhone : "2349080773642"
/// reassignmentRequest : false
/// reassigned : false
/// createdAt : "2022-06-15T23:12:14.422Z"
/// updatedAt : "2022-08-26T01:11:52.345Z"
/// __v : 1
/// technician : "Tech Tony"
/// technicianId : "626a6e5681db0ae6a84980b0"
/// technicianImage : ""
/// technicianPhone : "08187495650"
/// assistantRequest : true
/// assistantRequestNumber : 1
/// assistantRequestStatus : 1
/// assistantTechnicianId : ["",""]

class GetBookingResponse {
  String _id;
  String _name;
  String _user;
  String _userImage;
  String _date;
  String _bookingId;
  String _time;
  String _service;
  String _description;
  String _owner;
  String _frequency;
  String _location;
  bool _assigned;
  String _status;
  String _userPhone;
  bool _reassignmentRequest;
  bool _reassigned;
  String _createdAt;
  String _updatedAt;
  int _v;
  String _technician;
  String _technicianId;
  String _technicianImage;
  String _technicianPhone;
  bool _assistantRequest;
  int _assistantRequestNumber;
  int _assistantRequestStatus;
  List<String> _assistantTechnicianId;

  String get id => _id;
  String get name => _name;
  String get user => _user;
  String get userImage => _userImage;
  String get date => _date;
  String get bookingId => _bookingId;
  String get time => _time;
  String get service => _service;
  String get description => _description;
  String get owner => _owner;
  String get frequency => _frequency;
  String get location => _location;
  bool get assigned => _assigned;
  String get status => _status;
  String get userPhone => _userPhone;
  bool get reassignmentRequest => _reassignmentRequest;
  bool get reassigned => _reassigned;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get v => _v;
  String get technician => _technician;
  String get technicianId => _technicianId;
  String get technicianImage => _technicianImage;
  String get technicianPhone => _technicianPhone;
  bool get assistantRequest => _assistantRequest;
  int get assistantRequestNumber => _assistantRequestNumber;
  int get assistantRequestStatus => _assistantRequestStatus;
  List<String> get assistantTechnicianId => _assistantTechnicianId;

  GetBookingResponse({
      String id, 
      String name, 
      String user, 
      String userImage, 
      String date, 
      String bookingId, 
      String time, 
      String service, 
      String description, 
      String owner, 
      String frequency, 
      String location, 
      bool assigned, 
      String status, 
      String userPhone, 
      bool reassignmentRequest, 
      bool reassigned, 
      String createdAt, 
      String updatedAt, 
      int v, 
      String technician, 
      String technicianId, 
      String technicianImage, 
      String technicianPhone, 
      bool assistantRequest, 
      int assistantRequestNumber, 
      int assistantRequestStatus, 
      List<String> assistantTechnicianId}){
    _id = id;
    _name = name;
    _user = user;
    _userImage = userImage;
    _date = date;
    _bookingId = bookingId;
    _time = time;
    _service = service;
    _description = description;
    _owner = owner;
    _frequency = frequency;
    _location = location;
    _assigned = assigned;
    _status = status;
    _userPhone = userPhone;
    _reassignmentRequest = reassignmentRequest;
    _reassigned = reassigned;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _technician = technician;
    _technicianId = technicianId;
    _technicianImage = technicianImage;
    _technicianPhone = technicianPhone;
    _assistantRequest = assistantRequest;
    _assistantRequestNumber = assistantRequestNumber;
    _assistantRequestStatus = assistantRequestStatus;
    _assistantTechnicianId = assistantTechnicianId;
}

  GetBookingResponse.fromJson(dynamic json) {
    _id = json["_id"];
    _name = json["name"];
    _user = json["user"];
    _userImage = json["user_image"];
    _date = json["date"];
    _bookingId = json["bookingId"];
    _time = json["time"];
    _service = json["service"];
    _description = json["description"];
    _owner = json["owner"];
    _frequency = json["frequency"];
    _location = json["location"];
    _assigned = json["assigned"];
    _status = json["status"];
    _userPhone = json["userPhone"];
    _reassignmentRequest = json["reassignmentRequest"];
    _reassigned = json["reassigned"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
    _v = json["__v"];
    _technician = json["technician"];
    _technicianId = json["technicianId"];
    _technicianImage = json["technicianImage"];
    _technicianPhone = json["technicianPhone"];
    _assistantRequest = json["assistantRequest"];
    _assistantRequestNumber = json["assistantRequestNumber"];
    _assistantRequestStatus = json["assistantRequestStatus"];
    _assistantTechnicianId = json["assistantTechnicianId"] != null ? json["assistantTechnicianId"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = _id;
    map["name"] = _name;
    map["user"] = _user;
    map["user_image"] = _userImage;
    map["date"] = _date;
    map["bookingId"] = _bookingId;
    map["time"] = _time;
    map["service"] = _service;
    map["description"] = _description;
    map["owner"] = _owner;
    map["frequency"] = _frequency;
    map["location"] = _location;
    map["assigned"] = _assigned;
    map["status"] = _status;
    map["userPhone"] = _userPhone;
    map["reassignmentRequest"] = _reassignmentRequest;
    map["reassigned"] = _reassigned;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["__v"] = _v;
    map["technician"] = _technician;
    map["technicianId"] = _technicianId;
    map["technicianImage"] = _technicianImage;
    map["technicianPhone"] = _technicianPhone;
    map["assistantRequest"] = _assistantRequest;
    map["assistantRequestNumber"] = _assistantRequestNumber;
    map["assistantRequestStatus"] = _assistantRequestStatus;
    map["assistantTechnicianId"] = _assistantTechnicianId;
    return map;
  }

}