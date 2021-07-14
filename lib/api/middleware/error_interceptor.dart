import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {

    switch (err.type) {
      case DioErrorType.connectTimeout:
        return 'Connection Timed out';
        break;
      case DioErrorType.sendTimeout:
        return 'Network Timed out';
        break;
      case DioErrorType.receiveTimeout:
        return 'Server Timed out';
        break;
      case DioErrorType.response:
        return 'Error from server';
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        return 'Failed to connect to the internet';
        break;
    }

  }
}