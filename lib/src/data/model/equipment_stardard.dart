import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EquipmentStandard {
  String type;
  String model;
  String brand;
  String sn;
  String tag;
  String id;
  String unit;
  
  EquipmentStandard({
    required this.type,
    required this.model,
    required this.brand,
    required this.sn,
    required this.tag,
    required this.id,
    required this.unit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'model': model,
      'brand': brand,
      'sn': sn,
      'tag':tag,
      'id': id,
      'unit': unit,
    };
  }

  factory EquipmentStandard.fromMap(Map<String, dynamic> map) {
    return EquipmentStandard(
      type: map['type'] as String,
      model: map['model'] as String,
      brand: map['brand'] as String,
      sn: map['sn'] as String,
      tag: map['tag'] as String,
      id: map['id'] as String,
      unit: map['unit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipmentStandard.fromJson(String source) => EquipmentStandard.fromMap(json.decode(source) as Map<String, dynamic>);
}
