part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {
  const JobsState();
}

class JobsInitial extends JobsState {
  @override
  List<Object> get props => [];
}

class OnLoading extends JobsState {
  @override
  List<Object> get props => [];
}

class OnSuccess extends JobsState {

  final List<GetBookingResponse> getBookingResponse;

  OnSuccess(this.getBookingResponse);

  @override
  List<Object> get props => [];
}

class OnFailure extends JobsState {

  final String error;

  OnFailure(this.error);

  @override
  List<Object> get props => [];
}
