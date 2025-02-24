import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/pages/company/list_companies_page_search.dart';
import 'package:app_fullmedcare_v1/src/pages/company/register_company_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/list_equipment_standart_page.dart';
import 'package:app_fullmedcare_v1/src/routes/name_routes.dart';
import 'package:app_fullmedcare_v1/src/widgets/buttom_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu));
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'FullMedCare',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Unidades de Medida'),
              onTap: () {
                Get.back();
                Get.toNamed(NameRoutes.unitPage);
              },
            ),
            ListTile(
              title: const Text('Cadastro Base Equipamentos'),
              onTap: () {
                Get.back();
                Get.toNamed(NameRoutes.equipmentDatabaseRegistrationPage);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image.asset(
                //   'lib/assets/logo-app.png',
                //   fit: BoxFit.fitHeight,
                //   height: 100,
                // ),
                ButtomHomePage(
                  func: (() {
                    Get.toNamed(NameRoutes.registerCompany);
                  }),
                  nameButtom: 'Cadastrar Empresa',
                ),
                ButtomHomePage(
                  func: (() {
                    FirebaseProvider firebaseProvider = Get.find();
                    firebaseProvider.getAllCompanies();
                    Get.toNamed(NameRoutes.listCompanies);
                  }),
                  nameButtom: 'Empresas Cadastras',
                ),
                ButtomHomePage(
                  func: (() {
                    Get.toNamed(NameRoutes.listEquipmentStandard);
                  }),
                  nameButtom: 'Equipamentos Padrão',
                ),
                ButtomHomePage(
                  func: (() {
                    Get.toNamed(NameRoutes.regiterCertificatePage1);
                  }),
                  nameButtom: 'Certificados',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
