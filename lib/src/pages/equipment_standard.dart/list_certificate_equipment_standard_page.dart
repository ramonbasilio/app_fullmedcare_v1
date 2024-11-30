import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/register_certicate_equipment_standard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCertificateEquipmentStandardPage extends StatelessWidget {
  const ListCertificateEquipmentStandardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Certificados de calibração - Equipamento Padrão'),
          centerTitle: true,
        ),
        body: const Center(child: Text('NADA POR AQUI AINDA')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(()=>const RegisterCerticateEquipmentStandardPage());
          },
          child: const Icon(Icons.add),
        ));
  }
}
