import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/utils/utils.dart';
import 'package:app_fullmedcare_v1/src/widgets/text_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCompaniesPage extends StatelessWidget {
  const ListCompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Get.find();
    firebaseProvider.getAllCompanies();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresas Cadastradas'),
        actions: [
          IconButton(
              onPressed: () async {
                await firebaseProvider.getAllCompanies();
              },
              icon: const Icon(Icons.replay_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Obx(
                () => firebaseProvider.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : firebaseProvider.allCompanies.isEmpty
                        ? const Text('Nenhuma empresa cadastrada')
                        : ListView.builder(
                            itemCount: firebaseProvider.allCompanies.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                      onTap: () {
                                        // _showBottomSheet(
                                        //     context,
                                        //     _managerProvider
                                        //         .allServiceOrderCar[index]);
                                      },
                                      leading: SizedBox(
                                        width: 250,
                                        child: Column(
                                          children: [
                                            Text(
                                              firebaseProvider
                                                  .allCompanies[index].name,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              firebaseProvider
                                                  .allCompanies[index].cnpj,
                                              style:
                                                  const TextStyle(fontSize: 15),
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      ),
                                      title: TextDetails(
                                        company: firebaseProvider
                                            .allCompanies[index],
                                      )),
                                  const Divider()
                                ],
                              );
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
