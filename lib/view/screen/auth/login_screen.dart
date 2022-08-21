import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/screen/auth/forget_password.dart';
import 'package:e_commerce/view/screen/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../uitils/my_string.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/footee_container.dart';
import '../../widgets/auth/text_form_field.dart';
import '../../widgets/my_text.dart';
import 'button.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:
              AppBar(backgroundColor: darkModeBackGroundColor, elevation: 0),
          backgroundColor: darkModeBackGroundColor,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 40, 25, 0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            myText(
                                text: "LOG",
                                size: 28,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              width: 3,
                            ),
                            myText(
                                text: "IN",
                                size: 28,
                                color:
                                    Get.isDarkMode ? Colors.white : darkGreyClr,
                                fontWeight: FontWeight.w500)
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        AuthTextFormFiels(
                          controller: nameController,
                          validatoion: (Value) {
                            if (Value.toString().length >= 2 &&
                                RegExp(validationName).hasMatch(Value)) {
                              return null;
                            } else
                              return "Enter a Valid User Name";
                          },
                          prefixIcon: Image.asset("assets/images/user.png",
                              color: darkModeWidgetColor),
                          hintText: "User Name",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(
                          // init: AuthController(),
                          // initState: (_) {},
                          builder: (_) {
                            return AuthTextFormFiels(
                              controller: passwordController,
                              validatoion: (Value) {
                                if (Value.toString().length >= 6) {
                                  return null;
                                } else
                                  return "Enter a Valid passowrd";
                              },
                              prefixIcon: Image.asset("assets/images/lock.png",
                                  color: darkModeWidgetColor),
                              hintText: "Password",
                              obscureText: !controller.visiblePassword,
                              surfixIcon: IconButton(
                                  onPressed: () {
                                    controller.changeVisiblty();
                                  },
                                  icon: Icon(
                                    controller.visiblePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility,
                                    color: darkModeWidgetColor,
                                  )),
                            );
                          },
                        ),
                        /*         SizedBox(
                          height: 10,
                        ), */

                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Get.to(forgetPassowrd());
                                },
                                child: myText(
                                    text: "Forget Password?",
                                    size: 14,
                                    color: darkModeFontColor,
                                    fontWeight: FontWeight.w600))),
                        /*    SizedBox(
                          height: 10,
                        ), */
                        checkWidget(
                          text: "Remember Me",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myButton(
                          onPressed: () {
                            // Get.isDarkMode.;
                          },
                          text: myText(
                              text: "Log In",
                              size: 18,
                              color: darkModeBackGroundColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        myText(
                            text: "OR",
                            size: 14,
                            color: darkModeFontColor,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: (() {}),
                                child: Image.asset("assets/images/google.png")),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: (() {}),
                                child:
                                    Image.asset("assets/images/facebook.png"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              FooteContainer(
                text: "Don't Have Account ?",
                buttonText: "Create One",
                onPressed: () {
                  Get.to(signUpScreen());
                },
              )
            ]),
          )),
    );
  }
}
