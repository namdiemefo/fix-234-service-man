part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryInitial extends HistoryState {
  @override
  List<Object> get props => [];
}

class OnHistoryLoading extends HistoryState {
  @override
  List<Object> get props => [];
}

class OnHistorySuccess extends HistoryState {
  final List<GetBookingResponse> getBookingResponse;

  OnHistorySuccess(this.getBookingResponse);

  @override
  List<Object> get props => [];
}

class OnHistoryFailure extends HistoryState {

  final String error;

  OnHistoryFailure(this.error);

  @override
  List<Object> get props => [error];

}
