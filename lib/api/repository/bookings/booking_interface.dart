import 'package:service_man/api/models/bookings/response/get_booking_response.dart';
import 'package:service_man/api/models/response_model.dart';
import 'package:tuple/tuple.dart';

abstract class BookingInterface {

  Future<Tuple2<List<GetBookingResponse> , String>> getPendingJobs({String token});

  Future<Tuple2<List<GetBookingResponse> , String>> getJobHistory({String token});

  Future<Tuple2<MyResponseModel, String>> updateStatus({String status, String bookingId, String token});

  Future<Tuple2<MyResponseModel, String>> requestForAssistance({int number, String bookingId, String token});

  Future<Tuple2<MyResponseModel, String>> requestReassignment({String reason, String bookingId, String token});

}