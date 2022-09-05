import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/screen/auth/button.dart';
import 'package:e_commerce/view/screen/mainScreen.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../widgets/cart/cart_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Cart Items",
        ),
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.clearAllProductsCart();
              },
              icon: Icon(Icons.remove_shopping_cart_outlined))
        ],
      ),
      body: showCartItems(),
    ));
  }

  Widget ShowNoItemsInCart() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myText(
                  text: "Your Cart is",
                  size: 33,
                  color: null,
                  fontWeight: FontWeight.bold,
                ),
                myText(
                  text: " Empty",
                  size: 35,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  fontWeight: FontWeight.w900,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            myText(
              text: "Add Items To Get Started",
              size: 18,
              color: null,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(MainScreen());
              },
              child: Text(
                "Go to Home",
                style: TextStyle(fontSize: 25),
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(Size(180, 60)),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Get.isDarkMode ? pinkClr : mainColor),
                  overlayColor: MaterialStateProperty.all<Color>(
                      Get.isDarkMode ? mainColor : pinkClr),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.white)))),
            )
          ],
        ),
      ),
    );
  }

  Widget showCartItems() {
    return Obx(() {
      if (controller.productsMap.isEmpty) {
        return ShowNoItemsInCart();
      } else {
        return SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 600,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CartItem(
                      index: index,
                      product: controller.productsMap.keys.toList()[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                  itemCount: controller.productsMap.length),
            ),
            Card(
              elevation: 10,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${controller.totalProductsPrice}",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Check Out",
                            style: TextStyle(fontSize: 28),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.shopping_cart,
                            size: 28,
                          )
                        ],
                      ),
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all<Color>(
                              Get.isDarkMode ? mainColor : pinkClr),
                          fixedSize:
                              MaterialStateProperty.all<Size>(Size(220, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Get.isDarkMode ? pinkClr : mainColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                    )
                  ],
                ),
              ),
            )
          ]),
        );
      }
    });
  }

// Widget cartBody() {

// }
}
