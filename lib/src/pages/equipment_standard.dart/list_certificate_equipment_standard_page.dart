import 'package:app_fullmedcare_v1/src/data/model/equipment_stardard.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/provider/points_measur_provider.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/register_certicate_equipment_standard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ListCertificateEquipmentStandardPage extends StatelessWidget {
  EquipmentStandard equipmentStandard;
  ListCertificateEquipmentStandardPage(
      {required this.equipmentStandard, super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Get.find();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Certificados de calibração - Equipamento Padrão'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Obx(
                  () => firebaseProvider.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : firebaseProvider
                              .allCertificateEquipamentStandard.isEmpty
                          ? const Text('Nenhum certificado cadastrado')
                          : ListView.builder(
                              itemCount: firebaseProvider
                                  .allCertificateEquipamentStandard.length,
                              itemBuilder: (context, index) {
                                final certificate = firebaseProvider
                                    .allCertificateEquipamentStandard;
                                return Column(
                                  children: [
                                    ListTile(
                                        onTap: () {
                                          // _showBottomSheet(
                                          //     context,
                                          //     _managerProvider
                                          //         .allServiceOrderCar[index]);
                                        },
                                        title: Text(certificate[index]
                                            .numberCertificate)),
                                    const Divider()
                                  ],
                                );
                              },
                            ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            PointsMeasurProvider pointsMeasurProvider =
                Provider.of<PointsMeasurProvider>(context, listen: false);
            pointsMeasurProvider.clearList();
            Get.to(() => RegisterCerticateEquipmentStandardPage(
                  equipmentStandard: equipmentStandard,
                ));
          },
          child: const Icon(Icons.add),
        ));
  }
}
