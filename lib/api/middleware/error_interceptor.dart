import 'dart:io';

import 'package:dio/dio.dart';
import 'package:service_man/api/models/response_model.dart';
import 'package:service_man/helpers/utils/connection_utils.dart';
import 'package:service_man/helpers/utils/http_error_strings.dart';

class ErrorInterceptor extends Interceptor {

  // RETURNS A STRING
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print('error is ${err.message}');
    print('error type is ${err.type}');
    String errorMessage;
    switch (err.type) {
      case DioErrorType.connectTimeout:
        errorMessage = HttpErrorStrings.CONNECTION_TIMEOUT_ACTIVE;
        break;
      case DioErrorType.sendTimeout:
        errorMessage = HttpErrorStrings.SEND_TIMEOUT;
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = HttpErrorStrings.RECEIVE_TIMEOUT;
        break;
      case DioErrorType.response:
        errorMessage = HttpErrorStrings.BAD_RESPONSE;
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        errorMessage = HttpErrorStrings.BAD_RESPONSE;
        if (err.response == null) {
          err.response = Response(
              requestOptions: RequestOptions(
                path: ''
              ),
              data: errorMessage
          );
          handler.next(err);
          return err;
        }
        if (DioErrorType.other == DioErrorType.other) {
          errorMessage = HttpErrorStrings.DEFAULT;
        } else if (!await ConnectionUtils.getActiveStatus()) {
          errorMessage = HttpErrorStrings.DEFAULT;
        } else if (err.response.data == null) {
          errorMessage = HttpErrorStrings.DEFAULT;
        } else {
          errorMessage = HttpErrorStrings.SEND_TIMEOUT;
        }
        break;
    }

    if (err.response != null) {
       err.response.data = errorMessage;
    }

    handler.next(err);
    return err;

  }
}

///
/// This is also a similar implementation as [ResponseInterceptor], unlike before
/// in [ErrorInterceptor] I'll return a MyResponseModel with a message in it.
///


class ClientServerErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    String errorMessage;
    switch (err.type) {
      case DioErrorType.response:
        if (err.response.data == "") {
          errorMessage = HttpErrorStrings.UNAUTHORIZED;
        } else if (err.response.data != null) {
          errorMessage = err.response.data.toString();
        } else if (err.response.statusCode == HttpStatus.badRequest) {
          errorMessage = err.response.data.toString();
        } else if (err.error != null) {
          errorMessage = err.error;
        } else if (err.response.statusCode == HttpStatus.unauthorized) {
          errorMessage = HttpErrorStrings.UNAUTHORIZED;
        } else {
          errorMessage = err.response.data.toString();
        }
        break;
      case DioErrorType.connectTimeout:
        if (err == DioErrorType.connectTimeout) {
          errorMessage = HttpErrorStrings.CONNECTION_TIMEOUT_NOT_ACTIVE;
          // } else if (await ConnectionUtils.getActiveStatus()) {
        } else if (!await ConnectionUtils.getActiveStatus()) {
          errorMessage = HttpErrorStrings.CONNECTION_TIMEOUT_ACTIVE;
        } else {
          errorMessage = HttpErrorStrings.CONNECTION_TIMEOUT_NOT_ACTIVE;
        }
        break;

      case DioErrorType.sendTimeout:
        errorMessage = HttpErrorStrings.SEND_TIMEOUT;
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = HttpErrorStrings.RECEIVE_TIMEOUT;
        break;
      case DioErrorType.cancel:
        errorMessage = HttpErrorStrings.OPERATION_CANCELLED;
        break;
      case DioErrorType.other:
        if (err.response == null) {
          err.response.data = MyResponseModel(
              status: 'Failed',
              code: 400,
              message: 'Error from server'
              );
          handler.next(err);
          return err;
        }
        if (DioErrorType.other == DioErrorType.other) {
          errorMessage = HttpErrorStrings.DEFAULT;
        } else if (!await ConnectionUtils.getActiveStatus()) {
          errorMessage = HttpErrorStrings.DEFAULT;
        } else {
          errorMessage = HttpErrorStrings.SEND_TIMEOUT;
        }
        break;
      default:
        errorMessage = err.error.toString();
        break;
    }

    err.response.data = MyResponseModel(
      status: 'Failed',
      code: 400,
      message: errorMessage,
    );
    handler.next(err);
    return err;
  }
}

