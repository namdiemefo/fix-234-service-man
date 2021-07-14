part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SubmitForm extends LoginEvent {
  final String staffId;
  final String password;

  SubmitForm(this.staffId, this.password);

  @override
  List<Object> get props => [staffId, password];

}
