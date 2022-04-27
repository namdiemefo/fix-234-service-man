import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';
import 'package:service_man/api/models/bill/create_bill_response.dart';
import 'package:service_man/api/repository/bills/bills_repository.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:tuple/tuple.dart';

part 'preview_event.dart';
part 'preview_state.dart';

class PreviewBloc extends Bloc<PreviewEvent, PreviewState> {
  PreviewBloc() : super(PreviewInitial());

  final AppStorage _appStorage = locator<AppStorage>();
  final BillsRepository _billsRepository = locator<BillsRepository>();

  @override
  Stream<PreviewState> mapEventToState(PreviewEvent event) async* {
    if (event is CreateBill) {
      yield* _createBill(event.createBillModel);
    }
  }

  Stream<PreviewState> _createBill(CreateBillModel createBillModel) async* {
    yield OnCreateBillLoading();
    String bearerToken = await _appStorage.getToken(TokenType.ACCESS);
    String token = 'Bearer $bearerToken';
    Tuple2<CreateBillResponse , String> response = await _billsRepository.createBill(token: token, createBillModel: createBillModel);

    if (response.item1 is CreateBillResponse) {
      yield OnCreateBillSuccess();
    } else if (response.item2 is String) {
      yield OnCreateBillFailure(response.item2);
    }
  }
}
