import 'package:e_commerce/logic/bindings/auth_binding.dart';
import 'package:e_commerce/view/screen/auth/login_screen.dart';
import 'package:e_commerce/view/screen/auth/signup_screen.dart';
import 'package:get/get.dart';

import '../view/screen/welcome_screen.dart';

class AppRoutes {

static const welcome = Routes.welcomeScreen;

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const welcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const loginScreen(),
    ),GetPage(
      name: Routes.signUpScreen,
      page: () =>  signUpScreen(),
      binding: AuthBinding(),
    )
  ];



}

class Routes {
  static const welcomeScreen ="/welcomeScreen";
  static const loginScreen ="/loginScreen";
  static const signUpScreen ="/signUpScreen";
  
}