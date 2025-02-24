import 'dart:convert';

class EquipmentName {
  String name;
  String id;

  EquipmentName({
    required this.name,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'id': id});
  
    return result;
  }

  factory EquipmentName.fromMap(Map<String, dynamic> map) {
    return EquipmentName(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipmentName.fromJson(String source) => EquipmentName.fromMap(json.decode(source));
}
