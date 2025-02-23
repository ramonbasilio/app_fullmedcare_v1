import 'package:app_fullmedcare_v1/src/data/model/dataCertificatePg1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterDataCertificatePage2NOUSE extends StatefulWidget {
  DataCertificatePg1 dataCertificatePg1;
  RegisterDataCertificatePage2NOUSE({required this.dataCertificatePg1, super.key});

  @override
  State<RegisterDataCertificatePage2NOUSE> createState() =>
      _RegisterDataCertificatePage2State();
}

class _RegisterDataCertificatePage2State
    extends State<RegisterDataCertificatePage2NOUSE> {
  TextEditingController tempController = TextEditingController();
  TextEditingController humidityController = TextEditingController();
  int point = 0;
  int? selectedEquipmentIndex;
  List<Widget> listPoints = [];
  List<int> containerKeys = [];

  final arguments = Get.arguments;

  List<String> getNameEquipments() {
    List<String> result = [];
    for (var element
        in widget.dataCertificatePg1.listEquipmentsStandardSeletcted) {
      result.add(element.type);
    }
    return result;
  }

  // void _addPoint() {
  //   setState(() {
  //     listPoints.add(buildPointField(listPoints.length));
  //   });
  // }

  // void _removePoint(int index) {
  //   setState(() {
  //     listPoints.removeAt(index);
  //   });
  // }

  void _removeContainer(int key) {
    setState(() {
      containerKeys.remove(key);
    });
  }

  void _addContainer() {
    setState(() {
      containerKeys.add(DateTime.now().millisecondsSinceEpoch);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Certificado'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            summaryContainer(),
            const SizedBox(
              height: 20,
            ),
            tempAndHumityData(),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text('Pontos de Medição',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            listPoints.isEmpty
                ? const Text('Adicione um ponto de medição')
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: containerKeys.length,
                    itemBuilder: (context, index) {
                      return buildPointField(containerKeys[index]);
                    },
                  )
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.grey.shade300,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  _addContainer();

                  // setState(() {
                  //   listPoints.add(buildPointField(listPoints.length));
                  //   point++;
                  // });
                },
                child: const Text('Adicionar Ponto de Medição')),
          ],
        ),
      ),
    );
  }

  Container summaryContainer() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Resumo do Equipamento',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                  'Equipamento Médico: ${widget.dataCertificatePg1.medicalEquipment}'),
              Text('Modelo: ${widget.dataCertificatePg1.model}'),
              Text('Fabricante: ${widget.dataCertificatePg1.manufacturer}'),
              Text(
                  'Número de série: ${widget.dataCertificatePg1.serialNumber}'),
              Text('Setor: ${widget.dataCertificatePg1.location}'),
              Text('Patrimônio: ${widget.dataCertificatePg1.patrimonial}'),
              const Text('Equipamentos Padrão Utilizados',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget
                    .dataCertificatePg1.listEquipmentsStandardSeletcted.length,
                itemBuilder: (context, index) {
                  final data = widget.dataCertificatePg1
                      .listEquipmentsStandardSeletcted[index];
                  return Text(
                      '${index + 1} - Equipamento Padrão: ${data.type} - Marca: ${data.brand} - Modelo: ${data.model} - NS: ${data.sn}');
                },
              )
            ]));
  }

  Container tempAndHumityData() {
    return Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Dados de Temperatura e Umidade',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 120, child: Text("Temperatura ºC")),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      width: 100,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                        ),
                        controller: tempController,
                      )),
                  const SizedBox(
                    width: 50,
                  ),
                  const SizedBox(width: 120, child: Text("Humidade %")),
                  const SizedBox(
                    width: 0,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      width: 100,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                        ),
                        controller: humidityController,
                      )),
                  // Row(
                  //   children: [
                  //     const SizedBox(width: 120, child: Text("Humidade %")),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Container(
                  //         decoration: BoxDecoration(
                  //             border: Border.all(color: Colors.black, width: 1),
                  //             borderRadius: BorderRadius.circular(5)),
                  //         width: 100,
                  //         height: 50,
                  //         child: TextFormField(
                  //           keyboardType: TextInputType.number,
                  //           decoration: const InputDecoration(
                  //             contentPadding: EdgeInsets.all(10),
                  //           ),
                  //           controller: humidityController,
                  //         ))
                  //   ],
                  // )
                ],
              ),
            ]));
  }

  Container buildPointField(int index) {
    String? nameEquipment;
    // int index = listPoints.length;

    return Container(
        key: ValueKey(index),
        width: double.infinity,
        height: 250,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Row(
              children: [
                Text('Ponto de Medição ${index + 1}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                    onPressed: () {
                      _removeContainer(index);
                      // setState(() {
                      //   listPoints.removeAt(pointMeasuer);
                      //   print('Ponto: ${pointMeasuer + 1}');
                      //   print('Tamanho da lista: ${listPoints.length}');
                      // });
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
            Row(
              children: [
                const Text('Equipamento Padrão:',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Selecione um equipamento";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    hint: const Text('Selecione um equipamento'),
                    focusColor: Theme.of(context).scaffoldBackgroundColor,
                    value: nameEquipment,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    dropdownColor: Colors.grey.shade100,
                    elevation: 0,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        nameEquipment = newValue!;
                      });
                      // _formKey.currentState?.validate();
                    },
                    items: getNameEquipments()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: const TextStyle(fontSize: 15)),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text("Valor Medido"),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    const Text("Unidade"),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        width: 100,
                        height: 50,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: Row(
                children: [
                  const Text("Leitura 1"),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    width: 100,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      const Text("Leitura 2"),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          width: 100,
                          height: 50,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      const Text("Leitura 3"),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          width: 100,
                          height: 50,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
