import 'package:concal_app/pages/cal_page.dart';
import 'package:concal_app/pages/history_page.dart';
import 'package:get/get.dart';

part 'paths.dart';

class AppPages {
  static const INITIAL = Routes.MAIN;
  static final routes = [
    GetPage(
      name: Paths.MAIN,
      page: () => CalCulationPage(),
    ),
    GetPage(
      name: Paths.HISTORY,
      page: () =>  HistoryPage(),
    ),
  ];
}
