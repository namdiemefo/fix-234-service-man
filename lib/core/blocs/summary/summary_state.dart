part of 'summary_bloc.dart';

abstract class SummaryState extends Equatable {
  const SummaryState();
}

class SummaryInitial extends SummaryState {
  @override
  List<Object> get props => [];
}

class OnSummaryLoading extends SummaryState {
  @override
  List<Object> get props => [];
}

class OnSummarySuccess extends SummaryState {
  @override
  List<Object> get props => [];
}

class OnSummaryFailure extends SummaryState {
  final String error;

  OnSummaryFailure(this.error);

  @override
  List<Object> get props => [error];
}
