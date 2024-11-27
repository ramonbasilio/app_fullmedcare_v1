import 'dart:convert';

class Equipment {
  String type;
  String model;
  String brand;
  String ns;
  String tag;
  String department;
  Equipment({
    required this.type,
    required this.model,
    required this.brand,
    required this.ns,
    required this.tag,
    required this.department,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'type': type});
    result.addAll({'model': model});
    result.addAll({'brand': brand});
    result.addAll({'ns': ns});
    result.addAll({'tag': tag});
    result.addAll({'department': department});
    return result;
  }

  factory Equipment.fromMap(Map<String, dynamic> map) {
    return Equipment(
      type: map['type'] ?? '',
      model: map['model'] ?? '',
      brand: map['brand'] ?? '',
      ns: map['ns'] ?? '',
      tag: map['tag'] ?? '',
      department: map['department'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipment.fromJson(String source) =>
      Equipment.fromMap(json.decode(source));
}
