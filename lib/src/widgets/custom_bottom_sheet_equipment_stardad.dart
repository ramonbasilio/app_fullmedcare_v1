import 'package:app_fullmedcare_v1/src/data/model/equipment_stardard.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/list_certificate_equipment_standard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomBottomSheetEquipmentStardad extends StatelessWidget {
  final EquipmentStandard equipmentStandard;
  const CustomBottomSheetEquipmentStardad(
      {super.key, required this.equipmentStandard});

  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Get.find();
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text("Certificado Rastreabilidade"),
            onTap: () async {
              firebaseProvider
                  .getAllCertificateEquipmentStandard(equipmentStandard.id);
              Get.back();
              Get.to(() => ListCertificateEquipmentStandardPage(
                    equipmentStandard: equipmentStandard,
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Editar Equipamento"),
            onTap: () {
              // Get.back();
              // Get.to(() => EditCompanyPage(
              //       company: company,
              //     ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Deletar Equipamento"),
            onTap: () {
              // Get.back();
              // Confirmationwidget().showConfirmationDialog(context, company);
            },
          ),
        ],
      ),
    );
  }
}
