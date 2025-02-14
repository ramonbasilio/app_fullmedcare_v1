import 'package:app_fullmedcare_v1/src/pages/certificate/register_data_certificate_page_1.dart';
import 'package:app_fullmedcare_v1/src/pages/certificate/register_data_certificate_page_2.dart';
import 'package:app_fullmedcare_v1/src/pages/company/list_companies_page_search.dart';
import 'package:app_fullmedcare_v1/src/pages/company/register_company_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/edit_equipment_standard_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/list_equipment_standart_page.dart';

import 'package:app_fullmedcare_v1/src/pages/home_page/home_page.dart';
import 'package:get/get.dart';

class NameRoutes {
  static const String home = '/home';
  static const String registerCompany = '/registerCompany';
  static const String listCompanies = '/listCompanies';
  static const String listEquipmentStandard = '/listEquipmentStadard';
  static const String editEquipmentStandard = '/editEquipmentStandard';
  static const String regiterCertificatePage1 = '/registerCertificatePage1';
  static const String regiterCertificatePage2 = '/registerCertificatePage2';
}

class ListRoutes {
  static List<GetPage<dynamic>> listRoutes = [
    GetPage(name: NameRoutes.home, page: () => const HomePage()),
    GetPage(
        name: NameRoutes.registerCompany, page: () => RegisterCompanyPage()),
    GetPage(
        name: NameRoutes.listCompanies,
        page: () => const ListCompaniesPageSearch()),
    GetPage(
        name: NameRoutes.listEquipmentStandard,
        page: () => const ListEquipmentStandartPage()),
    GetPage(
        name: NameRoutes.editEquipmentStandard,
        page: () => EditEquipmentStandardPage(
              equipmentStandard: Get.arguments,
            )),
    GetPage(
        name: NameRoutes.regiterCertificatePage1,
        page: () => const RegisterDataCertificatePage1()),
    GetPage(
        name: NameRoutes.regiterCertificatePage2,
        page: () => RegisterDataCertificatePage2(
              dataCertificatePg1: Get.arguments,
            )),
  ];
}
