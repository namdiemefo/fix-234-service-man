import 'package:rxdart/rxdart.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';

class EquipmentService {

  static final EquipmentService _instance = EquipmentService._internal();

  EquipmentService._internal() {}
  static EquipmentService instance = _instance;

  List<Equipment> _equipment = [];
  List<Parts> _parts = [];
  // ignore: close_sinks
  final equipmentSubject = BehaviorSubject<List<Equipment>>();

  List<Equipment> get equipment => _equipment;
  List<Parts> get parts => _parts;


  void addEquipment(Equipment equipment) {
    _equipment.add(equipment);
  }

  void removeEquipment(Equipment equipment) {
    _equipment.remove(equipment);
  }

  void addPart(Parts part) {
    _parts.add(part);
  }

  void removePart(Parts part) {
    _parts.remove(part);
  }


}