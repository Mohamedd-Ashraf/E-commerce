import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/uitils/my_string.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/footee_container.dart';
import '../../widgets/auth/text_form_field.dart';
import '../../widgets/my_text.dart';
import 'button.dart';

class signUpScreen extends StatelessWidget {
  signUpScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:
              AppBar(backgroundColor: darkModeBackGroundColor, elevation: 0),
          backgroundColor: darkModeBackGroundColor,
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
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
                                text: "SIGN",
                                size: 28,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              width: 3,
                            ),
                            myText(
                                text: "UP",
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
                              return "Enter a Valid Name";
                          },
                          prefixIcon: Image.asset("assets/images/user.png",
                              color: darkModeWidgetColor),
                          hintText: "User Name",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AuthTextFormFiels(
                          controller: emailController,
                          validatoion: (Value) {
                            if (RegExp(validationEmail).hasMatch(Value)) {
                              return null;
                            } else
                              return "Enter a Valid Name";
                          },
                          prefixIcon: Image.asset("assets/images/email.png",
                              color: darkModeWidgetColor),
                          hintText: "E-mail",
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
                        SizedBox(
                          height: 30,
                        ),
                        checkWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        myButton(
                            onPressed: () {
                              // Get.isDarkMode.;
                            },
                            text: myText(
                                text: "Sign Up",
                                size: 18,
                                color: darkModeBackGroundColor,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ),
              FooteContainer(
                text: "Have Account Already ?",
                buttonText: "Log In",
                onPressed: () {
                  Get.to(loginScreen());
                },
              )
            ]),
          )),
    );
  }
}
