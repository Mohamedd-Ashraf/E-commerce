import 'package:e_commerce/logic/controller/product_cotroller.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../my_text.dart';

class MyCardItem extends StatelessWidget {
  MyCardItem({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor),
        );
      } else {
        return Expanded(
          child: GridView.builder(
              itemCount: controller.productsList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0),
              itemBuilder: (context, index) {
                return buildCardItems(
                    // image: controller.productsList[index].image,
                    // price: controller.productsList[index].price,
                    // rate: controller.productsList[index].rating.rate,
                    product: controller.productsList[index]
                    );
              }),
        );
        ;
      }
    });
  }

  Widget buildCardItems({
    // required String image,
    // required double price,
    // required double rate,
    required Product product
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color:
              Get.isDarkMode ? Color.fromARGB(255, 49, 49, 49) : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3.0,
                blurRadius: 5.0),
          ],
        ),
        child: Column(
          children: [
            Obx((() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.addFavourate(product.id);
                      },
                      icon: controller.isFavourate(product.id)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(Icons.favorite_outline),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                  ],
                ))),
           
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.network(
                product.image,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myText(
                    text: "${product.price}\$",
                    size: 15,
                    color: null,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: 45,
                      height: 22,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 1),
                              child:
                                  myText(text: "${product.rating.rate}", size: 15, color: null),
                            ),
                            Icon(
                              Icons.star,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
