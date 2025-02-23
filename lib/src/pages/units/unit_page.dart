import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitPage extends StatelessWidget {
  const UnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Unidades de Medidas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Flexible(
                child: Obx(
                  () => firebaseProvider.allUnits.isEmpty
                      ? const Text('Sem unidades salvas')
                      : ListView.builder(
                          itemCount: firebaseProvider.allUnits.length,
                          itemBuilder: (context, index) {
                            final unit = firebaseProvider.allUnits;
                            return Column(
                              children: [
                                ListTile(
                                  leading: Text((index + 1).toString()),
                                  title: Text('Nome: ${unit[index].name}'),
                                  subtitle: Text('Simbolo: ${unit[index].simbol}'),
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(right:25.0),
                                    child: IconButton(onPressed:() {
                                      
                                    }, icon: const Icon(Icons.delete)),
                                  ),
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
            Get.toNamed(NameRoutes.registerUnitPage);
          },
          child: const Icon(Icons.add),
        ));
  }
}
