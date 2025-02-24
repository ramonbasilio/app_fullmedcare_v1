import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../data/model/unit.dart';

class DetailUnitPage extends StatefulWidget {
  Unit unit;
  DetailUnitPage({required this.unit, super.key});

  @override
  _DetailUnitPageState createState() => _DetailUnitPageState();
}

class _DetailUnitPageState extends State<DetailUnitPage> {
  final _formKey = GlobalKey<FormState>();
  final _unitNameController = TextEditingController();
  final _unitSymbolController = TextEditingController();
  FirebaseCloudFirestore firebaseCloudFirestore = FirebaseCloudFirestore();

  @override
  void dispose() {
    _unitNameController.dispose();
    _unitSymbolController.dispose();
    super.dispose();
  }

  void _deleteForm() async {
    if (_formKey.currentState!.validate()) {
      String unitName = _unitNameController.text;
      String unitSymbol = _unitSymbolController.text;
      Unit unit = Unit(id: widget.unit.id, name: unitName, simbol: unitSymbol);
      firebaseCloudFirestore.deleteUnits(unit: unit, context: context);
      FirebaseProvider firebaseProvider = Get.find();
      await firebaseProvider.getAllUnits();
    }
  }

  void _updateForm() async {
    if (_formKey.currentState!.validate()) {
      String unitName = _unitNameController.text;
      String unitSymbol = _unitSymbolController.text;
      Unit unit = Unit(id: widget.unit.id, name: unitName, simbol: unitSymbol);
      firebaseCloudFirestore.updateUnits(unit: unit, context: context);
      FirebaseProvider firebaseProvider = Get.find();
      await firebaseProvider.getAllUnits();
    }
  }

  @override
  Widget build(BuildContext context) {
    _unitNameController.text = widget.unit.name;
    _unitSymbolController.text = widget.unit.simbol;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Unidades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _unitNameController,
                decoration: const InputDecoration(labelText: 'Nome da unidade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o nome da unidade';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _unitSymbolController,
                decoration:
                    const InputDecoration(labelText: 'Simmbolo da Unidade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o símbolo da unidade';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _updateForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue.shade300,
                    ),
                    child: const Text('Atualizar'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.red.shade400,
                    ),
                    onPressed: _deleteForm,
                    child: const Text('Deletar', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
