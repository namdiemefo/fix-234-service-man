/// bookingId : "63034e71d8a31cd60df3c2cf"
/// number : 1

class RequestForAssistanceRequest {
  String _bookingId;
  int _number;

  String get bookingId => _bookingId;
  int get number => _number;

  RequestForAssistanceRequest({
      String bookingId, 
      int number}){
    _bookingId = bookingId;
    _number = number;
}

  RequestForAssistanceRequest.fromJson(dynamic json) {
    _bookingId = json["bookingId"];
    _number = json["number"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bookingId"] = _bookingId;
    map["number"] = _number;
    return map;
  }

}