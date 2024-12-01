// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PointsMeasure {
  String unit;
  String point;
  String vvc;
  String uncertainty;
  String k;

  PointsMeasure({
    required this.unit,
    required this.point,
    required this.vvc,
    required this.uncertainty,
    required this.k,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'unit': unit,
      'point': point,
      'vvc': vvc,
      'uncertainty': uncertainty,
      'k': k,
    };
  }

  factory PointsMeasure.fromMap(Map<String, dynamic> map) {
    return PointsMeasure(
      unit: map['unit'] as String,
      point: map['point'] as String,
      vvc: map['vvc'] as String,
      uncertainty: map['uncertainty'] as String,
      k: map['k'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PointsMeasure.fromJson(String source) => PointsMeasure.fromMap(json.decode(source) as Map<String, dynamic>);
}
