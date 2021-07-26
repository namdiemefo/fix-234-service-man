import 'dart:io';

import 'package:dio/dio.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';

enum RequestType { Token, None }

class RequestInterceptor extends Interceptor {
  final RequestType requestType;
  final AppStorage _appStorage = locator<AppStorage>();

  RequestInterceptor([this.requestType = RequestType.Token])
      : assert(requestType != null);

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    if (requestType == RequestType.Token) {
      options.headers.addAll({HttpHeaders.authorizationHeader: bearerToken});
    }
    return options;
  }

}