part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class OnSuccess extends LoginState {
  @override
  List<Object> get props => [];

}

class OnFailure extends LoginState {
  final String error;

  OnFailure(this.error);
  @override
  List<Object> get props => [error];

}
