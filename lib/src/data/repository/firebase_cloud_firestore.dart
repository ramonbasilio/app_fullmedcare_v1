import 'package:app_fullmedcare_v1/src/data/model/certificate_equipment_stantard.dart';
import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/data/model/equipment_stardard.dart';
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

  Future<void> upDateCompany(
      {required Company company, required BuildContext context}) async {
    try {
      await _firebaseFirestore
          .collection('User')
          .doc('fullmedcare@gmail.com')
          .collection('Companies')
          .doc(company.id)
          .update(company.toMap());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro atualizado com sucesso!')),
        );
      }
      Get.back();
    } on FirebaseException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao atualizar. Erro: $e')),
        );
      }
    }
  }

  Future<void> deleteCompany(
      {required Company company, required BuildContext context}) async {
    try {
      await _firebaseFirestore
          .collection('User')
          .doc('fullmedcare@gmail.com')
          .collection('Companies')
          .doc(company.id)
          .delete();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro excluído com sucesso!')),
        );
      }
      Get.back();
    } on FirebaseException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao deletar. Erro: $e')),
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
        if (docSnapshot.data().isNotEmpty) {
          listCompanies.add(Company.fromMap(docSnapshot.data()));
        }
      }
    });
    return listCompanies;
  }

  Future<void> registerEquipmentStandard(
      {required EquipmentStandard equipmentStandard,
      required BuildContext context}) async {
    try {
      await _firebaseFirestore
          .collection('User')
          .doc('fullmedcare@gmail.com')
          .collection('Equipment_Standard')
          .doc(equipmentStandard.id)
          .set(equipmentStandard.toMap());
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
  }

  Future<List<EquipmentStandard>> getAllEquipmentsStandard() async {
    List<EquipmentStandard> listEquipmentsStandard = [];
    await _firebaseFirestore
        .collection('User')
        .doc('fullmedcare@gmail.com')
        .collection('Equipment_Standard')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        if (docSnapshot.data().isNotEmpty) {
          listEquipmentsStandard
              .add(EquipmentStandard.fromMap(docSnapshot.data()));
        }
      }
    });
    return listEquipmentsStandard;
  }

  Future<void> registerCertificateEquipmentStandard(
      {required CertificateEquipmentStandard certificateEquipmentStandard,
      required String equipmentStardadId,
      required BuildContext context}) async {
    try {
      await _firebaseFirestore
          .collection('User')
          .doc('fullmedcare@gmail.com')
          .collection('Equipment_Standard')
          .doc(equipmentStardadId)
          .collection('Certificates')
          .doc(certificateEquipmentStandard.id)
          .set(certificateEquipmentStandard.toMap());

          
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
  }

  Future<List<CertificateEquipmentStandard>>
      getAllCertificateEquipmentStandard(
          String equipmentStardadId) async {
    List<CertificateEquipmentStandard> listCertificateEquipmentStandard = [];
    await _firebaseFirestore
        .collection('User')
        .doc('fullmedcare@gmail.com')
        .collection('Equipment_Standard')
        .doc(equipmentStardadId)
        .collection('Certificates')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        if (docSnapshot.data().isNotEmpty) {
          listCertificateEquipmentStandard
              .add(CertificateEquipmentStandard.fromMap(docSnapshot.data()));
        }
      }
    });
    return listCertificateEquipmentStandard;
  }
}
