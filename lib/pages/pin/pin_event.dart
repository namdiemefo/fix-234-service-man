part of 'pin_bloc.dart';

abstract class PinEvent extends Equatable {
  const PinEvent();
}

class SubmitPin extends PinEvent {
  final String pin;

  SubmitPin(this.pin);
  @override
  List<Object> get props => [pin];

}
