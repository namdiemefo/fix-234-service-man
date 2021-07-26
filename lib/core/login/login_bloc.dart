import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_man/api/models/auth/request/login_request_model.dart';
import 'package:service_man/api/models/auth/response/login_response_model.dart';
import 'package:service_man/api/repository/auth/auth_repository.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:tuple/tuple.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  final AppStorage _appStorage = locator<AppStorage>();
  final AuthRepository _authRepository = locator<AuthRepository>();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SubmitForm) {
      yield* _submitForm(event.staffId, event.password);
    }
  }

  Stream<LoginState> _submitForm(String staffId, String password) async* {
    yield OnLoading();
    LoginRequestModel loginRequestModel = LoginRequestModel(staffId: staffId, password: password);
    Tuple2<LoginResponseModel, String> response = await _authRepository.loginTechnician(loginRequestModel);


    if (response.item1 is LoginResponseModel) {
      await _appStorage.persistToken({TokenType.ACCESS: response.item1.token});
      await _appStorage.persistUser(response.item1);
      yield OnSuccess();
    } else if (response.item2 is String) {
      yield OnFailure(response.item2);
    }
  }
}
