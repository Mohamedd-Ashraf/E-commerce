import 'package:e_commerce/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(Product product) {
    if (productsMap.containsKey(product)) {
      productsMap[product] += 1;
      print(productsMap.value.toString());
    } else {
      productsMap[product] = 1;
      print(productsMap.value.toString());
    }
  }

  void removeProductsfromCart(Product product) {
    if (productsMap.containsKey(product) && productsMap[product] == 1) {
      productsMap.removeWhere((key, value) => key == product);
    } else {
      productsMap[product] = -1;
    }
  }

  void removeOneProductsCart(Product product) {
    productsMap.removeWhere((key, value) => key == product);
  }

  void clearAllProductsCart() {
    productsMap.clear();
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
}
