import 'package:equatable/equatable.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();
}

class CheckStatus extends GlobalEvent {
  @override
  List<Object> get props => [];

}

class SignIn extends GlobalEvent {
  final String id;
  final String password;

  SignIn(this.id, this.password);
  @override
  List<Object> get props => [id, password];

}

class SignOut extends GlobalEvent {
  @override
  List<Object> get props => [];

}
