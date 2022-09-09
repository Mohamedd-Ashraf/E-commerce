import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/product_cotroller.dart';
import 'package:get/get.dart';

import '../controller/category_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies()async {
  await  Get.put(ProductController());
  Get.lazyPut(() => CartController());
  Get.put(CategoryController());
  // Get.put(PaymCo());

  }
  
}