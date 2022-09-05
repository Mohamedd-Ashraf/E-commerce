import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../logic/controller/cart_controller.dart';

class CartItem extends StatelessWidget {
  final Product product;
  int index;
  final controller = Get.find<CartController>();
  CartItem({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Get.isDarkMode
              ? pinkClr.withOpacity(0.5)
              : Colors.greenAccent.withOpacity(0.8),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                height: 120,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          product.title,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "\$${controller.productTotalPrice[index].toStringAsFixed(2)}",
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.reduceProductInCart(product);
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          size: 27,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "${controller.productsMap.values.toList()[index]}",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      IconButton(
                        onPressed: () {
                          controller.addProductToCart(product);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  IconButton(
                      onPressed: () {
                        controller.removeOneProductsCart(product);
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.red,
                      ))
                ],
              )
            ]),
      ),
    );
  }
}
