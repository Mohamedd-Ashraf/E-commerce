import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  // final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          "Settings Screen",
          style: TextStyle(color: darkModeFontColor),
        ),
        GetBuilder<AuthController>(builder: (controller) {
          return Column(
            children: [
              IconButton(
                  onPressed: () {
                    
                    Get.defaultDialog(
                  title: "Logout From App",
                  titleStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  middleText: 'Are you sure you need to logout',
                  middleTextStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  // backgroundColor: Colors.grey,
                  radius: 10,
                  textCancel: " No ",
                  cancelTextColor: Colors.black,
                  textConfirm: " YES ",
                  confirmTextColor: Colors.white,
                  onCancel: () {
                    Get.back();
                  },
                  onConfirm: () {
                    controller.signOutFromApp();
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                );
                  },
                  icon: Icon(Icons.logout_rounded)),
                  SizedBox(height: 30,),
                  IconButton(onPressed: (){
                    ThemeController().changeTheme();
                  }, icon: Icon(Icons.dark_mode_outlined , size: 30,))
            ],
          );
        })
      ],
    ));
  }
}
