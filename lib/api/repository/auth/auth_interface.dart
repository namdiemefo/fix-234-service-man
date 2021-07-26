import 'package:service_man/api/models/auth/request/change_password_request_model.dart';
import 'package:service_man/api/models/auth/request/forgot_password_request_model.dart';
import 'package:service_man/api/models/auth/request/login_request_model.dart';
import 'package:service_man/api/models/auth/request/verify_otp_request_model.dart';
import 'package:service_man/api/models/auth/response/login_response_model.dart';
import 'package:tuple/tuple.dart';

abstract class AuthInterface {

  Future<Tuple2<LoginResponseModel, String>> loginTechnician(LoginRequestModel loginRequestModel);

  // Future<Tuple2<LoginResponseModel, String>> forgotPassword(ForgotPasswordRequestModel forgotPasswordRequestModel);
  //
  // Future<Tuple2<LoginResponseModel, String>> changePassword(ChangePasswordRequestModel changePasswordRequestModel);
  //
  // Future<Tuple2<LoginResponseModel, String>> verifyOtp(VerifyOtpRequestModel verifyOtpRequestModel);

}