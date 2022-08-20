import 'package:e_commerce/view/screen/auth/button.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class checkWidget extends StatelessWidget {
  const checkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: (Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset('assets/images/check.png'),
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
                color: Colors.black,
                fontWeight: FontWeight.normal),
            TextButton(
                onPressed: () {},
                child:  myText(
                text: "Terms and Conditions",
                decoration: TextDecoration.underline,
                size: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal),)
          ],
        ),
      ],
    );
  }
}
