import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/pages/company/edit_company_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment/register_equipment_page.dart';
import 'package:app_fullmedcare_v1/src/widgets/confirmation_boxs/confirmation_box_company.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheetCompany extends StatelessWidget {
  final Company company;
  const CustomBottomSheetCompany({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text("Gerar Certificado"),
            onTap: () {
              Get.back();
              // Get.to(()=>RegisterEquipmentPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Editar"),
            onTap: () {
              Get.back();
              Get.to(() => EditCompanyPage(
                    company: company,
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Deletar"),
            onTap: () {
              Get.back();
              ConfirmationDeleteCompany().confirmationDeleteCompany(context, company);
            },
          ),
        ],
      ),
    );
  }
}
