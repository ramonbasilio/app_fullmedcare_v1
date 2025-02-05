import 'package:app_fullmedcare_v1/src/constants/constants.dart';
import 'package:app_fullmedcare_v1/src/data/model/equipment_stardard.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:app_fullmedcare_v1/src/widgets/text_details_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterDataCertificatePage extends StatefulWidget {
  const RegisterDataCertificatePage({super.key});

  @override
  State<RegisterDataCertificatePage> createState() =>
      _RegisterDataCertificatePageState();
}

class _RegisterDataCertificatePageState
    extends State<RegisterDataCertificatePage> {
  String? nameEquipment;
  List<String> medicalEquipmentList = Constants.medicalEquipment;
  final TextEditingController _controllerModelEquipment =
      TextEditingController();
  final TextEditingController _controllerManufacturer = TextEditingController();
  final TextEditingController _controllerSerialNumber = TextEditingController();
  final TextEditingController _controllerPatrimonio = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();
  FirebaseProvider firebaseProvider = Get.find();
  List<EquipmentStandard> listEquipmentsStandardSeletcted = [];

  @override
  Widget build(BuildContext context) {
    List<EquipmentStandard> listEquipmentsStandard =
        firebaseProvider.allEquipmentsStandard;
    FirebaseCloudFirestore().getAllEquipmentsStandard();
    medicalEquipmentList.sort((a, b) => a.compareTo(b));
  

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emitir Certificado'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              containerEquipmentData(),
              const SizedBox(
                height: 20,
              ),
              containerEquipmentStandardAdd(context, listEquipmentsStandard)
            ],
          ),
        ),
      ),
    );
  }

  Container containerEquipmentStandardAdd(BuildContext context, List<EquipmentStandard> listEquipmentsStandard) {
    return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton.outlined(
                            onPressed: () {
                              _showCustomBottomSheet(
                                  context, listEquipmentsStandard);
                            },
                            icon: const Icon(Icons.add)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Equipamento Padrão',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    listEquipmentsStandardSeletcted.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text('Nenhum Equipamento Padrão Selecionado'),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: listEquipmentsStandardSeletcted.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: IconButton(onPressed:() {
                                      setState(() {
                                        listEquipmentsStandardSeletcted.removeAt(index);
                                      });
                                    }, icon: const Icon(Icons.delete)),
                                    title: TextDetails2(
                                      equipmentStandard:
                                          listEquipmentsStandardSeletcted[
                                              index],
                                    ),
                                  ),
                                  const Divider()
                                ],
                              );
                            },
                          ),
                  ],
                ));
  }

  Container containerEquipmentData() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              'Dados do equipamento',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 347,
                height: 58,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Equipamento: ',
                      style: TextStyle(fontSize: 17),
                    ),
                    DropdownButton<String>(
                      borderRadius: BorderRadius.circular(5),
                      focusColor: Colors.white,
                      value: nameEquipment,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      dropdownColor: Colors.white,
                      elevation: 0,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          nameEquipment = newValue!;
                        });
                      },
                      items: medicalEquipmentList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextFormField(
                  controller: _controllerModelEquipment,
                  decoration: const InputDecoration(
                    labelText: 'Modelo: ',
                    border: OutlineInputBorder(), // Add border here
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: _controllerModelEquipment,
                  decoration: const InputDecoration(
                    labelText: 'Marca',
                    border: OutlineInputBorder(), // Add border here
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextFormField(
                  controller: _controllerSerialNumber,
                  decoration: const InputDecoration(
                    labelText: 'Número de série',
                    border: OutlineInputBorder(), // Add border here
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: _controllerPatrimonio,
                  decoration: const InputDecoration(
                    labelText: 'Patrimônio',
                    border: OutlineInputBorder(), // Add border here
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextFormField(
                  controller: _controllerLocation,
                  decoration: const InputDecoration(
                    labelText: 'Setor',
                    border: OutlineInputBorder(), // Add border here
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCustomBottomSheet(
      BuildContext context, List<EquipmentStandard> listEquipmentsStandard) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Lista de Equipamentos Padrão Cadastrados',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listEquipmentsStandard.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              onTap: () {
                                if (!listEquipmentsStandardSeletcted
                                    .contains(listEquipmentsStandard[index])) {
                                  setState(() {
                                    listEquipmentsStandardSeletcted
                                        .add(listEquipmentsStandard[index]);
                                        listEquipmentsStandardSeletcted.sort((a, b) => a.type.compareTo(b.type));
                                  });
                                }
                                Get.back();
                              },
                              title: TextDetails2(
                                equipmentStandard:
                                    listEquipmentsStandard[index],
                              ),
                            ),
                            const Divider()
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
