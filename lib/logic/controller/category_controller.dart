import 'package:e_commerce/models/product_model.dart';
import 'package:get/get.dart';

import '../../services/category_services.dart';


class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <Product>[].obs;

  var isCatgeoryLoading = false.obs;
  var isAllCategory = false.obs;

  List<String> imageCategory = [
    "https://www.ieee.org/content/dam/ieee-org/ieee/web/org/homecarousel/hero/homepage-hero-aug-2022.jpg",
    "https://www.hazoorilaljewellers.com/wp-content/uploads/2022/02/01-1.jpg",
    "https://img.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19720.jpg?w=1060&t=st=1662935924~exp=1662936524~hmac=ad09f7d010f70d1d1c6227b12a8d79de4d1fd0483156902e7ccfcc4846037651",
    "https://i.ytimg.com/vi/19X4olX3d1Q/maxresdefault.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCatgeoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCatgeoryLoading(false);
    }
  }

  getAllCategorys(String namecategory) async {
    isAllCategory(true);
    categoryList.value =
        await AllCategorySercvises.getAllCatehory(namecategory);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}