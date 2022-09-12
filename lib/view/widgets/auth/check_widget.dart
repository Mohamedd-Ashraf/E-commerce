// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../uitils/my_string.dart';
import '../../../uitils/themes.dart';
import '../../screen/auth/button.dart';
import '../my_text.dart';

class checkWidget extends StatelessWidget {
    String? text , buttonText ;
  checkWidget({
    Key? key,
     this.text,
     this.buttonText,
  }) : super(key: key);
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return (GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.changeChecked();
            },
            child: (Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                child:controller.checkedBox?
                    Image.asset(
                  'assets/images/check.png',
                  color: Get.isDarkMode? pinkClr:mainColor,
                )
                : Container(),
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              myText(
                  text: text??"",
                  size: 16,
                  color: Get.isDarkMode? Colors.white:darkGreyClr,
                  fontWeight: FontWeight.normal),
              TextButton(
                onPressed: () {},
                child: myText(
                    text: buttonText??"",
                    decoration: TextDecoration.underline,
                    size: 16,
                    color: Get.isDarkMode? Colors.white:darkGreyClr,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ],
      );
    }));
  }
}
