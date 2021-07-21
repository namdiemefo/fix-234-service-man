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
      if (responseModel.code == 200) {
        if (responseModel.data == null) {
          response.data = responseModel;
          handler.next(response);
          return response;
        } else {
          response.data = responseModel;
          handler.next(response);
          return response;
        }
      } else {
        String message;
        message = responseModel.message;
        return new DioError(
            error: message,
            type: DioErrorType.response,
            requestOptions: response.requestOptions,
            response: Response(
                data: message,
                requestOptions: response.requestOptions,
                statusCode: HttpStatus.badRequest,
                statusMessage: BAD_REQUEST_STATUS_MESSAGE
            )
        );
      }
    }
  }

}