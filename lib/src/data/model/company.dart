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
  String state;
  String cep;
  String id;
  String date;
  Company(
      {required this.name,
      required this.cnpj,
      required this.address,
      required this.number,
      required this.complement,
      required this.district,
      required this.city,
      required this.state,
      required this.cep,
      required this.id,
      required this.date});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cnpj': cnpj,
      'address': address,
      'number': number,
      'complement': complement,
      'district': district,
      'city': city,
      'state': state,
      'cep': cep,
      'id': id,
      'date': date
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
      state: map['state'] as String,
      cep: map['cep'] as String,
      id: map['id'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Company(name: $name, cnpj: $cnpj, address: $address, number: $number, complement: $complement, district: $district, city: $city, state: $state, cep: $cep, id: $id, date: $date)';
  }
}
