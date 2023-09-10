import 'route_names.dart';
import 'package:get/get.dart';
import '../modules/dashboard/home.dart';
import '../modules/examples/screen_1.dart';
import '../modules/examples/screen_2.dart';
import '../modules/examples/screen_3.dart';
import '../modules/examples/screen_4.dart';
import '../modules/examples/screen_5.dart';
import '../modules/examples/screen_6.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteName.home, page: () => const Home()),
        GetPage(name: RouteName.page1, page: () => Screen1()),
        GetPage(name: RouteName.page2, page: () => const Screen2()),
        GetPage(name: RouteName.page3, page: () => const Screen3()),
        GetPage(name: RouteName.page4, page: () => const Screen4()),
        GetPage(name: RouteName.page5, page: () => const Screen5()),
        GetPage(name: RouteName.page6, page: () => const Screen6()),
      ];
}
