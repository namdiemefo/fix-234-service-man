import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SubmitForm) {
      yield* _submitForm(event.staffId, event.password);
    }
  }

  Stream<LoginState> _submitForm(String staffId, String password) async* {

  }
}
