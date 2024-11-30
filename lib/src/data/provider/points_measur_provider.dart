import 'package:app_fullmedcare_v1/src/data/model/points_measur.dart';
import 'package:flutter/material.dart';

class PointsMeasurProvider extends ChangeNotifier{
  String _unit = '';
  String _point = '';
  String _vvc = '';
  String _uncertainty = '';
  String _k = '';
  List<PointsMeasur> _pointsMeasur = [];

  String get unit => _unit;
  String get point => _point;
  String get vvc => _vvc;
  String get uncertainty => _uncertainty;
  String get k => _k;
  List<PointsMeasur> get pointsMeasur => _pointsMeasur;

  void registerFields(PointsMeasur pointsMeasur){
    // _unit = pointsMeasur.unit;
    // _point = pointsMeasur.point;
    // _vvc = pointsMeasur.vvc;
    // _uncertainty = pointsMeasur.uncertainty;
    // _k = pointsMeasur.k;
    _pointsMeasur.add(pointsMeasur);
    notifyListeners();
  }
  
}
