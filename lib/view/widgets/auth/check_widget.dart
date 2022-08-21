import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/uitils/my_string.dart';
import 'package:e_commerce/view/screen/auth/button.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../uitils/themes.dart';

class checkWidget extends StatelessWidget {
  checkWidget({Key? key}) : super(key: key);
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
                  color: darkModeWidgetColor,
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
                  text: "I accept",
                  size: 16,
                  color: darkModeFontColor,
                  fontWeight: FontWeight.normal),
              TextButton(
                onPressed: () {},
                child: myText(
                    text: "Terms and Conditions",
                    decoration: TextDecoration.underline,
                    size: 16,
                    color: darkModeFontColor,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ],
      );
    }));
  }
}
