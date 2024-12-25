import 'package:app_fullmedcare_v1/src/data/model/equipment_stardard.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/provider/register_equipment_provider.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/edit_equipment_standard_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/list_certificate_equipment_standard_page.dart';
import 'package:app_fullmedcare_v1/src/routes/name_routes.dart';
import 'package:app_fullmedcare_v1/src/widgets/confirmation_boxs/confirmation_box_company.dart';
import 'package:app_fullmedcare_v1/src/widgets/confirmation_boxs/confirmation_box_equipment_standard.dart';
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
    RegisterEquipmentProvider registerEquipmentProvider =
        Provider.of(context, listen: false);
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
              registerEquipmentProvider.registerEquipment(equipmentStandard);
              Get.back();
              Get.off(() => ListCertificateEquipmentStandardPage(
                    equipmentStandard: equipmentStandard,
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Editar Equipamento"),
            onTap: () {
              Get.back();
              Get.toNamed(NameRoutes.editEquipmentStandard,
                  arguments: equipmentStandard);
            },
          ),
          ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("Deletar Equipamento"),
              onTap: () {
                Get.back();
                ConfirmationDeleteEquipmentStandard()
                    .confirmationDeleteEquipmentStandard(
                        context, equipmentStandard);
              }),
        ],
      ),
    );
  }
}
