part of 'pin_bloc.dart';

abstract class PinState extends Equatable {
  const PinState();
}

class PinInitial extends PinState {
  @override
  List<Object> get props => [];
}

class PinLoading extends PinState {
  @override
  List<Object> get props => [];
}

class PinFailure extends PinState {
  final String error;

  PinFailure(this.error);
  @override
  List<Object> get props => [error];
}

class PinSuccess extends PinState {
  @override
  List<Object> get props => [];
}
