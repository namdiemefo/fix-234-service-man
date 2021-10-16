part of 'summary_bloc.dart';

abstract class SummaryEvent extends Equatable {
  const SummaryEvent();
}

class SendReport extends SummaryEvent {
  final CompleteBillRequest completeBillRequest;

  SendReport(this.completeBillRequest);

  @override
  List<Object> get props => [completeBillRequest];
}
