import 'package:service_man/api/models/bill/complete_bill_request.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';
import 'package:service_man/api/models/bill/create_bill_response.dart';
import 'package:service_man/api/models/parts_service/part_service.dart';
import 'package:tuple/tuple.dart';

abstract class BillsInterface {

  Future<Tuple2<List<PartService>, String>> getPartsService({String token, String search, bool isParts});

  Future<Tuple2<CreateBillResponse, String>> createBill({String token, CreateBillModel createBillModel});

  Future<Tuple2<CreateBillResponse, String>> complete({String token, CompleteBillRequest completeBillRequest});

}