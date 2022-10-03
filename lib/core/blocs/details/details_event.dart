part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class SendRequestEvent extends DetailsEvent {

  final String bookingId;
  final int number;

  SendRequestEvent(this.bookingId, this.number);

  @override
  List<Object> get props => [bookingId, number];

}
