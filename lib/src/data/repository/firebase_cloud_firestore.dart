import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudFirestore {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> registerCompany({required Company company}) async {
    await _firebaseFirestore
        .collection('User')
        .doc('fullmedcare@gmail.com')
        .collection('Companies')
        .doc(company.id)
        .set(company.toMap());
  }

  Future<List<Company>> getAllCompanies() async {
    List<Company> listCompanies = [];
    await _firebaseFirestore
        .collection('User')
        .doc('fullmedcare@gmail.com')
        .collection('Companies')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        listCompanies.add(Company.fromMap(docSnapshot.data()));
      }
    });
    return listCompanies;
  }

  
}
