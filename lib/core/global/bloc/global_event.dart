import 'package:equatable/equatable.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();
}

class CheckStatus extends GlobalEvent {
  @override
  List<Object> get props => [];

}

class SignIn extends GlobalEvent {
  final String email;
  final String password;

  SignIn(this.email, this.password);
  @override
  List<Object> get props => [email, password];

}

class SignOut extends GlobalEvent {
  @override
  List<Object> get props => [];

}
