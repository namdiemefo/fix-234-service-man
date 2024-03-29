import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/retrofit.dart';
import 'package:service_man/api/models/auth/request/change_password_request_model.dart';
import 'package:service_man/api/models/auth/request/forgot_password_request_model.dart';
import 'package:service_man/api/models/auth/request/login_request_model.dart';
import 'package:service_man/api/models/auth/request/verify_otp_request_model.dart';
import 'package:service_man/api/models/bill/complete_bill_request.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';
import 'package:service_man/api/models/bookings/request/reassignment_request_model.dart';
import 'package:service_man/api/models/bookings/request/request_for_assistance_request.dart';
import 'package:service_man/api/models/bookings/request/update_status_request_model.dart';
import 'package:service_man/api/models/fcm/token_model.dart';
import 'package:service_man/api/models/response_model.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://fix234.herokuapp.com/")
abstract class Client {
  factory Client(Dio dio, {String baseUrl}) = _Client;

  //AUTH
  @POST('technician/auth/token')
  Future token(@Header('Authorization') String token, @Body() TokenModel tokenModel);

  @POST('technician/auth/login')
  Future<MyResponseModel> login(@Body() LoginRequestModel loginRequestModel);

  @POST('technician/auth/forgot')
  Future<MyResponseModel> forgot(@Body() ForgotPasswordRequestModel forgotPasswordRequestModel);

  @POST('technician/auth/change')
  Future<MyResponseModel> change(@Header('Authorization') String token, @Body() ChangePasswordRequestModel changePasswordRequestModel);

  @POST('technician/auth/verify')
  Future<MyResponseModel> verify(@Header('Authorization') String token, @Body() VerifyOtpRequestModel verifyOtpRequestModel);

  // PROFILE
  @POST('technician/auth/upload')
  @MultiPart()
  Future<MyResponseModel> uploadImage(@Header('Authorization') String token,  @Part(fileName: 'image', contentType: 'image/png') File image);

  @POST('technician/auth/image')
  Future<MyResponseModel> image(@Header('Authorization') String token);

  //BOOKING
  @GET('technician/booking/')
  Future<MyResponseModel> bookings(@Header('Authorization') String token);

  @GET('technician/booking/completed')
  Future<MyResponseModel> completedBookings(@Header('Authorization') String token);

  @PUT('technician/booking/status')
  Future<MyResponseModel> status(@Header('Authorization') String token, @Body() UpdateStatusRequestModel updateStatusRequestModel);

  @PUT('technician/booking/request')
  Future<MyResponseModel> request(@Header('Authorization') String token, @Body() ReassignmentRequestModel reassignmentRequestModel);

  @PUT('technician/booking/assistant-request')
  Future<MyResponseModel> requestForAssistance(@Header('Authorization') String token, @Body() RequestForAssistanceRequest requestForAssistanceRequest);

  //BILL
  @POST('technician/booking/bill')
  Future<MyResponseModel> createBill(@Header('Authorization') String token, @Body() CreateBillModel createBillModel);

  @GET('technician/booking/bills')
  Future<MyResponseModel> bills(@Header('Authorization') String token);

  @POST('technician/booking/complete')
  Future<MyResponseModel> complete(@Header('Authorization') String token, @Body() CompleteBillRequest completeBillRequest);

  @GET('technician/booking/parts')
  Future<MyResponseModel> parts(@Header('Authorization') String token, @Query("name") String search);

  @GET('technician/booking/servicing')
  Future<MyResponseModel> servicing(@Header('Authorization') String token, @Query("name") String search);

  // @GET('technician/booking/bill/:id')
  // Future<MyResponseModel> oneBill(@Header('Authorization') String token, @Path());

  // PARTS & SERVICE
  // @GET('')





}