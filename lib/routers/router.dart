import 'package:get/get.dart';

import '../view/screen/welcome_screen.dart';

class AppRoutes {

static const welcome = Routes.welcomeScreen;

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const welcomeScreen(),
    )
  ];



}

class Routes {
  static const welcomeScreen ="/welcomeScreen";
  
}