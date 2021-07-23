/// status : "Arrived"
/// bookingId : ""

class UpdateStatusRequestModel {
  String _status;
  String _bookingId;

  String get status => _status;
  String get bookingId => _bookingId;

  UpdateStatusRequestModel({
      String status, 
      String bookingId}){
    _status = status;
    _bookingId = bookingId;
}

  UpdateStatusRequestModel.fromJson(dynamic json) {
    _status = json["status"];
    _bookingId = json["bookingId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["bookingId"] = _bookingId;
    return map;
  }

}