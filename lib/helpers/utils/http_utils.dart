import 'dart:io';

import 'package:dio/dio.dart';

import 'connection_utils.dart';
import 'http_error_strings.dart';

class HttpUtils {
  static Future<DioError> buildErrorResponse(DioError err) async {
    if (err is DioError) {
      switch (err.type) {
        case DioErrorType.response:
          if (err.response == DioErrorType.response) {
            err.response = Response(data: HttpErrorStrings.UNAUTHORIZED);
          } else if (err.response.statusCode == HttpStatus.badRequest) {
            err.response = Response(data: err.response.data);
          } else if (err.error != null) {
            err.response = Response(data: err.response.data);
          }
          // else if (err.response.statusCode == HttpStatus.unauthorized) {
          //   err.response = Response(data: HttpErrorStrings.UNAUTHORIZED);
          // }
          // statusMessage statusCode Gateway Timeout
          else if (err.response.statusCode == HttpStatus.gatewayTimeout) {
            err.response = Response(data: HttpErrorStrings.API_GATEWAY_TIMEOUT);
          } else if (err.response.data == "") {
            err.response = Response(data: HttpErrorStrings.UNAUTHORIZED);
          } else {
            // err.response = Response(data: err.error().toString());
            err.response = Response(data: HttpErrorStrings.UNAUTHORIZED);
          }
          break;
        case DioErrorType.connectTimeout:
          if (await ConnectionUtils.getActiveStatus()) {
            err.response =
                Response(data: HttpErrorStrings.CONNECTION_TIMEOUT_ACTIVE);
          } else {
            err.response =
                Response(data: HttpErrorStrings.CONNECTION_TIMEOUT_NOT_ACTIVE);
          }
          break;
        case DioErrorType.sendTimeout:
          err.response = Response(data: HttpErrorStrings.SEND_TIMEOUT);
          break;
        case DioErrorType.receiveTimeout:
          err.response = Response(data: HttpErrorStrings.RECEIVE_TIMEOUT);
          break;
        case DioErrorType.cancel:
          err.response = Response(data: HttpErrorStrings.OPERATION_CANCELLED);
          break;
        case DioErrorType.other:
          if (!await ConnectionUtils.getActiveStatus()) {
            err.response = Response(data: HttpErrorStrings.DEFAULT);
          } else {
            err.response = Response(data: HttpErrorStrings.SEND_TIMEOUT);
          }
          break;
        default:
          err.response = Response(data: HttpErrorStrings.API_GATEWAY_TIMEOUT);
          break;
      }
    } else {
      err.response = Response(data: err.response.data);
    }
    return err;
  }
}