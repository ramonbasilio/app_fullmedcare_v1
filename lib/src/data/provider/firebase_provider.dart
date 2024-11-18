import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseProvider extends GetxController {
  var allCompanies = <Company>[].obs;
  RxBool isLoading = false.obs;

  FirebaseCloudFirestore firebaseCloudFirestore = FirebaseCloudFirestore();

  Future<void> getAllCompanies() async {
    isLoading.value = true;
    List<Company> response = await firebaseCloudFirestore.getAllCompanies();
    if (response.isNotEmpty) {
      allCompanies.value = response;
    }
    isLoading.value = false;
  }
}
