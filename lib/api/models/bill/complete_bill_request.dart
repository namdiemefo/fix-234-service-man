/// bookingId : "61618067eede710cc123490d"
/// report : "Everything was done well"

class CompleteBillRequest {
  String _bookingId;
  String _report;

  String get bookingId => _bookingId;
  String get report => _report;

  CompleteBillRequest({
      String bookingId, 
      String report}){
    _bookingId = bookingId;
    _report = report;
}

  CompleteBillRequest.fromJson(dynamic json) {
    _bookingId = json["bookingId"];
    _report = json["report"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bookingId"] = _bookingId;
    map["report"] = _report;
    return map;
  }

}