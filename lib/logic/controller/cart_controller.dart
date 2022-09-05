import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

import '../../uitils/themes.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;
//   // GetStorage box = GetStorage();
// @override
//  void onInit(){
//   super.onInit();

 
//     final  storedShoppings = box.read('productsMap');
//     print(storedShoppings);
//     Map vmap=json.decode(storedShoppings);
//     print(vmap);

//     // if (storedShoppings != null) {
//     //   // productsMap.values.join(storedShoppings.toString());
//     //   // productsMap.assignAll(storedShoppings);
//     //   productsMap=storedShoppings;
        
//     // }
//  }

  void addProductToCart(Product product) async{
    if (productsMap.containsKey(product)) {
      productsMap[product] += 1;
      print(productsMap.value.toString());
    } else {
      productsMap[product] = 1;
      print(productsMap.value.toString());
    }
    // var paymentsAsMap = productsMap.map((payment) => payment.toJson()).toList();

    // await box.write("productsMap", productsMap.toString());
    // print(storedShoppings);


  }

  void reduceProductInCart(Product product) {
    if (productsMap.containsKey(product) && productsMap[product] == 1) {
      productsMap.removeWhere((key, value) => key == product);
    } else {
      productsMap[product] -= 1;
    }
  }

  void removeOneProductsCart(Product product) {
    productsMap.removeWhere((key, value) => key == product);
  }

  void clearAllProductsCart() {
    Get.defaultDialog(
      title: "Logout From App",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need to logout',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      // backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.black,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        // Get.back();
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productTotalPrice {
    return productsMap.entries.map((e) => e.key.price * e.value).toList();
  }

  get totalProductsPrice {
    return productsMap.entries
        .map((e) => e.key.price * e.value)
        .toList()
        .reduce((value, element) => value + element)
        .toStringAsFixed(2);
  }

  String quantity() {
    if (productsMap.isEmpty) {
      return "0";
    }

    return productsMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => element + value)
        .toString();
  }
}
