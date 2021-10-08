import 'package:service_man/api/models/parts_service/part_service.dart';
import 'package:tuple/tuple.dart';

abstract class BillsInterface {

  Future<Tuple2<List<PartService>, String>> getPartsService({String token, String search, bool isParts});

}