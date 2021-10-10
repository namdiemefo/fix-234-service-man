import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:service_man/api/middleware/error_interceptor.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';
import 'package:service_man/api/models/bill/create_bill_response.dart';
import 'package:service_man/api/models/parts_service/part_service.dart';
import 'package:service_man/api/models/response_model.dart';
import 'package:service_man/api/services/client.dart';
import 'package:tuple/tuple.dart';

import 'bills_interface.dart';

class BillsRepository extends BillsInterface {
  Dio dio;
  Client client;

  BillsRepository() {
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
  Future<Tuple2<List<PartService>, String>> getPartsService({String token, String search, bool isParts}) async {

    if (isParts) {
      try {

        MyResponseModel myResponseModel = await client.parts(token, search);
        if (myResponseModel.code == 200) {
          List response = myResponseModel.data;
          List<PartService> parts = List<PartService>.unmodifiable(
              response.map((e) => PartService.fromJson(e)).toList()
          );
          return Tuple2(parts, null);
        } else {
          return Tuple2(null, myResponseModel.message);
        }

      } on DioError catch (e) {
        return Tuple2(null, e.response.data);
      }
    } else {

      try {

        MyResponseModel myResponseModel = await client.servicing(token, search);
        if (myResponseModel.code == 200) {
          List response = myResponseModel.data;
          List<PartService> parts = List<PartService>.unmodifiable(
              response.map((e) => PartService.fromJson(e)).toList()
          );
          return Tuple2(parts, null);
        } else {
          return Tuple2(null, myResponseModel.message);
        }

      } on DioError catch (e) {
        return Tuple2(null, e.response.data);
      }

    }

  }

  @override
  Future<Tuple2<CreateBillResponse, String>> createBill({String token, CreateBillModel createBillModel}) async {

    try {

      MyResponseModel myResponseModel = await client.createBill(token, createBillModel);
      if (myResponseModel.code == 200) {
        CreateBillResponse response = myResponseModel.data;
        return Tuple2(response, null);
      } else {
        return Tuple2(null, myResponseModel.message);
      }

    } on DioError catch (e) {
      return Tuple2(null, e.response.data);
    }

  }

}