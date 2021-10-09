import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_man/api/models/parts_service/part_service.dart';
import 'package:service_man/api/repository/bills/bills_repository.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:tuple/tuple.dart';

part 'servicing_event.dart';
part 'servicing_state.dart';

class ServicingBloc extends Bloc<ServicingEvent, ServicingState> {
  ServicingBloc() : super(ServicingInitial());

  final AppStorage _appStorage = locator<AppStorage>();
  final BillsRepository _billsRepository = locator<BillsRepository>();

  @override
  Stream<ServicingState> mapEventToState(ServicingEvent event) async* {
    if (event is FetchServicing) {
      yield* _fetchAllServicing(event.search);
    }
  }

  Stream<ServicingState> _fetchAllServicing(String search) async* {
    print(search);
    yield OnServicingLoading();
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    String token = 'Bearer $bearerToken';
    Tuple2<List<PartService> , String> response = await _billsRepository.getPartsService(token: token, search: search, isParts: false);

    if (response.item1 is List<PartService>) {
      yield OnServicingSuccess(response.item1);
    } else if (response.item2 is String) {
      yield OnServicingFailure(response.item2);
    }
  }
}
