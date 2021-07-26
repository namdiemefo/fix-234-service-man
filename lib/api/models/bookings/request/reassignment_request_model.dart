/// bookingId : "60e25e2f04c9b8001597a9f8"
/// reason : "Stuck in huge traffic"

class ReassignmentRequestModel {
  String _bookingId;
  String _reason;

  String get bookingId => _bookingId;
  String get reason => _reason;

  ReassignmentRequestModel({
      String bookingId, 
      String reason}){
    _bookingId = bookingId;
    _reason = reason;
}

  ReassignmentRequestModel.fromJson(dynamic json) {
    _bookingId = json["bookingId"];
    _reason = json["reason"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bookingId"] = _bookingId;
    map["reason"] = _reason;
    return map;
  }

}