import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/my_text.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: myText(
            text: "Sign Up",
            size: 50,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
