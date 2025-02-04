import 'package:app_fullmedcare_v1/src/constants/constants.dart';
import 'package:flutter/material.dart';

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
  TextEditingController _controllerModelEquipment = TextEditingController();
  TextEditingController _controllerManufacturer = TextEditingController();
  TextEditingController _controllerSerialNumber = TextEditingController();
  TextEditingController _controllerPatrimonio = TextEditingController();
  TextEditingController _controllerLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    medicalEquipmentList.sort((a, b) => a.compareTo(b));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emitir Certificado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(bottom: 10.0),
                    child:  Text(
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
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Equipamento: ', style: TextStyle(fontSize: 17),),
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
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
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
            ),
          ],
        ),
      ),
    );
  }
}
