import 'package:app_fullmedcare_v1/src/data/model/equipment.dart';
import 'package:app_fullmedcare_v1/src/data/provider/register_equipment_provider.dart';
import 'package:app_fullmedcare_v1/src/pages/certificate/register_data_certificate_page_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegisterEquipmentPage extends StatelessWidget {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController nsController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegisterEquipmentProvider registerEquipmentProvider = Provider.of<RegisterEquipmentProvider>(context, listen: false);
    typeController.text = registerEquipmentProvider.type;
    modelController.text = registerEquipmentProvider.model;
    brandController.text = registerEquipmentProvider.brand;
    nsController.text = registerEquipmentProvider.ns;
    tagController.text = registerEquipmentProvider.tag;
    departmentController.text = registerEquipmentProvider.department;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Equipamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCustomContainer(
                  label: 'Tipo do Equipamento',
                  controller: typeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo Tipo do Equipamento é obrigatório.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildCustomContainer(
                  label: 'Modelo',
                  controller: modelController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo Modelo é obrigatório.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildCustomContainer(
                  label: 'Marca',
                  controller: brandController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo Marca é obrigatório.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildCustomContainer(
                  label: 'Número de Série',
                  controller: nsController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo Número de Série é obrigatório.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildCustomContainer(
                  label: 'Tag',
                  controller: tagController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo Tag é obrigatório.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildCustomContainer(
                  label: 'Setor',
                  controller: departmentController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo Setor é obrigatório.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Equipment equipment = Equipment(
                          type: typeController.text,
                          model: modelController.text,
                          brand: brandController.text,
                          ns: nsController.text,
                          tag: tagController.text,
                          department: departmentController.text);
                      

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Equipamento cadastrado com sucesso!'),
                        ),
                      );
                        Get.to(()=>const RegisterDataCertificatePage1());
                    }
                  },
                  child: const Text('Avançar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomContainer({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
