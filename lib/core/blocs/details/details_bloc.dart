import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_man/api/models/bookings/request/request_for_assistance_request.dart';
import 'package:service_man/api/models/response_model.dart';
import 'package:service_man/api/repository/bookings/booking_repository.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:tuple/tuple.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {

  final AppStorage _appStorage = locator<AppStorage>();
  final BookingRepository _jobsRepository = locator<BookingRepository>();

  DetailsBloc() : super(DetailsInitial());

  @override
  Stream<DetailsState> mapEventToState(DetailsEvent event) async* {
    if (event is SendRequestEvent) {
      yield* _sendRequest(event.number, event.bookingId);
    }
  }

  Stream<DetailsState> _sendRequest(int number, String bookingId) async* {
    yield OnDetailsLoading();
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    String token = 'Bearer $bearerToken';
    Tuple2<MyResponseModel, String> response = await _jobsRepository.requestForAssistance(number: number, bookingId: bookingId, token: token);

    if (response.item1 is MyResponseModel) {
      yield OnDetailsSuccess(response.item1.message);
    } else if (response.item2 is String) {
      yield OnDetailsFailure(response.item2);
    }
  }


}
