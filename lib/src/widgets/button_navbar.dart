import 'package:app_fullmedcare_v1/src/data/model/certificate_equipment_stantard.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/provider/points_measur_provider.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ButtonNavBar extends StatelessWidget {
  String equipmentStardadId;
  GlobalKey<FormState> formKey1;
  List<TextEditingController> listController;

  ButtonNavBar({
    super.key,
    required this.equipmentStardadId,
    required this.formKey1,
    required this.listController,
  });

  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Get.find();
    PointsMeasurProvider pointsMeasurProvider =
        Provider.of<PointsMeasurProvider>(context, listen: false);

    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 250,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () async {
                  if (formKey1.currentState!.validate()) {
                    CertificateEquipmentStandard certificateEquipmentStandard =
                        CertificateEquipmentStandard(
                            issuer: listController[0].text,
                            numberCertificate: listController[1].text,
                            dateOfIssue: listController[2].text,
                            dateExpiration: listController[3].text,
                            listPointMeasure:
                                pointsMeasurProvider.pointsMeasure,
                            id: const Uuid().v4());

                    FirebaseCloudFirestore()
                        .registerCertificateEquipmentStandard(
                            certificateEquipmentStandard:
                                certificateEquipmentStandard,
                            equipmentStardadId: equipmentStardadId,
                            context: context);
                    firebaseProvider
                        .getAllCertificateEquipmentStandard(equipmentStardadId);
                    Get.back();
                  }
                },
                child: const Text(
                  'Salvar',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
        ],
      ),
    );
  }
}
