import 'package:app_fullmedcare_v1/src/data/model/certificate_equipment_stantard.dart';
import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/data/model/equipment_stardard.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseProvider extends GetxController {
  var allCompanies = <Company>[].obs;
  var allEquipmentsStandard = <EquipmentStandard>[].obs;
  var allCertificateEquipamentStandard = <CertificateEquipmentStandard>[].obs;
  RxBool isLoading = false.obs; //PRECISO ARRUMAR ISSO

  FirebaseCloudFirestore firebaseCloudFirestore = FirebaseCloudFirestore();

  Future<void> getAllCompanies() async {
    isLoading.value = true;
    List<Company> response = await firebaseCloudFirestore.getAllCompanies();
    if (response.isNotEmpty) {
      response.sort((a, b) => a.name.compareTo(b.name));
      allCompanies.value = response;
    } else {
      allCompanies.value = [];
    }
    isLoading.value = false;
  }

  Future<void> getAllEquipmentsStandard() async {
    isLoading.value = true;
    List<EquipmentStandard> response =
        await firebaseCloudFirestore.getAllEquipmentsStandard();
    if (response.isNotEmpty) {
      response.sort((a, b) => a.type.compareTo(b.type));
      allEquipmentsStandard.value = response;
    } else {
      allEquipmentsStandard.value = [];
    }
    isLoading.value = false;
  }

  Future<void> getAllCertificateEquipmentStandard(String id) async {
    isLoading.value = true;
    List<CertificateEquipmentStandard> response =
        await firebaseCloudFirestore.getAllCertificateEquipmentStandard(id);
    if (response.isNotEmpty) {
      response.sort((a, b) => a.dateExpiration.compareTo(b.dateExpiration));
      allCertificateEquipamentStandard.value = response;
    } else {
      allCertificateEquipamentStandard.value = [];
    }
    isLoading.value = false;
  }
}
