// ignore_for_file: unnecessary_import

import 'package:e_commerce/routers/router.dart';
import 'package:e_commerce/view/screen/auth/button.dart';
import 'package:e_commerce/view/screen/auth/login_screen.dart';
import 'package:e_commerce/view/screen/auth/signup_screen.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../uitils/themes.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/Zreebah.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 250,),
                // Container(
                //   height: 60,
                //   width: 190,
                //   // decoration: BoxDecoration(
                //   //   color: Colors.black.withOpacity(0.3),
                //   //   borderRadius: BorderRadius.circular(5),
                //   // ),
                //   child: Center(
                //     child: myText(
                //         text: "Welcome",
                //         size: 35,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   height: 60,
                //   width: 230,
                //   decoration: BoxDecoration(
                //     color: Colors.black.withOpacity(0.3),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       myText(
                //           text: "Zreebah",
                //           size: 35,
                //           color: mainColor,
                //           fontWeight: FontWeight.bold),
                //       SizedBox(
                //         width: 7,
                //       ),
                //       myText(
                //           text: "Shop",
                //           size: 35,
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold)
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 180,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: myButton(
                      onPressed: () {
                        Get.toNamed(Routes.loginScreen);
                      },
                      text: myText(
                          text: "Get Started",
                          size: 20,
                          color: Get.isDarkMode? darkGreyClr:Colors.white)),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myText(
                        text: "Dont\'t Have Account ?",
                        size: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.signUpScreen);
                      },
                      child: myText(
                          decoration: TextDecoration.underline,
                          text: "Get One Now",
                          size: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
