import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../widgets/setting/darkmode_widget.dart';
import '../widgets/setting/logout_wedgit.dart';
import '../widgets/setting/profile_widget.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  // final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          myText(
            size: 18,
            fontWeight: FontWeight.bold,
            text: "GENERAL".tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
         
          ),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          // LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
