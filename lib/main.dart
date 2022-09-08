import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

import 'language/localiztion.dart';
import 'routers/router.dart';
import 'uitils/my_string.dart';
import 'view/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init(); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData.light,
      themeMode: ThemeController().themeDataGet,
      darkTheme: themeData.dark,
        locale: Locale(GetStorage().read<String>('lang').toString()),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
      // home: const welcomeScreen(),
      initialRoute: FirebaseAuth.instance.currentUser!=null || GetStorage().read<bool>("loggined")==true ? AppRoutes.main:AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
