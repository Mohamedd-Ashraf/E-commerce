import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/product_cotroller.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../screen/product_details.dart';
import '../my_text.dart';

class MyCardItem extends StatelessWidget {
  MyCardItem({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  final cartController = Get.put(CartController());
  //  static ScrollController? gridScrollController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor),
        );
      } else {
        return Container(
        margin: EdgeInsets.only(top: 60),
          child: Expanded(
            child: controller.searchList.isEmpty &&
                    controller.searchTextController.text.isNotEmpty
                ? Get.isDarkMode
                    ? Image.asset("assets/images/search_empty_dark.png")
                    : Image.asset("assets/images/search_empry_light.png")
                : GridView.builder(
                  // controller: controller.gridScrollController,
                    itemCount: controller.searchList.isEmpty
                        ? controller.productsList.length
                        : controller.searchList.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 6.0,
                      maxCrossAxisExtent: 200,
                    ),
                    itemBuilder: (context, index) {
                      if (controller.searchList.isEmpty) {
                        return  buildCardItems(
                              product: controller.productsList[index],
                        );
                      } else {
                        return buildCardItems(
                              product: controller.searchList[index],
                        );
                      }
                    },
                  ),
          ),
        );
        ;
      }
    });
  }

  Widget buildCardItems({

    required Product product
  }) {
    return Hero(
      tag: product.id,
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            onTap: () {
              Get.to(DetailsScreen(product: product,));
            },
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
                            onPressed: () {
                              cartController.addProductToCart(product);
                            },
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
          ),
        ),
      ),
    );
  }
}