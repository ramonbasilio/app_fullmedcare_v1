import 'package:app_fullmedcare_v1/src/data/model/equipment_stardard.dart';

class DataCertificatePg1 {
  final String medicalEquipment;
  final String model;
  final String manufacturer;
  final String serialNumber;
  final String patrimonial;
  final String location;
  final List<EquipmentStandard> listEquipmentsStandardSeletcted;

  DataCertificatePg1({
    required this.medicalEquipment,
    required this.model,
    required this.manufacturer,
    required this.serialNumber,
    this.patrimonial = "",
    required this.location,
    required this.listEquipmentsStandardSeletcted,
  });
}
