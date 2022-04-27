/// date : "Sun Jul 04 2021 23:27:46 GMT+0000 (Coordinated Universal Time)"
/// assigned : true
/// status : "Pending"
/// reassignmentRequest : true
/// reassigned : false
/// _id : "60e25e2f04c9b8001597a9f8"
/// name : "Air Conditioner"
/// service : "60e25e1704c9b8001597a9f7"
/// user : "Nancy Feyi"
/// description : "Fan issue"
/// time : "Afternoon"
/// owner : "606efb31c8f533bf5e8f71b3"
/// bookingId : "DB86D1"
/// frequency : "Monthly"
/// location : "Kano"
/// createdAt : "2021-07-05T01:19:43.300Z"
/// updatedAt : "2021-07-05T02:03:20.619Z"
/// __v : 0
/// technician : "Nancy Feyi"
/// technicianId : "60e25aae04c9b8001597a9f5"
/// technicianPhone : "+23490807732"
/// reason : "Stuck in huge traffic"

class GetBookingResponse {
  String _date;
  bool _assigned;
  String _status;
  bool _reassignmentRequest;
  bool _reassigned;
  String _id;
  String _name;
  String _service;
  String _user;
  String _userImage;
  String _userPhone;
  String _description;
  String _time;
  String _owner;
  String _bookingId;
  String _frequency;
  String _location;
  String _createdAt;
  String _updatedAt;
  int _v;
  String _technician;
  String _technicianId;
  String _technicianPhone;
  String _reason;

  String get date => _date;
  bool get assigned => _assigned;
  String get status => _status;
  bool get reassignmentRequest => _reassignmentRequest;
  bool get reassigned => _reassigned;
  String get id => _id;
  String get name => _name;
  String get service => _service;
  String get user => _user;
  String get userImage => _userImage;
  String get userPhone => _userPhone;
  String get description => _description;
  String get time => _time;
  String get owner => _owner;
  String get bookingId => _bookingId;
  String get frequency => _frequency;
  String get location => _location;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get v => _v;
  String get technician => _technician;
  String get technicianId => _technicianId;
  String get technicianPhone => _technicianPhone;
  String get reason => _reason;

  GetBookingResponse({
      String date, 
      bool assigned, 
      String status, 
      bool reassignmentRequest, 
      bool reassigned, 
      String id, 
      String name, 
      String service, 
      String user,
      String userImage,
      String userPhone,
      String description, 
      String time, 
      String owner, 
      String bookingId, 
      String frequency, 
      String location, 
      String createdAt, 
      String updatedAt, 
      int v, 
      String technician, 
      String technicianId, 
      String technicianPhone, 
      String reason}){
    _date = date;
    _assigned = assigned;
    _status = status;
    _reassignmentRequest = reassignmentRequest;
    _reassigned = reassigned;
    _id = id;
    _name = name;
    _service = service;
    _user = user;
    _userImage = userImage;
    _userPhone = userPhone;
    _description = description;
    _time = time;
    _owner = owner;
    _bookingId = bookingId;
    _frequency = frequency;
    _location = location;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _technician = technician;
    _technicianId = technicianId;
    _technicianPhone = technicianPhone;
    _reason = reason;
}

  GetBookingResponse.fromJson(dynamic json) {
    _date = json["date"];
    _assigned = json["assigned"];
    _status = json["status"];
    _reassignmentRequest = json["reassignmentRequest"];
    _reassigned = json["reassigned"];
    _id = json["_id"];
    _name = json["name"];
    _service = json["service"];
    _user = json["user"];
    _userImage = json["user_image"];
    _userPhone = json["userPhone"];
    _description = json["description"];
    _time = json["time"];
    _owner = json["owner"];
    _bookingId = json["bookingId"];
    _frequency = json["frequency"];
    _location = json["location"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
    _v = json["__v"];
    _technician = json["technician"];
    _technicianId = json["technicianId"];
    _technicianPhone = json["technicianPhone"];
    _reason = json["reason"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["date"] = _date;
    map["assigned"] = _assigned;
    map["status"] = _status;
    map["reassignmentRequest"] = _reassignmentRequest;
    map["reassigned"] = _reassigned;
    map["_id"] = _id;
    map["name"] = _name;
    map["service"] = _service;
    map["user"] = _user;
    map["user_image"] = _userImage;
    map["userPhone"] = _userPhone;
    map["description"] = _description;
    map["time"] = _time;
    map["owner"] = _owner;
    map["bookingId"] = _bookingId;
    map["frequency"] = _frequency;
    map["location"] = _location;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["__v"] = _v;
    map["technician"] = _technician;
    map["technicianId"] = _technicianId;
    map["technicianPhone"] = _technicianPhone;
    map["reason"] = _reason;
    return map;
  }

}