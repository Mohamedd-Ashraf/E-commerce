import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/view/screen/product_details.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../logic/controller/cart_controller.dart';
import '../../../logic/controller/category_controller.dart';
import '../../../logic/controller/product_cotroller.dart';
import '../../../uitils/themes.dart';

class CategoryItems extends StatelessWidget {
  final String catehoryTitle;
  CategoryItems({
    required this.catehoryTitle,
    Key? key,
  }) : super(key: key);

  final controller = Get.put(ProductController());

  final cartController = Get.put(CartController());

  final categoryController =   Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(catehoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Obx(() {
        if (categoryController.isAllCategory.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return GridView.builder(

            itemCount: categoryController.categoryList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                  
                  product: categoryController.categoryList[index],
                  onTap: () {
                    Get.to(() => DetailsScreen(
                          product: categoryController.categoryList[index],
                        ));
                  });
            },
          );
        }
      }),
    );
  }

  Widget buildCardItems({

    required Product product,
    required Function() onTap,
  }) {
    return Padding(
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
    );
  }
}