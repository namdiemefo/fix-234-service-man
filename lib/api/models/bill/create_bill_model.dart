/// booking : "613e03fe5badb08d4adfac8a"
/// parts_total : 300
/// servicing_total : 300
/// equipment : [{"name":"LG AC 1","service":"Air Conditioner","capacity":"5Hp","make":"LG","parts":[{"name":"Spark Plug","price":300,"service":"Air Conditioner"}],"servicing":[{"name":"Spark Plug","price":300,"service":"Air Conditioner"}]}]
/// report : "Faulty fan"
/// total : 800

class CreateBillModel {
  String _booking;
  int _partsTotal;
  int _servicingTotal;
  List<Equipment> _equipment;
  String _report;
  int _total;

  String get booking => _booking;
  int get partsTotal => _partsTotal;
  int get servicingTotal => _servicingTotal;
  List<Equipment> get equipment => _equipment;
  String get report => _report;
  int get total => _total;

  CreateBillModel({
      String booking, 
      int partsTotal, 
      int servicingTotal, 
      List<Equipment> equipment, 
      String report, 
      int total}){
    _booking = booking;
    _partsTotal = partsTotal;
    _servicingTotal = servicingTotal;
    _equipment = equipment;
    _report = report;
    _total = total;
}

  CreateBillModel.fromJson(dynamic json) {
    _booking = json["booking"];
    _partsTotal = json["parts_total"];
    _servicingTotal = json["servicing_total"];
    if (json["equipment"] != null) {
      _equipment = [];
      json["equipment"].forEach((v) {
        _equipment.add(Equipment.fromJson(v));
      });
    }
    _report = json["report"];
    _total = json["total"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["booking"] = _booking;
    map["parts_total"] = _partsTotal;
    map["servicing_total"] = _servicingTotal;
    if (_equipment != null) {
      map["equipment"] = _equipment.map((v) => v.toJson()).toList();
    }
    map["report"] = _report;
    map["total"] = _total;
    return map;
  }

}

/// name : "LG AC 1"
/// service : "Air Conditioner"
/// capacity : "5Hp"
/// make : "LG"
/// parts : [{"name":"Spark Plug","price":300,"service":"Air Conditioner"}]
/// servicing : [{"name":"Spark Plug","price":300,"service":"Air Conditioner"}]

class Equipment {
  String _name;
  String _service;
  String _capacity;
  String _make;
  List<Parts> _parts;
  List<Servicing> _servicing;

  String get name => _name;
  String get service => _service;
  String get capacity => _capacity;
  String get make => _make;
  List<Parts> get parts => _parts;
  List<Servicing> get servicing => _servicing;

  set parts(List<Parts> parts) {
    _parts = parts;
  }

  Equipment({
      String name, 
      String service, 
      String capacity, 
      String make, 
      List<Parts> parts, 
      List<Servicing> servicing}){
    _name = name;
    _service = service;
    _capacity = capacity;
    _make = make;
    _parts = parts;
    _servicing = servicing;
}

  Equipment.fromJson(dynamic json) {
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

/// name : "Spark Plug"
/// price : 300
/// service : "Air Conditioner"

class Servicing {
  String _name;
  int _price;
  String _service;

  String get name => _name;
  int get price => _price;
  String get service => _service;

  Servicing({
      String name, 
      int price, 
      String service}){
    _name = name;
    _price = price;
    _service = service;
}

  Servicing.fromJson(dynamic json) {
    _name = json["name"];
    _price = json["price"];
    _service = json["service"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["price"] = _price;
    map["service"] = _service;
    return map;
  }

}

/// name : "Spark Plug"
/// price : 300
/// service : "Air Conditioner"

class Parts {
  String _name;
  int _price;
  String _service;

  String get name => _name;
  int get price => _price;
  String get service => _service;

  Parts({
      String name, 
      int price, 
      String service}){
    _name = name;
    _price = price;
    _service = service;
}

  Parts.fromJson(dynamic json) {
    _name = json["name"];
    _price = json["price"];
    _service = json["service"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["price"] = _price;
    map["service"] = _service;
    return map;
  }

}