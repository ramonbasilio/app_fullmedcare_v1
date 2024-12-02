import 'package:app_fullmedcare_v1/src/pages/company/list_companies_page_search.dart';
import 'package:app_fullmedcare_v1/src/pages/company/register_company_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/home_equipment_standart_page.dart';

import 'package:app_fullmedcare_v1/src/pages/home_page/home_page.dart';
import 'package:get/get.dart';

class NameRoutes {
  static const String home = '/home';
  static const String registerCompany = '/registerCompany';
  static const String listCompanies = '/listCompanies';
  static const String homeEquipmentStadard = '/homeEquipmentStadard';
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
        name: NameRoutes.homeEquipmentStadard,
        page: () => const HomeEquipmentStandartPage()),
  ];
}
