import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/pages/home_page/home_page.dart';
import 'package:app_fullmedcare_v1/src/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDatabaseStandardEquipment extends StatelessWidget {
  const ListDatabaseStandardEquipment({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Base de Nomes de Equipamentos Padrão'),
                  leading: BackButton(
          onPressed: () {
            Get.offAndToNamed(NameRoutes.equipmentDatabaseRegistrationPage);
          },
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Flexible(
                child: Obx(
                  () => firebaseProvider.allEquipmentsStandardName.isEmpty
                      ? const Text('Nenhum equipamento padrão salvo')
                      : ListView.builder(
                          itemCount: firebaseProvider.allEquipmentsStandardName.length,
                          itemBuilder: (context, index) {
                            final data = firebaseProvider.allEquipmentsStandardName;
                            return Column(
                              children: [
                                ListTile(
                                  leading: Text((index + 1).toString()),
                                  title: Text(data[index].name),
                                  onTap: () {
                                  },

                                ),
                                const Divider()
                              ],
                            );
                          }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: const Icon(Icons.add),
        ));
  }
}
