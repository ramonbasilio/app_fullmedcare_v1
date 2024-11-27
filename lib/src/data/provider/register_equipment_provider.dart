import 'package:app_fullmedcare_v1/src/data/model/equipment.dart';
import 'package:flutter/material.dart';

class RegisterEquipmentProvider extends ChangeNotifier {
  String _type = '';
  String _model = '';
  String _brand = '';
  String _ns = '';
  String _tag = '';
  String _department = '';

  String get type => _type;
  String get model => _model;
  String get brand => _brand;
  String get ns => _ns;
  String get tag => _tag;
  String get department => _department;

  void registerFields(Equipment equipment) {
    _type = equipment.type;
    _model = equipment.model;
    _brand = equipment.brand;
    _ns = equipment.ns;
    _tag = equipment.tag;
    _department = equipment.department;
    notifyListeners();
  }
}
