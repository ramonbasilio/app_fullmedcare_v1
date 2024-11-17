import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Company {
  String name;
  String cnpj;
  String address;
  String number;
  String complement;
  String district;
  String city;
  String cep;
  String id;
  Company({
    required this.name,
    required this.cnpj,
    required this.address,
    required this.number,
    required this.complement,
    required this.district,
    required this.city,
    required this.cep,
    required this.id,
  });

  Company copyWith({
    String? name,
    String? cnpj,
    String? address,
    String? number,
    String? complement,
    String? district,
    String? city,
    String? cep,
    String? id,
  }) {
    return Company(
      name: name ?? this.name,
      cnpj: cnpj ?? this.cnpj,
      address: address ?? this.address,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      district: district ?? this.district,
      city: city ?? this.city,
      cep: cep ?? this.cep,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cnpj': cnpj,
      'address': address,
      'number': number,
      'complement': complement,
      'district': district,
      'city': city,
      'cep': cep,
      'id': id,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] as String,
      cnpj: map['cnpj'] as String,
      address: map['address'] as String,
      number: map['number'] as String,
      complement: map['complement'] as String,
      district: map['district'] as String,
      city: map['city'] as String,
      cep: map['cep'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);
}
