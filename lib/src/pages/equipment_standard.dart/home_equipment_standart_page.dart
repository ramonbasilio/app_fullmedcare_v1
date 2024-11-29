import 'package:app_fullmedcare_v1/src/data/model/standar_equipment.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/register_equipment_standard_page.dart';
import 'package:app_fullmedcare_v1/src/widgets/custom_bottom_sheet_equipment_stardad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeEquipmentStandartPage extends StatefulWidget {
  const HomeEquipmentStandartPage({super.key});

  @override
  State<HomeEquipmentStandartPage> createState() =>
      _HomeEquipmentStandartPageState();
}

class _HomeEquipmentStandartPageState extends State<HomeEquipmentStandartPage> {
  FirebaseProvider firebaseProvider = Get.find();
  List<EquipmentStandard> filteredEquipmentsStandard = [];
  String _query = '';

  void search(String query, List<EquipmentStandard> listEquipmentsStandard) {
    setState(() {
      _query = query;
      filteredEquipmentsStandard = listEquipmentsStandard.where((item) {
        final nameMatch = item.type.toLowerCase().contains(query.toLowerCase());
        return nameMatch;
      }).toList();
    });
  }

  void _showCustomBottomSheet(
      BuildContext context, EquipmentStandard equipmentStandard) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CustomBottomSheetEquipmentStardad(
          equipmentStandard: equipmentStandard,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<EquipmentStandard> listEquipmentsStandard =
        firebaseProvider.allEquipmentsStandard;
    FirebaseCloudFirestore().getAllEquipmentsStandard();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipamento Padrão'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                search(value, listEquipmentsStandard);
              },
              decoration: InputDecoration(
                hintText: 'Digite o tipo',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // Define o arredondamento
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Arredondado para o estado padrão
                  borderSide: const BorderSide(
                    color: Colors.grey, // Cor da borda no estado padrão
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Arredondado para o estado focado
                  borderSide: const BorderSide(
                    color: Colors.blue, // Cor da borda ao focar
                    width: 2.0, // Espessura da borda ao focar
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Flexible(
              child: Obx(
                () => firebaseProvider.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : firebaseProvider.allEquipmentsStandard.isEmpty
                        ? const Center(
                            child: Text(
                                'Nenhum equipamento cadastrado cadastrado'))
                        : filteredEquipmentsStandard.isNotEmpty ||
                                _query.isNotEmpty
                            ? filteredEquipmentsStandard.isEmpty
                                ? const Center(
                                    child: Text(
                                        'Nenhum equipamento localizado'),
                                  )
                                : ListView.builder(
                                    itemCount:
                                        filteredEquipmentsStandard.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              _showCustomBottomSheet(
                                                  context,
                                                  listEquipmentsStandard[
                                                      index]);
                                            },
                                            leading: SizedBox(
                                              width: 80,
                                              child: CircleAvatar(
                                                child: Text(
                                                    filteredEquipmentsStandard[
                                                            index]
                                                        .type[0]
                                                        .toUpperCase()),
                                              ),
                                            ),
                                            title: Text(
                                                filteredEquipmentsStandard[
                                                        index]
                                                    .type),
                                          ),
                                          const Divider(),
                                        ],
                                      );
                                    },
                                  )
                            : ListView.builder(
                                itemCount: listEquipmentsStandard.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                          onTap: () {
                                            _showCustomBottomSheet(context,
                                                listEquipmentsStandard[index]);
                                          },
                                          leading: SizedBox(
                                            width: 80,
                                            child: CircleAvatar(
                                              child: Text(
                                                  listEquipmentsStandard[index]
                                                      .type[0]
                                                      .toUpperCase()),
                                            ),
                                          ),
                                          title: Text(
                                              listEquipmentsStandard[index]
                                                  .type)),
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
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Get.to(() => RegisterEquipmentStandardPage());
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
