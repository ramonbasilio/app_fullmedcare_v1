import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/pages/company/list_companies_page_search.dart';
import 'package:app_fullmedcare_v1/src/pages/company/register_company_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/home_equipment_standart_page.dart';
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
                    Get.to(() => RegisterCompanyPage());
                  }),
                  nameButtom: 'Cadastrar Empresa',
                ),
                ButtomHomePage(
                  func: (() {
                    FirebaseProvider firebaseProvider = Get.find();
                    firebaseProvider.getAllCompanies();
                    Get.to(() => const ListCompaniesPageSearch());
                  }),
                  nameButtom: 'Empresas Cadastras',
                ),
                ButtomHomePage(
                  func: (() {
                    Get.to(() => const HomeEquipmentStandartPage());
                  }),
                  nameButtom: 'Equipamentos Padrão',
                ),
                ButtomHomePage(
                  func: (() {}),
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
