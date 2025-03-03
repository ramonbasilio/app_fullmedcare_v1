import 'package:app_fullmedcare_v1/src/data/model/biomedical_equipment.dart';
import 'package:app_fullmedcare_v1/src/data/model/equipment_name.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

class RegisterDatabaseBiomedicalEquipment extends StatefulWidget {
  const RegisterDatabaseBiomedicalEquipment({super.key});

  @override
  _RegisterDatabaseBiomedicalEquipmentState createState() =>
      _RegisterDatabaseBiomedicalEquipmentState();
}

class _RegisterDatabaseBiomedicalEquipmentState
    extends State<RegisterDatabaseBiomedicalEquipment> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _equipmentNameController =
      TextEditingController();
  List<String> calibrationEquipments = [];
  List<String> selectedEquipments = [];
  List<EquipmentName> selectedEquipmentsComplete = [];
  List<EquipmentName> biomedicalEquipment = [];
  String? selectedCalibrationEquipment;

  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Get.find();
    biomedicalEquipment = firebaseProvider.allEquipmentsStandardName;
    calibrationEquipments = biomedicalEquipment.map((e) => e.name).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Equipamento Médico'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _equipmentNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do Equipamento',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do equipamento';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                    onPressed: () {
                      _showBottomSheet(context);

                      //Get.back();
                    },
                    child: const Text('Adicionar/Remover equip. calibração')),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BiomedicalEquipment equipment = BiomedicalEquipment(
                        name: _equipmentNameController.text,
                        id: const Uuid().v4(),
                        equipments: selectedEquipmentsComplete,
                      );
                      print(equipment.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processando dados')),
                      );
                    }
                  },
                  child: const Text('Cadastrar'),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Equipamentos de Calibração Selecionados:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      if (selectedEquipments.isEmpty)
                        const Text('Nenhum equipamento selecionado'),
                      for (var equipment in selectedEquipments)
                        Text(
                          equipment,
                          style: const TextStyle(fontSize: 14),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateModal) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  const Text(
                    'Equipamentos Padrão',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: biomedicalEquipment.length,
                        itemBuilder: (context, index) {
                          final item = biomedicalEquipment[index];
                          final isSelected =
                              selectedEquipments.contains(item.name);
                          return Column(
                            children: [
                              ListTile(
                                  title: Text(item.name),
                                  tileColor: isSelected
                                      ? Colors.blue.withAlpha(30)
                                      : null,
                                  leading: Icon(
                                    isSelected
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
                                    color: isSelected ? Colors.blue : null,
                                  ),
                                  onTap: () {
                                    setStateModal(() {
                                      if (selectedEquipments
                                          .contains(item.name)) {
                                        selectedEquipments.remove(item.name);
                                      } else {
                                        selectedEquipments.add(item.name);
                                      }
                                    });
                                  }),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           for (var e in biomedicalEquipment) {
                  //             setStateModal(() {
                  //               selectedEquipments.add(e.name);
                  //             });
                  //           }
                  //         },
                  //         child: const Text('Selecionar todos'),
                  //       ),
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           setStateModal(() {
                  //             selectedEquipments.clear();
                  //           });
                  //         },
                  //         child: const Text('Nenhum'),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      selectedEquipmentsComplete.clear();
      for (var element in selectedEquipments) {
        for (var e in biomedicalEquipment) {
          if (e.name == element) {
            selectedEquipmentsComplete.add(e);
          }
        }
      }
      setState(() {});
    });
  }
}
