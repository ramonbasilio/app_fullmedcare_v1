import 'package:app_fullmedcare_v1/src/pages/register_company/register_company.dart';
import 'package:app_fullmedcare_v1/src/widgets/buttom_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  nameButtom: 'Cadastrar Empresas',
                ),
                ButtomHomePage(
                  func: (() {}),
                  nameButtom: 'Empresas Cadastras',
                ),
                ButtomHomePage(
                  func: (() {}),
                  nameButtom: 'Lista de Certificados',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
