import 'package:e_commerce/uitils/themes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'routers/router.dart';
import 'view/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      darkTheme: themeData.dark,
      // home: const welcomeScreen(),
      initialRoute: Routes.welcomeScreen,
      getPages: AppRoutes.routes,
    );
  }
}
