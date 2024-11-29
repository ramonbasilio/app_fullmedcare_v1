import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/data/model/standar_equipment.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseProvider extends GetxController {
  var allCompanies = <Company>[].obs;
  var allEquipmentsStandard = <EquipmentStandard>[].obs;
  RxBool isLoading = false.obs;

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
    List<EquipmentStandard> response = await firebaseCloudFirestore.getAllEquipmentsStandard();
    if (response.isNotEmpty) {
      response.sort((a, b) => a.type.compareTo(b.type));
      allEquipmentsStandard.value = response;
    } else {
      allEquipmentsStandard.value = [];
    }
    isLoading.value = false;
  }


}
