import 'dart:io';

import 'package:dio/dio.dart';
import 'package:service_man/api/models/response_model.dart';

class ResponseInterceptor extends Interceptor {
  static const BAD_REQUEST_STATUS_MESSAGE = "BAD REQUEST";

  // RETURNS MY RESPONSE MODEL
  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == HttpStatus.ok) {
      print('data is ' + response.data.toString());
      print('data is ' + response.toString());
      MyResponseModel responseModel = MyResponseModel.fromJson(response.data);
      response.data = responseModel;
    }
    handler.next(response);
    return response;
  }

}
