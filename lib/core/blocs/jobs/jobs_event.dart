part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();
}

class FetchPendingJobs extends JobsEvent {
  @override
  List<Object> get props => [];
}
