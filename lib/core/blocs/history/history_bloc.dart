import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_man/api/models/bookings/response/get_booking_response.dart';
import 'package:service_man/api/repository/bookings/booking_repository.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:tuple/tuple.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial());

  final AppStorage _appStorage = locator<AppStorage>();
  final BookingRepository _jobsRepository = locator<BookingRepository>();

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is FetchHistory) {
      yield* _fetchHistory();
    }
  }

  Stream<HistoryState> _fetchHistory() async* {
    yield OnHistoryLoading();
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    String token = 'Bearer $bearerToken';
    Tuple2<List<GetBookingResponse> , String> response = await _jobsRepository.getJobHistory(token: token);

    if (response.item1 is List<GetBookingResponse>) {
      yield OnHistorySuccess(response.item1);
    } else if (response.item2 is String) {
      yield OnHistoryFailure(response.item2);
    }
  }
}
