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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(backgroundColor: Colors.white , elevation: 0),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 40, 25, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          myText(
                              text: "SIGN",
                              size: 28,
                              color: mainColor,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            width: 3,
                          ),
                          myText(
                              text: "UP",
                              size: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      AuthTextFormFiels(
                        controller: nameController,
                        validatoion: (){},
                        prefixIcon: Image.asset("assets/images/user.png"), 
                        hintText: "User Name",

                      ),
                      SizedBox(height: 20,)
                      ,
                      AuthTextFormFiels(
                        controller: emailController,
                        validatoion: (){},
                        prefixIcon: Image.asset("assets/images/email.png"), 
                        hintText: "E-mail",

                      ),
                      SizedBox(height: 20,)
                      ,
                      AuthTextFormFiels(
                        controller: passwordController,
                        validatoion: (){},
                        prefixIcon: Image.asset("assets/images/lock.png"), 
                        hintText: "Password",
                        obscureText: true ,

                      ),
                      SizedBox(height: 30,),
                       
                      checkWidget(),
                      SizedBox(height: 20,),
                       
                      myButton(onPressed: (){}, text: myText(text: "Sign Up", size: 18, color: Colors.white, fontWeight: FontWeight.bold))
      
                      
                    ],
                  ),
                ),
              ),
              FooteContainer(text: "Have Account Already ?", buttonText: "Log In", onPressed: () {
                Get.to(loginScreen());
              },)
            ]),
          )),
    );
  }
}
