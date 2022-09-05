import 'package:e_commerce/logic/bindings/cart_binding.dart';
import 'package:e_commerce/logic/bindings/main_binding.dart';
import 'package:e_commerce/logic/bindings/productt_binding.dart';
import 'package:e_commerce/logic/controller/product_cotroller.dart';
import 'package:e_commerce/view/screen/auth/forget_password.dart';
import 'package:e_commerce/view/screen/cart_screen.dart';
import 'package:e_commerce/view/screen/mainScreen.dart';

import '../logic/bindings/auth_binding.dart';
import '../view/screen/auth/login_screen.dart';
import '../view/screen/auth/signup_screen.dart';
import 'package:get/get.dart';

import '../view/screen/welcome_screen.dart';

class AppRoutes {

static const welcome = Routes.welcomeScreen;
static const main = Routes.mainScreen;

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const welcomeScreen(),
    ),
    GetPage(
      name: Routes.authForgetPassWord,
      page: () =>  forgetPassowrd(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () =>  loginScreen(),
      binding: AuthBinding(),

    )
    ,GetPage(
      name: Routes.signUpScreen,
      page: () =>  signUpScreen(),
      binding: AuthBinding(),
    )
    ,GetPage(
      name: Routes.cartScreen,
      page: () =>  CartScreen(),
      bindings:[AuthBinding(),ProductBinding(),CartBinding()],
    )
    ,GetPage(
      name: Routes.mainScreen,
      page: () =>  MainScreen(),
      bindings: [AuthBinding(),mainScreenbning(),ProductBinding()]
    )
  ];



}

class Routes {
  static const welcomeScreen ="/welcomeScreen";
  static const loginScreen ="/loginScreen";
  static const signUpScreen ="/signUpScreen";
  static const authForgetPassWord ="/forgetPassowrd";
  static const mainScreen ="/mainScreen";
  static const cartScreen ="/cartScreen";
  
}