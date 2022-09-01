import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/widgets/main/my_card_item.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../widgets/main/serach_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myText(
                        text: "Find Your",
                        size: 28,
                        color: darkModeFontColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      myText(
                        text: "INSPIRATION",
                        size: 28,
                        color: darkModeFontColor,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SerachBarWidget(),
                    ]),
              ),
            ),
             SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myText(text: "Catogires", size: 22, color:Get.isDarkMode?Colors.white:Colors.black),
              
            ),
            MyCardItem(), 

          ],
        ),
      ),
    );
  }
}
