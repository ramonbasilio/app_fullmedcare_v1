import 'package:app_fullmedcare_v1/src/constants/constants.dart';
import 'package:app_fullmedcare_v1/src/data/model/equipment_name.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:app_fullmedcare_v1/src/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class EquipmentDatabaseRegistrationHomePage extends StatelessWidget {
  const EquipmentDatabaseRegistrationHomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    FirebaseCloudFirestore firebaseCloudFirestore = FirebaseCloudFirestore();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Equipamentos'),
                          leading: BackButton(
          onPressed: () {
            Get.offAndToNamed(NameRoutes.home);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              width: 400,
              child: ElevatedButton(
                
                onPressed: () {
                  Get.toNamed(NameRoutes.listDatabaseStandardEquipment);
                },
                child: const Text('Cadastro de Analisadores'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text('Cadastro de Equipamentos Médicos'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}