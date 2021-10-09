import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_man/api/models/bookings/response/get_booking_response.dart';
import 'package:service_man/api/repository/bookings/booking_repository.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:tuple/tuple.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc() : super(JobsInitial());

  final AppStorage _appStorage = locator<AppStorage>();
  final BookingRepository _jobsRepository = locator<BookingRepository>();

  @override
  Stream<JobsState> mapEventToState(JobsEvent event) async* {
    yield* _fetchPendingJobs();
  }

  Stream<JobsState> _fetchPendingJobs() async* {
    yield OnLoading();
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    String token = 'Bearer $bearerToken';
    Tuple2<List<GetBookingResponse> , String> response = await _jobsRepository.getPendingJobs(token: token);

    if (response.item1 is List<GetBookingResponse>) {
      yield OnSuccess(response.item1);
    } else if (response.item2 is String) {
      yield OnFailure(response.item2);
    }

  }
}
