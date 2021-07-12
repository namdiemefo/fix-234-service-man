import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:service_man/api/services/url.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://fix-234.herokuapp.com/")
abstract class Client {
  factory Client(Dio dio, {String baseUrl}) = _Client;

  // @POST('technician/auth/login')


}