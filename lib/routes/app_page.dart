import 'package:get/get.dart';
import 'package:materials/pages/0_load_db/controller/load_db_c.dart';
import 'package:materials/pages/0_load_db/view/load_db_p.dart';
import 'package:materials/pages/0_welcome/controller/welcome_c.dart';
import 'package:materials/pages/0_welcome/view/welcome_p.dart';
import 'package:materials/pages/1_1_home/controller/home_c.dart';
import 'package:materials/pages/1_1_home/view/home_p.dart';

import 'package:materials/pages/1_2_search/controller/change_log_c.dart';
import 'package:materials/pages/1_2_search/controller/search_controller.dart';
import 'package:materials/pages/1_2_search/view/search_page.dart';
import 'package:materials/pages/1_3_add/controller/add_c.dart';
import 'package:materials/pages/1_3_add/view/add_p.dart';
import 'package:materials/pages/2_sub_classes/controller/sub_classes_c.dart';
import 'package:materials/pages/2_sub_classes/view/sub_classes_p.dart';

import 'package:materials/pages/3_names/controller/names_c.dart';
import 'package:materials/pages/3_names/view/names_page.dart';
import 'package:materials/pages/4_all_info/controller/all_info_controller.dart';
import 'package:materials/pages/4_all_info/controller/chem_c.dart';
import 'package:materials/pages/4_all_info/controller/info_c.dart';
import 'package:materials/pages/4_all_info/view/all_info_p.dart';
import 'package:materials/pages/5_edit/controller/edit_c.dart';
import 'package:materials/pages/5_edit/view/edit_p.dart';

abstract class Routes {
  static const welcome = '/welcome';
  static const loadDB = '/loadDB';
  static const home = '/home';
  static const search = '/search';
  static const subClasses = '/subClasses';
  static const names = '/names';
  static const allInfo = '/allInfo';
  static const edit = '/edit';
  static const add = '/add';
}

class AppPage {
  static final pages = [
    GetPage(
        name: Routes.welcome,
        page: () => const WelcomePage(),
        binding: BindingsBuilder(() {
          Get.put<WelcomeController>(WelcomeController());
        })),
    GetPage(
        name: Routes.loadDB,
        page: () => const LoadDBPage(),
        binding: BindingsBuilder(() {
          Get.put<LoadDBController>(LoadDBController());
        })),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: BindingsBuilder(() {
          Get.put<HomeController>(HomeController());
        })),
    GetPage(
        name: Routes.search,
        page: () => const SearchPage(),
        transition: Transition.downToUp,
        binding: BindingsBuilder(() {
          Get.put<SearchController>(SearchController());
          Get.put<ChangeLogController>(ChangeLogController());
        })),
    GetPage(
        name: Routes.subClasses,
        page: () => const SubClassesPage(),
        binding: BindingsBuilder(() {
          Get.put<SubClassesController>(SubClassesController());
        })),
    GetPage(
        name: Routes.names,
        page: () => const NamesPage(),
        binding: BindingsBuilder(() {
          Get.put<NamesController>(NamesController());
        })),
    GetPage(
        name: Routes.allInfo,
        page: () => AllInfoPage(),
        binding: BindingsBuilder(() {
          Get.put<AllInfoController>(AllInfoController());
          Get.put<InfoController>(InfoController());
          Get.put<ChemController>(ChemController());
        })),
    GetPage(
        name: Routes.edit,
        page: () => const EditPage(),
        binding: BindingsBuilder(() {
          Get.put<EditController>(EditController());
        })),
    GetPage(
        name: Routes.add,
        page: () => const AddPage(),
        binding: BindingsBuilder(() {
          Get.put<AddController>(AddController());
        })),
  ];
}
