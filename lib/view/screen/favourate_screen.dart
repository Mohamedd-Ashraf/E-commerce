import 'package:e_commerce/logic/controller/product_cotroller.dart';
import 'package:e_commerce/uitils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class FavouriteScreen extends StatelessWidget {
   FavouriteScreen({Key? key}) : super(key: key);
    final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx((){
        if (controller.favouratesList.isEmpty) {
          return ListNoFavourates();
        } else {
          return listTheFavourates();
        }
      },
      
     
    ));
  }
 

  Widget ListNoFavourates(){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/heart.png",color: Get.isDarkMode?Colors.white:Colors.black,),
            ),
            SizedBox(height: 20,),
            Text("Please Add Some Items To Your Favourates" , style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
          ],
        ),
      );
  }

  Widget listTheFavourates(){
    return   ListView.separated(
          itemBuilder: (context, index) {
            return BuilFaveItems(product: controller.favouratesList[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
              thickness: 1,
            );
          },
          itemCount: controller.favouratesList.length); 
  } 

  Widget BuilFaveItems({required Product product}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
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
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   product.title,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.price.toString()+"\$",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  controller.addFavourate(product.id);
                },
                icon: controller.isFavourate(product.id)
                          ? Icon(
                              Icons.favorite,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                             
                            )
                          : Icon(Icons.favorite_outline),)
          ],
        ),
      ),
    );
  }
}
