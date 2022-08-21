// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../uitils/themes.dart';

class AuthTextFormFiels extends StatelessWidget {
  final TextEditingController controller;
  bool? obscureText = false;
  final Function validatoion;
  Widget? prefixIcon;
  Widget? surfixIcon;
  String? hintText;

  AuthTextFormFiels(
      {Key? key,
      this.hintText,
      required this.controller,
      this.obscureText,
      required this.validatoion,
      this.prefixIcon,
      this.surfixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (TextFormField(
      controller: controller,
      // decoration: ,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      obscureText: obscureText ?? false,
      validator: (value) => validatoion(value),
      decoration: InputDecoration(
        fillColor:darkModeFormFieldColor,
        prefixIcon: prefixIcon,
        suffixIcon: surfixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.2), fontSize: 16, fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkModeWidgetColor,),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkModeWidgetColor,),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red,),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red,),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ));
  }
}
