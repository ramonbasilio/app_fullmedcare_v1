import 'package:app_fullmedcare_v1/src/data/model/equipment_stardard.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEquipmentStandardPage extends StatefulWidget {
  EquipmentStandard equipmentStandard;
  EditEquipmentStandardPage({required this.equipmentStandard, super.key});

  @override
  State<EditEquipmentStandardPage> createState() =>
      _EditEquipmentStandardPageState();
}

class _EditEquipmentStandardPageState extends State<EditEquipmentStandardPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController typeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController snController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  FirebaseProvider firebaseProvider = Get.find();

  @override
  Widget build(BuildContext context) {

    typeController.text = widget.equipmentStandard.type;
    modelController.text = widget.equipmentStandard.model;
    brandController.text = widget.equipmentStandard.brand;
    snController.text = widget.equipmentStandard.sn;
    tagController.text = widget.equipmentStandard.tag;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Equipamento Padrão'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Tipo do equipamento
              TextFormField(
                controller: typeController,
                decoration: const InputDecoration(
                  labelText: 'Tipo do Equipamento',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o tipo do equipamento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: modelController,
                decoration: const InputDecoration(
                  labelText: 'Modelo do Equipamento',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o modelo do equipamento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Marca do equipamento
              TextFormField(
                controller: brandController,
                decoration: const InputDecoration(
                  labelText: 'Marca do Equipamento',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a marca do equipamento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Modelo do equipamento

              // Número de Série (NS)
              TextFormField(
                controller: snController,
                decoration: const InputDecoration(
                  labelText: 'Número de Série (NS)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de série';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Tag
              TextFormField(
                controller: tagController,
                decoration: const InputDecoration(
                  labelText: 'Tag',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a tag';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                      FirebaseCloudFirestore firebaseCloudFirestore =
                          FirebaseCloudFirestore();
                      EquipmentStandard equipmentStandard = EquipmentStandard(
                        type: typeController.text,
                        model: modelController.text,
                        brand: brandController.text,
                        sn: snController.text,
                        tag: tagController.text,
                        id: widget.equipmentStandard.id,
                      );
                     await firebaseCloudFirestore.upDateEquipmentStandard(equipmentStandard: equipmentStandard, context: context);
                    await firebaseProvider.getAllEquipmentsStandard();
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
