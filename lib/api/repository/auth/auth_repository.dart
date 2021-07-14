import 'package:dio/dio.dart';
import 'package:service_man/api/middleware/error_interceptor.dart';
import 'package:service_man/api/middleware/response_interceptor.dart';
import 'package:service_man/api/services/client.dart';

class AuthRepository {
  Dio dio;
  Client client;

  AuthRepository() {
    dio = getDio();
    client = new Client(dio);
  }

  Dio getDio() {
    Dio dio = new Dio(
      BaseOptions(
        connectTimeout: 20000,
        receiveTimeout: 20000,
      )
    );
    dio.interceptors.addAll([
      ErrorInterceptor(),
      ResponseInterceptor()
    ]);
    return dio;
  }

}