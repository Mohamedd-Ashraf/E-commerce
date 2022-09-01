import 'package:e_commerce/models/product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/services/product_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productsList = <Product>[].obs;
  @override
 void onInit(){
  super.onInit();
  getProducts();
 }
  getProducts()async{
    var products=    await ProductServices.getProduct();
    try {
      isLoading.value=true;
      if (products.isNotEmpty) {
        productsList.addAll(products);
      } 
    } finally {
      isLoading.value=false;
      
    }

  }

}