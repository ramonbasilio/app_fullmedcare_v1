import 'package:app_fullmedcare_v1/src/data/model/equipment_name.dart';
import 'package:app_fullmedcare_v1/src/data/model/equipment_stardard.dart';
import 'package:app_fullmedcare_v1/src/data/model/unit.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class RegisterEquipmentStandardPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController typeController = TextEditingController();
    TextEditingController modelController = TextEditingController();
    TextEditingController brandController = TextEditingController();
    TextEditingController snController = TextEditingController();
    TextEditingController tagController = TextEditingController();
    FirebaseProvider firebaseProvider = Get.find();
    List<EquipmentName> allEquipmentsStandardName =
        firebaseProvider.allEquipmentsStandardName;
    List<Unit> allUnits = firebaseProvider.allUnits;
    List<String> equipmentNames =
        allEquipmentsStandardName.map((e) => e.name).toList();
    List<String> unitsNames =
        allUnits.map((e) => '${e.name} - ${e.simbol}').toList();
    String type = '';
    String unit = '';

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
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tipo do Equipamento',
                  border: OutlineInputBorder(),
                ),
                items: equipmentNames.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  type = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione o tipo do equipamento';
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
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Unidade de Medida',
                  border: OutlineInputBorder(),
                ),
                items: unitsNames.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  unit = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione o unidade de medida do equipamento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Botão de salvar
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    FirebaseCloudFirestore firebaseCloudFirestore =
                        FirebaseCloudFirestore();
                    EquipmentStandard equipmentStandard = EquipmentStandard(
                      type: type,
                      model: modelController.text,
                      brand: brandController.text,
                      sn: snController.text,
                      tag: tagController.text,
                      id: const Uuid().v4(),
                      unit: unit,
                    );
                    await firebaseCloudFirestore.registerEquipmentStandard(
                        equipmentStandard: equipmentStandard, context: context);
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
