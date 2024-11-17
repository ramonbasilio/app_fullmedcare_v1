import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Standarequipment {
  String name;
  String model;
  String brand;
  String sn;
  String id;
  
  Standarequipment({
    required this.name,
    required this.model,
    required this.brand,
    required this.sn,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'model': model,
      'brand': brand,
      'sn': sn,
      'id': id,
    };
  }

  factory Standarequipment.fromMap(Map<String, dynamic> map) {
    return Standarequipment(
      name: map['name'] as String,
      model: map['model'] as String,
      brand: map['brand'] as String,
      sn: map['sn'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Standarequipment.fromJson(String source) => Standarequipment.fromMap(json.decode(source) as Map<String, dynamic>);
}
