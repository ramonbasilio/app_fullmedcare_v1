import 'dart:convert';

import 'package:app_fullmedcare_v1/src/data/model/equipment.dart';
import 'package:app_fullmedcare_v1/src/data/model/equipment_name.dart';

class BiomedicalEquipment {
  String name;
  String id;
  List<EquipmentName> equipments;

  BiomedicalEquipment({
    required this.name,
    required this.id,
    required this.equipments,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'id': id});
    result.addAll({'equipments': equipments.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory BiomedicalEquipment.fromMap(Map<String, dynamic> map) {
    return BiomedicalEquipment(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      equipments: List<EquipmentName>.from(map['equipments']?.map((x) => Equipment.fromMap(x)) ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory BiomedicalEquipment.fromJson(String source) => BiomedicalEquipment.fromMap(json.decode(source));

  @override
  String toString() => 'BiomedicalEquipment(name: $name, id: $id, equipments: $equipments)';
}
