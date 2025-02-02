import 'package:app_fullmedcare_v1/src/data/model/points_measur.dart';
import 'package:flutter/material.dart';

class PointsMeasurProvider extends ChangeNotifier {
  String _unit = '';
  String _point = '';
  String _vvc = '';
  String _uncertainty = '';
  String _k = '';
  List<PointsMeasure> _pointsMeasure = [];

  String get unit => _unit;
  String get point => _point;
  String get vvc => _vvc;
  String get uncertainty => _uncertainty;
  String get k => _k;
  List<PointsMeasure> get pointsMeasure => _pointsMeasure;

  void registerFields(PointsMeasure pointsMeasur) {
    _unit = pointsMeasur.unit;
    _point = pointsMeasur.point;
    _vvc = pointsMeasur.vvc;
    _uncertainty = pointsMeasur.uncertainty;
    _k = pointsMeasur.k;
    _pointsMeasure.add(pointsMeasur);
    notifyListeners();
  }

  void removeItem(int index) {
    _pointsMeasure.removeAt(index);
    notifyListeners();
  }

    void clearList() {
    _pointsMeasure = [];
    notifyListeners();
  }
}
