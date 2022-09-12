import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/screen/auth/button.dart';
import 'package:e_commerce/view/widgets/auth/text_form_field.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../uitils/my_string.dart';

class forgetPassowrd extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  final controller = Get.put(AuthController());
  forgetPassowrd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (SafeArea(
        child: Scaffold(
      backgroundColor: darkModeBackGroundColor,
      appBar: AppBar(
        backgroundColor: darkModeBackGroundColor,
        elevation: 0,
        title: myText(
            text: "Forget Password?",
            size: 25,
            color: darkModeWidgetColor,
            fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: (() {
                          Get.back();
                        }),
                        icon: Icon(
                          Icons.close_rounded,
                          color: darkModeFontColor,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "If you want to recover your account , then please provide your E-Mail Below",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: darkModeFontColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/forgetpass copy.png",
                    width: 300,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AuthTextFormFiels(
                    controller: email,
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
                  GetBuilder<AuthController>(builder: (_){
                    return myButton(
                      onPressed: () {
                        controller.resetPassword(email.text);
                      },
                      text: myText(
                          text: "Send",
                          size: 18,
                          color: darkModeBackGroundColor));
                  })
                ],
              ),
            )),
      ),
    )));
  }
}