import 'package:badges/badges.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/main_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/screen/cart_screen.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
//TODO  look at this fckn useless change from  final controller = Get.find<MainController>();

  final controller = Get.put(mainScrenController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: Container(),
          backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
          actions: [
            Obx(() => Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    
                    cartController.quantity(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart), onPressed: () {
                        Get.to(CartScreen());
                      }),
                ))
          ],
          title: Text("El Zreebah Shop"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: "",
              icon: Icon(
                Icons.home_outlined,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.widgets,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: "",
              icon: Icon(
                Icons.widgets_outlined,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: "",
              icon: Icon(
                Icons.favorite_outline,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: "",
              icon: Icon(
                Icons.settings_outlined,
              ),
            ),
          ],
          currentIndex: controller.currentIndex.value,
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,

          // ignore: invalid_use_of_protected_member
          children: controller.tabs,
        ),
      );
    }));
  }
}
