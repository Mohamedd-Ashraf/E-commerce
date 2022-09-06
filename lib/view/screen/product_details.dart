import 'package:e_commerce/view/widgets/ProductDetails/add_to_cart.dart';
import 'package:e_commerce/view/widgets/ProductDetails/clothes_info.dart';
import 'package:e_commerce/view/widgets/ProductDetails/image_slider.dart';
import 'package:e_commerce/view/widgets/ProductDetails/size_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImagesSlider(
                image: product.image,
              ),
              ClothesInfo(product:product),SizeList(),AddCart( productModels: product)
            ],
          ),
        ),
      ),
    );
  }
}
