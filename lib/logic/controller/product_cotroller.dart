import 'package:e_commerce/models/product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/services/product_services.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productsList = <Product>[].obs;
  var favouratesList = <Product>[].obs;
  GetStorage box = GetStorage();

  @override
 void onInit(){
  super.onInit();
  getProducts();
 
    List? storedShoppings = box.read<List>('FavouriteList');

    if (storedShoppings != null) {
      favouratesList =
          storedShoppings.map((e) => Product.fromJson(e)).toList().obs;
    }
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

addFavourate(int productId) async {

  var existingId = favouratesList.indexWhere((element) => element.id==productId);

  // print("====================");
  // print(existingId);
  // print("====================");
  if(existingId>=0){
    favouratesList.removeAt(existingId);
    box.remove("FavouriteList");
  }else{

favouratesList.add(productsList.firstWhere((element) => element.id==productId));}
await box.write("FavouriteList", favouratesList);

}

bool  isFavourate(int productId){
return favouratesList.any((element) => element.id==productId);
}

}