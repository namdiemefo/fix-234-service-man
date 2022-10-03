import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:service_man/api/middleware/error_interceptor.dart';
import 'package:service_man/api/models/bookings/request/request_for_assistance_request.dart';
import 'package:service_man/api/models/bookings/response/get_booking_response.dart';

import 'package:service_man/api/models/response_model.dart';
import 'package:service_man/api/services/client.dart';

import 'package:tuple/tuple.dart';

import 'booking_interface.dart';

class BookingRepository extends BookingInterface {
  Dio dio;
  Client client;

  BookingRepository() {
    dio = getDio();
    client = new Client(dio);
  }

  Dio getDio() {
    Dio dio = new Dio(
        BaseOptions(
          connectTimeout: 100000,
          receiveTimeout: 20000,
        )
    );
    dio.interceptors.addAll([
      PrettyDioLogger(
          requestBody: true,
          requestHeader: true
      ),
      ErrorInterceptor(),
      // ClientServerErrorInterceptor()
    ]);
    return dio;
  }
  
  @override
  Future<Tuple2<List<GetBookingResponse> , String>> getPendingJobs({String token}) async {
    
    try {
      MyResponseModel myResponseModel = await client.bookings(token);
      if (myResponseModel.code == 200) {
        List response = myResponseModel.data;
        List<GetBookingResponse> getBookingResponse = List<GetBookingResponse>.unmodifiable(
            response.map((e) => GetBookingResponse.fromJson(e)).toList()
        );
        return Tuple2(getBookingResponse, null);
      } else {
        return Tuple2(null, myResponseModel.message);
      }

    } on DioError catch (e) {
      return Tuple2(null, e.response.data);
    }
    
  }

  @override
  Future<Tuple2<MyResponseModel, String>> requestReassignment({String reason, String bookingId, String token}) async {

    try {
      MyResponseModel myResponseModel = await client.completedBookings(token);
      if (myResponseModel.code == 200) {
        return Tuple2(myResponseModel, null);
      } else {
        return Tuple2(null, myResponseModel.message);
      }

    } on DioError catch (e) {
      return Tuple2(null, e.response.data);
    }

  }

  @override
  Future<Tuple2<MyResponseModel, String>> updateStatus({String status, String bookingId, String token}) async {

    try {
      MyResponseModel myResponseModel = await client.completedBookings(token);
      if (myResponseModel.code == 200) {
        return Tuple2(myResponseModel, null);
      } else {
        return Tuple2(null, myResponseModel.message);
      }

    } on DioError catch (e) {
      return Tuple2(null, e.response.data);
    }

  }

  @override
  Future<Tuple2<List<GetBookingResponse>, String>> getJobHistory({String token}) async {

    try {
      MyResponseModel myResponseModel = await client.completedBookings(token);
      if (myResponseModel.code == 200) {
        List response = myResponseModel.data;
        List<GetBookingResponse> getBookingResponse = List<GetBookingResponse>.unmodifiable(
            response.map((e) => GetBookingResponse.fromJson(e)).toList()
        );
        return Tuple2(getBookingResponse, null);
      } else {
        return Tuple2(null, myResponseModel.message);
      }

    } on DioError catch (e) {
      return Tuple2(null, e.response.data);
    }

  }

  @override
  Future<Tuple2<MyResponseModel, String>> requestForAssistance({int number, String bookingId, String token}) async {

    try {
      RequestForAssistanceRequest requestForAssistanceRequest = RequestForAssistanceRequest(bookingId: bookingId, number: number);
      MyResponseModel myResponseModel = await client.requestForAssistance(token, requestForAssistanceRequest);
      if (myResponseModel.code == 200) {
        return Tuple2(myResponseModel, null);
      } else {
        return Tuple2(null, myResponseModel.message);
      }

    } on DioError catch (e) {
      return Tuple2(null, e.response.data);
    }

  }
  
}