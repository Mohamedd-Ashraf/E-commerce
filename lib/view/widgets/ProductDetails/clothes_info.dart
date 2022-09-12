import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../logic/controller/product_cotroller.dart';
import '../../../uitils/themes.dart';

class ClothesInfo extends StatelessWidget {
  final Product product;
  ClothesInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final controller =  Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.addFavourate(product.id);
                    },
                    child: controller.isFavourate(product.id)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              myText(
                size: 22,
                fontWeight: FontWeight.bold,
                text: "${product.rating.rate}",
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(
                width: 8,
              ),
              RatingBar(
                  tapOnlyMode :true,
                   initialRating: product.rating.rate,
                   direction: Axis.horizontal,
                   allowHalfRating: true,
                   itemCount: 5,
                  ratingWidget: RatingWidget(
                      empty: Icon(Icons.star_border_outlined),
                      full: Icon(Icons.star,color: Colors.amber[400],),
                      half: Icon(Icons.star_half,color:Colors.amber[400])),
                  onRatingUpdate: (double) {})
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            product.description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              fontSize: 18,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
