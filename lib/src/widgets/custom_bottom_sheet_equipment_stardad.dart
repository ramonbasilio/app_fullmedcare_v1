import 'package:app_fullmedcare_v1/src/data/model/standar_equipment.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/list_certificate_equipment_standard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomBottomSheetEquipmentStardad extends StatelessWidget {
  final EquipmentStandard equipmentStandard;
  const CustomBottomSheetEquipmentStardad({super.key, required this.equipmentStandard});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text("Inserir Certificado Rastreabilidade"),
            onTap: () {
              Get.back();
              Get.to(()=>const ListCertificateEquipmentStandardPage());
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
