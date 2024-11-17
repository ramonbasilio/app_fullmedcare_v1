import 'package:app_fullmedcare_v1/src/data/model/address.dart';
import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/data/repository/firebase_cloud_firestore.dart';
import 'package:app_fullmedcare_v1/src/data/repository/search_cep.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

class RegisterCompanyPage extends StatefulWidget {
  @override
  _RegisterCompanyPageState createState() => _RegisterCompanyPageState();
}

class _RegisterCompanyPageState extends State<RegisterCompanyPage> {
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
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome da Empresa'),
                validator: (value) =>
                    _validateNotEmpty(value, 'Nome da empresa'),
              ),
              TextFormField(
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
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Erro: $e')));
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
                controller: _addresscoController,
                decoration: const InputDecoration(labelText: 'Endereço'),
                validator: (value) => _validateNotEmpty(value, 'Endereço'),
              ),
              TextFormField(
                controller: _numberController,
                decoration: const InputDecoration(labelText: 'Número'),
                validator: (value) => _validateNotEmpty(value, 'Número'),
              ),
              TextFormField(
                controller: _complementController,
                decoration: const InputDecoration(labelText: 'Complemento'),
              ),
              TextFormField(
                controller: _districtController,
                decoration: const InputDecoration(labelText: 'Bairro'),
                validator: (value) => _validateNotEmpty(value, 'Bairro'),
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Cidade'),
                validator: (value) => _validateNotEmpty(value, 'Cidade'),
              ),
              TextFormField(
                controller: _stateController,
                decoration: const InputDecoration(labelText: 'Estado'),
                validator: (value) => _validateNotEmpty(value, 'Estado'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Company company = Company(
                      name: _nameController.text,
                      cnpj: _cnpjController.text,
                      address: _addresscoController.text,
                      number: _numberController.text,
                      complement: _complementController.text,
                      district: _districtController.text,
                      city: _cityController.text,
                      state: _stateController.text,
                      cep: _cepController.text,
                      id: const Uuid().v1(),
                    );
                    await FirebaseCloudFirestore().registerCompany(
                      company: company,
                      context: context,
                    );
                    Future.delayed(const Duration(seconds: 2));
                    Get.back();
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
