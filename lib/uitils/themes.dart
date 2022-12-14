import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color mainColor = Color(0xff00BE84);
const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947F);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color.fromARGB(255, 237, 185, 197);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);
Color darkModeBackGroundColor = Get.isDarkMode? darkGreyClr:Colors.white;
Color darkModeFontColor= Get.isDarkMode? Colors.white:darkGreyClr;
Color darkModeWidgetColor = Get.isDarkMode? pinkClr:mainColor;
Color darkModeFormFieldColor = Get.isDarkMode? Colors.grey.shade400:Colors.grey.shade200;


class themeData{
  static final light = ThemeData(
    primaryColor: mainColor, 
    backgroundColor:Colors.white, 
    brightness: Brightness.light
  );

  static final dark = ThemeData(
    primaryColor: pinkClr, 
    backgroundColor:darkGreyClr, 
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(color: pinkClr),

    
  );

}

