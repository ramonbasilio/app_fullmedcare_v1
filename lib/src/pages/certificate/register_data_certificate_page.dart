import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterDataCertificatePage extends StatelessWidget {
  const RegisterDataCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Registro Dados do Certificado'),
      ),
      body: Row(
        children: [
          ElevatedButton(onPressed: ((){
            Get.back();
          }), child: const Text('Voltar'))
        ],
      ),
    );
  }
}