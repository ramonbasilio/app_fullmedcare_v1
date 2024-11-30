// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:app_fullmedcare_v1/src/data/model/address.dart';
import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:app_fullmedcare_v1/src/data/repository/search_cep.dart';

class EditCompanyPage extends StatefulWidget {
  Company company;

  EditCompanyPage({super.key, required this.company});

  @override
  _EditCompanyPageState createState() => _EditCompanyPageState();
}

class _EditCompanyPageState extends State<EditCompanyPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _addresscoController = TextEditingController();
  final _numberController = TextEditingController();
  final _complementController = TextEditingController();
  final _districtController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _cepController = TextEditingController();
  final _cnpjController = TextEditingController();

  final cepMask =
      MaskTextInputFormatter(initialText: '#####-###', mask: '#####-###');

  final cnpjMask = MaskTextInputFormatter(mask: '##.###.###/####-##');

  late Address address;

  @override
  void dispose() {
    _nameController.dispose();
    _addresscoController.dispose();
    _numberController.dispose();
    _complementController.dispose();
    _districtController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _cepController.dispose();
    _cnpjController.dispose();
    super.dispose();
  }

  String? _validateCNPJ(String? value) {
    if (value == null || value.isEmpty) {
      return 'CNPJ é obrigatório';
    }
    return null;
  }

  String? _validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName é obrigatório';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.company.name;
    _cnpjController.text = widget.company.cnpj;
    _cepController.text = widget.company.cep;
    _addresscoController.text = widget.company.address;
    _numberController.text = widget.company.number;
    _complementController.text = widget.company.complement;
    _districtController.text = widget.company.district;
    _cityController.text = widget.company.city;
    _stateController.text = widget.company.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Empresa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome da Empresa'),
                validator: (value) =>
                    _validateNotEmpty(value, 'Nome da empresa'),
              ),
              TextFormField(
                enabled: false,
                controller: _cnpjController,
                inputFormatters: [cnpjMask],
                decoration: const InputDecoration(labelText: 'CNPJ'),
                keyboardType: TextInputType.number,
                validator: _validateCNPJ,
              ),
              TextFormField(
                controller: _cepController,
                onChanged: (value) async {
                  value = value.replaceAll('-', '');
                  if (value.length == 8) {
                    try {
                      address = await SearchCep().fetchData(value);
                      setState(() {
                        _addresscoController.text = address.logradouro;
                        _complementController.text = address.complemento;
                        _districtController.text = address.bairro;
                        _cityController.text = address.cidade;
                        _stateController.text = address.estado;
                      });
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Erro: $e')));
                      }
                    }
                  }
                },
                inputFormatters: [cepMask],
                decoration: const InputDecoration(labelText: 'CEP'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'CEP é obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: _addresscoController,
                decoration: const InputDecoration(labelText: 'Endereço'),
                validator: (value) => _validateNotEmpty(value, 'Endereço'),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: _numberController,
                decoration: const InputDecoration(labelText: 'Número'),
                validator: (value) => _validateNotEmpty(value, 'Número'),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: _complementController,
                decoration: const InputDecoration(labelText: 'Complemento'),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: _districtController,
                decoration: const InputDecoration(labelText: 'Bairro'),
                validator: (value) => _validateNotEmpty(value, 'Bairro'),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Cidade'),
                validator: (value) => _validateNotEmpty(value, 'Cidade'),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: _stateController,
                decoration: const InputDecoration(labelText: 'Estado'),
                validator: (value) => _validateNotEmpty(value, 'Estado'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Company company = Company(
                      name: _nameController.text.trimLeft(),
                      cnpj: _cnpjController.text.trimLeft(),
                      address: _addresscoController.text.trimLeft(),
                      number: _numberController.text.trimLeft(),
                      complement: _complementController.text.trimLeft(),
                      district: _districtController.text.trimLeft(),
                      city: _cityController.text.trimLeft(),
                      state: _stateController.text.trimLeft(),
                      cep: _cepController.text.trimLeft(),
                      id: widget.company.id,
                      date: DateTime.now().toString(),
                    );
                    await FirebaseCloudFirestore().upDateCompany(
                      company: company,
                      context: context,
                    );
                    FirebaseProvider firebaseProvider = Get.find();
                    await firebaseProvider.getAllCompanies();
                  }
                },
                child: const Text('Atualizar cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
