/// bookingId : "60e25e2f04c9b8001597a9f8"
/// serviceFee : 500
/// costOfParts : 0
/// other : 0
/// reason : ""

class BillRequestModel {
  String _bookingId;
  int _serviceFee;
  int _costOfParts;
  int _other;
  String _reason;

  String get bookingId => _bookingId;
  int get serviceFee => _serviceFee;
  int get costOfParts => _costOfParts;
  int get other => _other;
  String get reason => _reason;

  BillRequestModel({
      String bookingId, 
      int serviceFee, 
      int costOfParts, 
      int other, 
      String reason}){
    _bookingId = bookingId;
    _serviceFee = serviceFee;
    _costOfParts = costOfParts;
    _other = other;
    _reason = reason;
}

  BillRequestModel.fromJson(dynamic json) {
    _bookingId = json["bookingId"];
    _serviceFee = json["serviceFee"];
    _costOfParts = json["costOfParts"];
    _other = json["other"];
    _reason = json["reason"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bookingId"] = _bookingId;
    map["serviceFee"] = _serviceFee;
    map["costOfParts"] = _costOfParts;
    map["other"] = _other;
    map["reason"] = _reason;
    return map;
  }

}