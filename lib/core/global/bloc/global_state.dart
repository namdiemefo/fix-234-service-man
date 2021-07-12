part of 'global_bloc.dart';

abstract class GlobalState extends Equatable {
  const GlobalState();
}

class GlobalInitial extends GlobalState {
  @override
  List<Object> get props => [];
}

class SignedIn extends GlobalState {
  @override
  List<Object> get props => [];

}

class NotSignedIn extends GlobalState {
  @override
  List<Object> get props => [];
}
