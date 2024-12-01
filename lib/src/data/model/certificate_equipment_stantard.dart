// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_fullmedcare_v1/src/data/model/points_measur.dart';

class CertificateEquipmentStandard {
  String issuer;
  String numberCertificate;
  String dateOfIssue;
  String dateExpiration;
  List<PointsMeasure> listPointMeasure;
  String id;
  CertificateEquipmentStandard({
    required this.issuer,
    required this.numberCertificate,
    required this.dateOfIssue,
    required this.dateExpiration,
    required this.listPointMeasure,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'issuer': issuer,
      'numberCertificate': numberCertificate,
      'dateOfIssue': dateOfIssue,
      'dateExpiration': dateExpiration,
      'listPointMeasure': listPointMeasure.map((x) => x.toMap()).toList(),
      'id': id,
    };
  }

  factory CertificateEquipmentStandard.fromMap(Map<String, dynamic> map) {
    return CertificateEquipmentStandard(
      issuer: map['issuer'] as String,
      numberCertificate: map['numberCertificate'] as String,
      dateOfIssue: map['dateOfIssue'] as String,
      dateExpiration: map['dateExpiration'] as String,
      listPointMeasure: (map['listPointMeasure'] as List)
          .map((pointMap) =>
              PointsMeasure.fromMap(pointMap as Map<String, dynamic>))
          .toList(),
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CertificateEquipmentStandard.fromJson(String source) =>
      CertificateEquipmentStandard.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

    //  listPointMeasure: List<PointsMeasure>.from(
    //     (map['listPointMeasure']),