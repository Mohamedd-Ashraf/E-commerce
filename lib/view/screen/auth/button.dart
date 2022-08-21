import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class myButton extends StatelessWidget {
  final Function() onPressed;
  final Widget text;
  Color? color;
  ButtonStyle? style;

   myButton({Key? key, required this.onPressed, required this.text,this.color,this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary:darkModeWidgetColor,
        minimumSize: Size(300, 50),


      ),
      child: text,
    ));
  }
}
