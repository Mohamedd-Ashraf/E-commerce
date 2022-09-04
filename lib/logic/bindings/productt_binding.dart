import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/product_cotroller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies()async {
  await  Get.put(ProductController());
  Get.lazyPut(() => CartController());
  
  }
  
}