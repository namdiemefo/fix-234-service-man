import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_man/api/models/bill/complete_bill_request.dart';
import 'package:service_man/api/models/bill/create_bill_response.dart';
import 'package:service_man/api/repository/bills/bills_repository.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:tuple/tuple.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryBloc() : super(SummaryInitial());

  final AppStorage _appStorage = locator<AppStorage>();
  final BillsRepository _billsRepository = locator<BillsRepository>();

  @override
  Stream<SummaryState> mapEventToState(SummaryEvent event) async* {
    if (event is SendReport) {
      yield* _sendReport(event.completeBillRequest);
    }
  }

  Stream<SummaryState> _sendReport(CompleteBillRequest completeBillRequest) async* {
    yield OnSummaryLoading();
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    String token = 'Bearer $bearerToken';
    Tuple2<CreateBillResponse , String> response = await _billsRepository.complete(token: token, completeBillRequest: completeBillRequest);

    if (response.item1 is CreateBillResponse) {
      yield OnSummarySuccess();
    } else if (response.item2 is String) {
      yield OnSummaryFailure(response.item2);
    }
  }
}
