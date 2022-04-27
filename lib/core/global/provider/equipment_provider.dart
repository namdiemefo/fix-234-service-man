import 'package:flutter/material.dart';
import 'package:service_man/api/models/bill/create_bill_model.dart';

class EquipmentProvider extends ChangeNotifier {

  List<Equipment> _equipments;

  List<Equipment> get equipments => _equipments ?? [];

  // set equipments(L)

}