import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/setting_controller.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);

  final controller = Get.put(SettingController());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      authController.displayUserPhoto.value,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myText(
                    size: 22,
                    fontWeight: FontWeight.bold,
                    text: controller
                        .capitalize(authController.displayUserName.value),
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  
                  ),
                  myText(
                    size: 14,
                    fontWeight: FontWeight.bold,
                    text: authController.displayUserEmail.value,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                   
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}