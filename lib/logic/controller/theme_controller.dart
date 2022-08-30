import 'package:e_commerce/uitils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final String key = "isDarkModes";
  saveThemeDataInBox(bool isDarkMode) {
    boxStorage.write(key, isDarkMode);
  }

  bool getThemeDataFromBox() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>    getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;


  void changeTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
