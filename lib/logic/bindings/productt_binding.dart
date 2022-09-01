import 'package:e_commerce/logic/controller/product_cotroller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  
  }
  
}