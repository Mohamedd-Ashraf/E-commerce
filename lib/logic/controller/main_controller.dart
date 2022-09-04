import 'package:e_commerce/view/screen/category_screen.dart';
import 'package:e_commerce/view/screen/favourate_screen.dart';
import 'package:e_commerce/view/screen/home_screen.dart';
import 'package:e_commerce/view/screen/mainScreen.dart';
import 'package:e_commerce/view/screen/setting_screen.dart';
import 'package:get/get.dart';

class mainScrenController extends GetxController {
  
  RxInt currentIndex = 0.obs ;

  var tabs =[
    HomeScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingsScreen()
  ].obs; 


  
}