import 'package:app_fullmedcare_v1/src/utils/utils.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterCerticateEquipmentStandardPage extends StatefulWidget {
  const RegisterCerticateEquipmentStandardPage({super.key});

  @override
  State<RegisterCerticateEquipmentStandardPage> createState() =>
      _RegisterCerticateEquipmentStandardPageState();
}

class _RegisterCerticateEquipmentStandardPageState
    extends State<RegisterCerticateEquipmentStandardPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _issuerController = TextEditingController();
  final TextEditingController _numberCertificateController =
      TextEditingController();
  final TextEditingController _dateOfIssueController = TextEditingController();
  final TextEditingController _dateExpirationController =
      TextEditingController();

  final dateMask =
      MaskTextInputFormatter(initialText: '##/##/####', mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Cadastrar Certificado de Calibração - Equip. Padrão'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: ListView(
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
                            maxDate: DateTime(2026, 1, 1),
                          );
                          setState(() {
                            if (date != null) {
                              String result =
                                  Utils.convertDate(date.toIso8601String());
                              _dateExpirationController.text = result;
                            }
                          });
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
            )),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text('Salvar')),
                ),
                SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Limpar')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
