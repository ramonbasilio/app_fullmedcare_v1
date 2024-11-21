import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:app_fullmedcare_v1/src/pages/company/list_companies_page_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Confirmationwidget {
  Future<void> showConfirmationDialog(
      BuildContext context, Company company) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, 
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Confirmar exclusão'),
            content:
                const Text('Você tem certeza que deseja excluir esta empresa?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Get.back(); 
                },
              ),
              TextButton(
                child: const Text('Excluir'),
                onPressed: () async {
                  await FirebaseCloudFirestore().deleteCompany(
                    company: company,
                    context: context,
                  );
                  FirebaseProvider firebaseProvider = Get.find();
                  await firebaseProvider.getAllCompanies();
                  Get.to(() => const ListCompaniesPageSearch());
                },
              ),
            ],
          );
        });
  }
}
