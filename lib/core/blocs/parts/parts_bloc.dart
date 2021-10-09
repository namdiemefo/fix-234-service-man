import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_man/api/models/parts_service/part_service.dart';
import 'package:service_man/api/repository/bills/bills_repository.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:tuple/tuple.dart';

part 'parts_event.dart';
part 'parts_state.dart';

class PartsBloc extends Bloc<PartsEvent, PartsState> {
  PartsBloc() : super(PartsInitial());

  final AppStorage _appStorage = locator<AppStorage>();
  final BillsRepository _billsRepository = locator<BillsRepository>();

  @override
  Stream<PartsState> mapEventToState(PartsEvent event) async* {
    if (event is FetchParts) {
      yield* _fetchAllParts(event.search);
    }
  }

  Stream<PartsState> _fetchAllParts(String search) async* {
    yield OnPartsLoading();
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    String token = 'Bearer $bearerToken';
    Tuple2<List<PartService> , String> response = await _billsRepository.getPartsService(token: token, search: search, isParts: true);

    if (response.item1 is List<PartService>) {
      yield OnPartSuccess(response.item1);
    } else if (response.item2 is String) {
      yield OnPartFailure(response.item2);
    }

  }
}
