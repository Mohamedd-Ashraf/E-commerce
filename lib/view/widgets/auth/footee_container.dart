// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FooteContainer extends StatelessWidget {
  final String text;

  final Function() onPressed;
  String? buttonText;
  FooteContainer({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Get.isDarkMode? pinkClr:mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          myText(
              text: text,
              size: 20,
              color: Get.isDarkMode? darkGreyClr:Colors.white,
              fontWeight: FontWeight.bold),
          TextButton(
            onPressed: onPressed,
            child: myText(
                text: buttonText ?? "",
                size: 20,
                color:Get.isDarkMode? darkGreyClr:Colors.white,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    ));
  }
}
