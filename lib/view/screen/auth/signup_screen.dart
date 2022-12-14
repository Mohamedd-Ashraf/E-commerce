import 'package:firebase_auth/firebase_auth.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../uitils/my_string.dart';
import '../../../uitils/themes.dart';
import 'login_screen.dart';
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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar:
              AppBar(backgroundColor: Get.isDarkMode? darkGreyClr:Colors.white, elevation: 0),
          backgroundColor: Get.isDarkMode? darkGreyClr:Colors.white,
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
                              color: Get.isDarkMode? pinkClr:mainColor),
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
                              return "Enter a Valid E-mail";
                          },
                          prefixIcon: Image.asset("assets/images/email.png",
                              color: Get.isDarkMode? pinkClr:mainColor),
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
                                  color: Get.isDarkMode? pinkClr:mainColor),
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
                                    color: Get.isDarkMode? pinkClr:mainColor,
                                  )),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        checkWidget(
                          text: "I Accept",
                          buttonText: "Terms and Conditions",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return myButton(
                              onPressed: () {
                                if (controller.checkedBox) {
                                  if (formKey.currentState!.validate()) {
                                    String name = nameController.text.trim(),
                                        passowrd = passwordController.text,
                                        email = emailController.text.trim();

                                    controller.signUpUsingFireBase(
                                        name: name,
                                        passowrd: passowrd,
                                        email: email);
                                  }
                                } else {
                                  Get.snackbar(
                                    "Terms Not Accepted !",
                                    "Please Accept Our Terms",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        Color.fromARGB(255, 164, 18, 18),
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              text: myText(
                                  text: "Sign Up",
                                  size: 18,
                                  color:Get.isDarkMode? darkGreyClr:Colors.white,
                                  fontWeight: FontWeight.bold));
                        })
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
