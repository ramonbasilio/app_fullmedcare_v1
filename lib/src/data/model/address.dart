// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String cidade;
  String uf;
  String estado;
  
  Address({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.cidade,
    required this.uf,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': cidade,
      'uf': uf,
      'estado': estado,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      bairro: map['bairro'] as String,
      cidade: map['localidade'] as String,
      uf: map['uf'] as String,
      estado: map['estado'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, cidade: $cidade, uf: $uf, estado: $estado)';
  }
}
