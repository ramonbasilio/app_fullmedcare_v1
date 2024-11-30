// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:app_fullmedcare_v1/src/data/model/company.dart';

class Certificate {
  Company entreprise;
  List<Map<String, dynamic>> readingList;
  String technician;
  DateTime dateTime;
  String id;
  String temp;
  String humidity;

  Certificate({
    required this.entreprise,
    required this.readingList,
    required this.technician,
    required this.dateTime,
    required this.id,
    required this.temp,
    required this.humidity,
  });

  Certificate copyWith({
    Company? entreprise,
    List<Map<String, dynamic>>? readingList,
    String? technician,
    DateTime? dateTime,
    String? id,
    String? temp,
    String? humidity,
  }) {
    return Certificate(
      entreprise: entreprise ?? this.entreprise,
      readingList: readingList ?? this.readingList,
      technician: technician ?? this.technician,
      dateTime: dateTime ?? this.dateTime,
      id: id ?? this.id,
      temp: temp ?? this.temp,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'entreprise': entreprise.toMap(),
      'readingList': readingList,
      'technician': technician,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'id': id,
      'temp': temp,
      'humidity': humidity,
    };
  }

  factory Certificate.fromMap(Map<String, dynamic> map) {
    return Certificate(
      entreprise: Company.fromMap(map['entreprise'] as Map<String, dynamic>),
      readingList: List<Map<String, dynamic>>.from((map['readingList'])),
      technician: map['technician'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      id: map['id'] as String,
      temp: map['temp'] as String,
      humidity: map['humidity'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Certificate.fromJson(String source) =>
      Certificate.fromMap(json.decode(source) as Map<String, dynamic>);
}
