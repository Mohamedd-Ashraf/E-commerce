import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../logic/controller/product_cotroller.dart';

class SerachBarWidget extends StatelessWidget {
  SerachBarWidget({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
      return TextField(
      keyboardType: TextInputType.text,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      controller: controller.searchTextController,
      
      onChanged: (searchName) {
          controller.addSearchToList(searchName);
        },
       decoration: InputDecoration(

          fillColor: Colors.white,
          focusColor: Colors.red,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
              suffixIcon: controller.searchTextController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clearSearch();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                )
              : null,
           hintText: "Search with name & price",
          hintStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          
          filled: true,
            enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),)
      ),
    );;
    });
  }
}
