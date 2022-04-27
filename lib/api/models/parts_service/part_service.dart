/// _id : "615d7acf286ce30016d7696d"
/// name : "Oil Filter for 1000hsp Panasonic Air Coditioner"
/// price : 5000
/// service : "Generator"
/// createdAt : "2021-10-06T10:30:39.422Z"
/// updatedAt : "2021-10-06T10:31:02.520Z"
/// __v : 0

class PartService {
  String _id;
  String _name;
  int _price;
  String _service;
  String _createdAt;
  String _updatedAt;
  int _v;

  String get id => _id;
  String get name => _name;
  int get price => _price;
  String get service => _service;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get v => _v;

  PartService({
      String id, 
      String name, 
      int price, 
      String service, 
      String createdAt, 
      String updatedAt, 
      int v}){
    _id = id;
    _name = name;
    _price = price;
    _service = service;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  PartService.fromJson(dynamic json) {
    _id = json["_id"];
    _name = json["name"];
    _price = json["price"];
    _service = json["service"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
    _v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = _id;
    map["name"] = _name;
    map["price"] = _price;
    map["service"] = _service;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["__v"] = _v;
    return map;
  }

}