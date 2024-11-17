import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseCloudFirestore {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> registerCompany(
      {required Company company, required BuildContext context}) async {
    try {
      await _firebaseFirestore
          .collection('User')
          .doc('fullmedcare@gmail.com')
          .collection('Companies')
          .doc(company.id)
          .set(company.toMap());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso!')),
        );
      }
    }on FirebaseException catch (e) {
      if (context.mounted) {
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao salvar. Erro: $e')),
        );
      }
    }
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
