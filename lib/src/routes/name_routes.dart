import 'package:app_fullmedcare_v1/src/pages/certificate/register_data_certificate_page_1.dart';
import 'package:app_fullmedcare_v1/src/pages/certificate/register_data_certificate_page_2.dart';
import 'package:app_fullmedcare_v1/src/pages/company/list_companies_page_search.dart';
import 'package:app_fullmedcare_v1/src/pages/company/register_company_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_database_registration/biomedical_equipment/list_databese_biomedical_equipment_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_database_registration/equipment_database_registration_home_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_database_registration/calibration_equipment/list_databese_standard_equipment_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/edit_equipment_standard_page.dart';
import 'package:app_fullmedcare_v1/src/pages/equipment_standard.dart/list_equipment_standart_page.dart';
import 'package:app_fullmedcare_v1/src/pages/home_page/home_page.dart';
import 'package:app_fullmedcare_v1/src/pages/home_page/splash_page.dart';
import 'package:app_fullmedcare_v1/src/pages/units/detail_unit_page.dart';
import 'package:app_fullmedcare_v1/src/pages/units/register_unit_page.dart';
import 'package:app_fullmedcare_v1/src/pages/units/unit_page.dart';
import 'package:get/get.dart';

class NameRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String registerCompany = '/registerCompany';
  static const String listCompanies = '/listCompanies';
  static const String listEquipmentStandard = '/listEquipmentStadard';
  static const String editEquipmentStandard = '/editEquipmentStandard';
  static const String regiterCertificatePage1 = '/registerCertificatePage1';
  static const String regiterCertificatePage2 = '/registerCertificatePage2';
  static const String unitPage = '/unitPage';
  static const String registerUnitPage = '/registerUnitPage';
  static const String detailUnitPage = '/detailUnitPage';
  static const String equipmentDatabaseRegistrationPage = "/equipmentDatabaseRegistrationPage";
  static const String listDatabaseStandardEquipment = "/listDatabaseStandardEquipment";
  static const String listDatabaseBiomedicalEquipment = "/listDatabaseBiomedicalEquipment";
}

class ListRoutes {
  static List<GetPage<dynamic>> listRoutes = [
    GetPage(name: NameRoutes.splash, page: () => SplashPage()),
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
    GetPage(name: NameRoutes.unitPage, page: () => const UnitPage()),
    GetPage(name: NameRoutes.registerUnitPage, page: () => RegisterUnitPage(),),
    GetPage(name: NameRoutes.detailUnitPage, page: () => DetailUnitPage(unit: Get.arguments),),
    GetPage(name: NameRoutes.equipmentDatabaseRegistrationPage, page: () => const EquipmentDatabaseRegistrationHomePage(),),
    GetPage(name: NameRoutes.listDatabaseStandardEquipment, page: () => const ListDatabaseStandardEquipment(),),
    GetPage(name: NameRoutes.listDatabaseBiomedicalEquipment, page: () => const ListDatabaseBiomedicalEquipment(),)
  ];
}
