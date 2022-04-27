/// status : "Pending"
/// _id : "613e14718bd8599ac1619eec"
/// booking : "613e03fe5badb08d4adfac8a"
/// technician : "6125772caa8b74810a4d6eed"
/// technician_name : "Nancy Mercy"
/// user_name : "Kenedy Philips"
/// user : "61223fdf61834243907372e2"
/// call_fee : 1500
/// parts_total : 300
/// servicing_total : 300
/// equipment : [{"_id":"613e14718bd8599ac1619eed","name":"LG AC 1","service":"Air Conditioner","capacity":"5Hp","make":"LG","parts":[{"_id":"613e14718bd8599ac1619eee","name":"Spark Plug","price":300,"service":"Air Conditioner"}],"servicing":[{"_id":"613e14718bd8599ac1619eef","name":"Spark Plug","price":300,"service":"Air Conditioner"}]}]
/// total : 800
/// createdAt : "2021-09-12T14:53:37.483Z"
/// updatedAt : "2021-09-12T14:53:37.483Z"
/// __v : 0

class CreateBillResponse {
  String _status;
  String _id;
  String _booking;
  String _technician;
  String _technicianName;
  String _userName;
  String _user;
  int _callFee;
  int _partsTotal;
  int _servicingTotal;
  List<Equipment> _equipment;
  int _total;
  String _createdAt;
  String _updatedAt;
  int _v;

  String get status => _status;
  String get id => _id;
  String get booking => _booking;
  String get technician => _technician;
  String get technicianName => _technicianName;
  String get userName => _userName;
  String get user => _user;
  int get callFee => _callFee;
  int get partsTotal => _partsTotal;
  int get servicingTotal => _servicingTotal;
  List<Equipment> get equipment => _equipment;
  int get total => _total;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get v => _v;

  CreateBillResponse({
      String status, 
      String id, 
      String booking, 
      String technician, 
      String technicianName, 
      String userName, 
      String user, 
      int callFee, 
      int partsTotal, 
      int servicingTotal, 
      List<Equipment> equipment, 
      int total, 
      String createdAt, 
      String updatedAt, 
      int v}){
    _status = status;
    _id = id;
    _booking = booking;
    _technician = technician;
    _technicianName = technicianName;
    _userName = userName;
    _user = user;
    _callFee = callFee;
    _partsTotal = partsTotal;
    _servicingTotal = servicingTotal;
    _equipment = equipment;
    _total = total;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  CreateBillResponse.fromJson(dynamic json) {
    _status = json["status"];
    _id = json["_id"];
    _booking = json["booking"];
    _technician = json["technician"];
    _technicianName = json["technician_name"];
    _userName = json["user_name"];
    _user = json["user"];
    _callFee = json["call_fee"];
    _partsTotal = json["parts_total"];
    _servicingTotal = json["servicing_total"];
    if (json["equipment"] != null) {
      _equipment = [];
      json["equipment"].forEach((v) {
        _equipment.add(Equipment.fromJson(v));
      });
    }
    _total = json["total"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
    _v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["_id"] = _id;
    map["booking"] = _booking;
    map["technician"] = _technician;
    map["technician_name"] = _technicianName;
    map["user_name"] = _userName;
    map["user"] = _user;
    map["call_fee"] = _callFee;
    map["parts_total"] = _partsTotal;
    map["servicing_total"] = _servicingTotal;
    if (_equipment != null) {
      map["equipment"] = _equipment.map((v) => v.toJson()).toList();
    }
    map["total"] = _total;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["__v"] = _v;
    return map;
  }

}

/// _id : "613e14718bd8599ac1619eed"
/// name : "LG AC 1"
/// service : "Air Conditioner"
/// capacity : "5Hp"
/// make : "LG"
/// parts : [{"_id":"613e14718bd8599ac1619eee","name":"Spark Plug","price":300,"service":"Air Conditioner"}]
/// servicing : [{"_id":"613e14718bd8599ac1619eef","name":"Spark Plug","price":300,"service":"Air Conditioner"}]

class Equipment {
  String _id;
  String _name;
  String _service;
  String _capacity;
  String _make;
  List<Parts> _parts;
  List<Servicing> _servicing;

  String get id => _id;
  String get name => _name;
  String get service => _service;
  String get capacity => _capacity;
  String get make => _make;
  List<Parts> get parts => _parts;
  List<Servicing> get servicing => _servicing;

  Equipment({
      String id, 
      String name, 
      String service, 
      String capacity, 
      String make, 
      List<Parts> parts, 
      List<Servicing> servicing}){
    _id = id;
    _name = name;
    _service = service;
    _capacity = capacity;
    _make = make;
    _parts = parts;
    _servicing = servicing;
}

  Equipment.fromJson(dynamic json) {
    _id = json["_id"];
    _name = json["name"];
    _service = json["service"];
    _capacity = json["capacity"];
    _make = json["make"];
    if (json["parts"] != null) {
      _parts = [];
      json["parts"].forEach((v) {
        _parts.add(Parts.fromJson(v));
      });
    }
    if (json["servicing"] != null) {
      _servicing = [];
      json["servicing"].forEach((v) {
        _servicing.add(Servicing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = _id;
    map["name"] = _name;
    map["service"] = _service;
    map["capacity"] = _capacity;
    map["make"] = _make;
    if (_parts != null) {
      map["parts"] = _parts.map((v) => v.toJson()).toList();
    }
    if (_servicing != null) {
      map["servicing"] = _servicing.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "613e14718bd8599ac1619eef"
/// name : "Spark Plug"
/// price : 300
/// service : "Air Conditioner"

class Servicing {
  String _id;
  String _name;
  int _price;
  String _service;

  String get id => _id;
  String get name => _name;
  int get price => _price;
  String get service => _service;

  Servicing({
      String id, 
      String name, 
      int price, 
      String service}){
    _id = id;
    _name = name;
    _price = price;
    _service = service;
}

  Servicing.fromJson(dynamic json) {
    _id = json["_id"];
    _name = json["name"];
    _price = json["price"];
    _service = json["service"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = _id;
    map["name"] = _name;
    map["price"] = _price;
    map["service"] = _service;
    return map;
  }

}

/// _id : "613e14718bd8599ac1619eee"
/// name : "Spark Plug"
/// price : 300
/// service : "Air Conditioner"

class Parts {
  String _id;
  String _name;
  int _price;
  String _service;

  String get id => _id;
  String get name => _name;
  int get price => _price;
  String get service => _service;

  Parts({
      String id, 
      String name, 
      int price, 
      String service}){
    _id = id;
    _name = name;
    _price = price;
    _service = service;
}

  Parts.fromJson(dynamic json) {
    _id = json["_id"];
    _name = json["name"];
    _price = json["price"];
    _service = json["service"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = _id;
    map["name"] = _name;
    map["price"] = _price;
    map["service"] = _service;
    return map;
  }

}