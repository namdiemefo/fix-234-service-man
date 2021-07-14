import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/retrofit.dart';
import 'package:service_man/api/models/auth/change_password_response_model.dart';
import 'package:service_man/api/models/auth/forgot_password_response_model.dart';
import 'package:service_man/api/models/auth/login_response.dart';
import 'package:service_man/api/models/auth/login_response_model.dart';
import 'package:service_man/api/models/auth/verify_otp_response_model.dart';
import 'package:service_man/api/models/bill/bill_request_model.dart';
import 'package:service_man/api/models/bookings/reassignment_request_model.dart';
import 'package:service_man/api/models/bookings/update_status_request_model.dart';
import 'package:service_man/api/models/response_model.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://fix-234.herokuapp.com/")
abstract class Client {
  factory Client(Dio dio, {String baseUrl}) = _Client;

  //AUTH
  @POST('technician/auth/login')
  Future<MyResponseModel> login(LoginResponseModel loginResponseModel);

  @POST('technician/auth/forgot')
  Future<MyResponseModel> forgot(ForgotPasswordResponseModel forgotPasswordResponseModel);

  @POST('technician/auth/change')
  Future<MyResponseModel> change(@Header('Authorization') String token, ChangePasswordResponseModel changePasswordResponseModel);

  @POST('technician/auth/verify')
  Future<MyResponseModel> verify(@Header('Authorization') String token, VerifyOtpResponseModel verifyOtpResponseModel);

  // PROFILE
  @POST('technician/auth/upload')
  @MultiPart()
  Future<MyResponseModel> uploadImage(@Header('Authorization') String token,  @Part(fileName: 'image', contentType: 'image/png') File image);

  @POST('technician/auth/image')
  Future<MyResponseModel> image(@Header('Authorization') String token);

  //BOOKING
  @GET('technician/booking/')
  Future<MyResponseModel> bookings(@Header('Authorization') String token);

  @PUT('technician/booking/status')
  Future<MyResponseModel> status(@Header('Authorization') String token, UpdateStatusRequestModel updateStatusRequestModel);

  @PUT('technician/booking/request')
  Future<MyResponseModel> request(@Header('Authorization') String token, ReassignmentRequestModel reassignmentRequestModel);

  //BILL
  @POST('technician/booking/bill')
  Future<MyResponseModel> createBill(@Header('Authorization') String token, BillRequestModel billRequestModel);

  @GET('technician/booking/bills')
  Future<MyResponseModel> bills(@Header('Authorization') String token);

  // @GET('technician/booking/bill/:id')
  // Future<MyResponseModel> oneBill(@Header('Authorization') String token, @Path());





}