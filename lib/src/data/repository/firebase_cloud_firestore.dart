import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseCloudFirestore {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> registerCompany(
      {required Company company, required BuildContext context}) async {
    bool checkingCNPJ = await checkCNPJ(company.cnpj, context);
    if (!checkingCNPJ) {
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
        Get.back();
      } on FirebaseException catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Falha ao salvar. Erro: $e')),
          );
        }
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('CNPJ já utilizado ou salvo no banco de dados')),
        );
      }
    }
  }

  Future<bool> checkCNPJ(String cnpj, BuildContext context) async {
    try {
      CollectionReference collectionReference = _firebaseFirestore
          .collection('User')
          .doc('fullmedcare@gmail.com')
          .collection('Companies');
      QuerySnapshot querySnapshot =
          await collectionReference.where('cnpj', isEqualTo: cnpj).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao tentar consultar CNPJ')),
        );
      }
      return false;
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
        if (docSnapshot.data().isNotEmpty) {
          listCompanies.add(Company.fromMap(docSnapshot.data()));
        }
      }
    });
    return listCompanies;
  }
}
