import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:service_man/api/middleware/error_interceptor.dart';
import 'package:service_man/api/models/response_model.dart';
import 'package:service_man/api/repository/profile/profile_interface.dart';
import 'package:service_man/api/services/client.dart';
import 'package:tuple/tuple.dart';

class ProfileRepository extends ProfileInterface {

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
  Future<String> getImage({String token}) {
    // TODO: implement getImage
    throw UnimplementedError();
  }

  @override
  Future<Tuple2<String, String>> uploadImage({String token, File file}) async {
    try {
      MyResponseModel myResponseModel = await client.uploadImage(token, file);
      if (myResponseModel.code == 200) {
        String response = myResponseModel.data;
        return Tuple2(response, null);
      } else {
        return Tuple2(null, myResponseModel.message);
      }

    } on DioError catch (e) {
      return Tuple2(null, e.response.data);
    }
  }

}