import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:service_man/api/middleware/error_interceptor.dart';
import 'package:service_man/api/models/auth/request/login_request_model.dart';
import 'package:service_man/api/models/auth/response/login_response_model.dart';
import 'package:service_man/api/models/response_model.dart';
import 'package:service_man/api/repository/auth/auth_interface.dart';
import 'package:service_man/api/services/client.dart';
import 'package:tuple/tuple.dart';

class AuthRepository extends AuthInterface {
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
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true
      ),
      ErrorInterceptor(),
      ClientServerErrorInterceptor()
    ]);
    return dio;
  }

  @override
  Future<Tuple2<LoginResponseModel, String>> loginTechnician(LoginRequestModel loginRequestModel) async {

    try {
      MyResponseModel myResponseModel = await client.login(loginRequestModel);
      print('my response code is ${myResponseModel.code}');
      if (myResponseModel.code == 200) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(myResponseModel.data);
        return Tuple2(loginResponseModel, null);
      } else {
        return Tuple2(null, myResponseModel.message);
      }

    } on DioError catch (e) {
      return Tuple2(null, e.response.data);
    }

  }



}