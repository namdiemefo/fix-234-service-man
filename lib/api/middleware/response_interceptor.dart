import 'dart:io';

import 'package:dio/dio.dart';
import 'package:service_man/api/models/response_model.dart';

class ResponseInterceptor extends Interceptor {
  static const BAD_REQUEST_STATUS_MESSAGE = "BAD REQUEST";

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == HttpStatus.ok) {
      MyResponseModel responseModel = MyResponseModel.fromJson(response.data);
      if (responseModel.code == 200) {
        if (responseModel.data == null) {
          response.data = responseModel.message;
          return response;
        } else {
          response.data = responseModel.message;
          return response;
        }
      } else {
        String message;
        message = responseModel.message;
        return DioError(
          error: message,
          type: DioErrorType.response,
          requestOptions: response.requestOptions
        );
      }
    }
  }

}