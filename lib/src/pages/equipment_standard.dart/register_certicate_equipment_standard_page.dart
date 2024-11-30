import 'package:app_fullmedcare_v1/src/data/provider/points_measur_provider.dart';
import 'package:app_fullmedcare_v1/src/utils/utils.dart';
import 'package:app_fullmedcare_v1/src/widgets/button_navbar.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class RegisterCerticateEquipmentStandardPage extends StatefulWidget {
  const RegisterCerticateEquipmentStandardPage({super.key});

  @override
  State<RegisterCerticateEquipmentStandardPage> createState() =>
      _RegisterCerticateEquipmentStandardPageState();
}

class _RegisterCerticateEquipmentStandardPageState
    extends State<RegisterCerticateEquipmentStandardPage> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final TextEditingController _issuerController = TextEditingController();
  final TextEditingController _numberCertificateController =
      TextEditingController();
  final TextEditingController _dateOfIssueController = TextEditingController();
  final TextEditingController _dateExpirationController =
      TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _pointController = TextEditingController();
  final TextEditingController _vvcController = TextEditingController();
  final TextEditingController _uncertaintyController = TextEditingController();
  final TextEditingController _kValueController = TextEditingController();

  final dateMask =
      MaskTextInputFormatter(initialText: '##/##/####', mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> listController = [
      _issuerController,
      _numberCertificateController,
      _dateOfIssueController,
      _dateExpirationController,
    ];
    List<TextEditingController> listController2 = [
      _unitController, _pointController, _vvcController, _uncertaintyController, _kValueController
    ];

    PointsMeasurProvider pointsMeasurProvider = Provider.of<PointsMeasurProvider>(context, listen: false);
    
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Cadastrar Certificado de Calibração - Equip. Padrão'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            formRegisterInfo(),
            formRegistermMasuringPoints(listController2)
          ],
        ),
      ),
      bottomNavigationBar: ButtonNavBar(
        formKey: _formKey,
        listController: listController,
      ),
    );
  }

  Form formRegisterInfo() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Center(
              child: Text(
                'Dados do Certificado',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(width: 200, child: Text('Emissor')),
                SizedBox(
                  width: 500,
                  child: TextFormField(
                    controller: _issuerController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o emissor do certificado';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                    width: 200, child: Text('Número do certificado')),
                SizedBox(
                  width: 500,
                  child: TextFormField(
                    controller: _numberCertificateController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o número do certificado';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(width: 200, child: Text('Data de emissão')),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    onTap: (() async {
                      final date = await showDatePickerDialog(
                        context: context,
                        minDate: DateTime(2020, 1, 1),
                        maxDate: DateTime.now(),
                      );
                      if (date != null && context.mounted) {
                        setState(() {
                          String result =
                              Utils.convertDate(date.toIso8601String());
                          _dateOfIssueController.text = result;
                        });
                      }
                    }),
                    inputFormatters: [dateMask],
                    controller: _dateOfIssueController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite a data de emissão';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(width: 200, child: Text('Data de validade')),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    onTap: (() async {
                      final date = await showDatePickerDialog(
                        context: context,
                        minDate: DateTime.now(),
                        maxDate: DateTime(2100, 1, 1),
                      );
                      if (date != null && context.mounted) {
                        int differenceInDays =
                            DateTime.now().difference(date).inDays.abs();
                        String result =
                            Utils.convertDate(date.toIso8601String());
                        _dateExpirationController.text = result;
                        if (differenceInDays < 30) {
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Atenção, certificado próximo da validade')),
                            );
                          });
                        }
                      }
                    }),
                    inputFormatters: [dateMask],
                    controller: _dateExpirationController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite a data de validade';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            )
          ],
        ));
  }

  Form formRegistermMasuringPoints(List<TextEditingController> listController2) {
    return Form(
      key: _formKey2,
      child: Column(
        children: [
          const Text(
            'Pontos de Medição',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('Unidade:'),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        controller: _unitController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite o emissor do certificado';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const Text('Ponto:'),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        controller: _pointController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite o emissor do certificado';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const Text('VVC:'),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        controller: _vvcController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite o emissor do certificado';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const Text('Incerteza:'),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        controller: _uncertaintyController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite o emissor do certificado';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const Text('K:'),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        controller: _kValueController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite o emissor do certificado';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    

                  },
                  child: const Icon(Icons.add),
                ),
                         const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    for (var x in listController2) {
                      x.clear();
                    }

                  },
                  child: const Text('Limpar'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
